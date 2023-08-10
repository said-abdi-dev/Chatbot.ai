<template>
  <section class="chat-box">
    <section class="chat-box-list-container" ref="chatbox">
      <ul class="chat-box-list">
        <li
          class="message"
          v-for="(message, idx) in messages"
          :key="idx"
          :class="message.author">
          <div class="message-container" v-if="message.author === 'request-box'">
            <!-- User message -->
            <div class="user-image">
              <img src="img/userIcon.png" alt="User Icon" class="message-icon" />
            </div>
            <div class="message-content">
              <p class="message-text">{{ message.text }}</p>
              <p class="time user">{{ formattedTimestamp }}</p>
            </div>
          </div>
          <div class="message-container" v-else>
            <!-- Bot message -->
            <div class="bot-image">
              <img src="img/botIcon.png" alt="Bot Icon" class="message-icon" />
            </div>
            <div class="message-content">
              <p class="message-text">{{ message.text }}</p>
              <p class="time bot">{{ formattedTimestamp }}</p>
            </div>
          </div>
        </li>
      </ul>
    </section>
    <div class="chat-inputs">
      <input
        type="text"
        v-model="message"
        @keyup.enter="sendMessage"
      />
      <button @click="sendMessage">Send</button>
    </div>
  </section>
</template>

<script>
import ChatBotResponseService from '../services/ChatbotResponseService'

export default {
  name: 'ChatBox',
  data: () => ({
    message: '',
    messages: []
  }),
  methods: {
    sendMessage() {
      const message = this.message

     this.$store.commit('ADD_TO_CONV_HISTORY', {
     text: message // Use the message's text property
  });
      this.messages.unshift({
        text: message,
        author: 'request-box'
      })

      this.message = '';
      let entireConversation = [];
      this.$store.state.conversationHistory.forEach(element => {
        entireConversation.push(element.text);
      })
      ChatBotResponseService.getChatbotResponse(message, entireConversation)
      .then(response => {
        this.messages.unshift({
          text: response.data.chatbotResponse,
          author: 'response-box'
        })

        this.$nextTick(() => {
          this.$refs.chatbox.scrollTop = this.$refs.chatbox.scrollHeight
        })  
      }).catch(err => {
        console.error(err);
      })
    }
  },
  computed: {
    formattedTimestamp() {
      const now = new Date();
      const estOffset = -5;
      const estTime = new Date(now.getTime() + estOffset * 3600000);

      const hours = estTime.getHours();
      const minutes = estTime.getMinutes();

      const formattedTime = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;

      return formattedTime;
    }
  }
}
</script>


<style scoped lang="scss">

p {
  display: inline;
}

div {
  display: inline-block;
}

.chat-box,
.chat-box-list {
  display: flex;
  flex-direction: column-reverse;
  flex-direction: column;
  list-style-type: none;
}

.message {
  display: flex;
  justify-content: space-between;
}

.chat-box-list-container {
  overflow: scroll;
  margin-bottom: 2px;
}

 .time.user {
.time.user {
  font-size: 0.8rem;
  color: #999;
  align-self: flex-end;
  margin-top: 4px;
}

}

.time.bot {
  font-size: 0.8rem;
  color: #999;
  align-self: flex-end;
  margin-top: 4px;
}



.chat-box-list {
  display: flex;
  flex-direction: column-reverse;
  align-items: flex-start; 
  padding-left: 15px;
  padding-right: 15px;
}

.response-box,
.request-box {
  max-width: 80%;
  margin-bottom: 1rem;
  display: inline-block;
  word-wrap: break-word; 
  padding: 1rem;
  margin: 1rem;
}

.response-box {
  width: auto;
  font-size: 1.3rem;
  text-align: left;
  background-color: #1a1615;
  color: #f0f0f0;
  border-radius: 12px;
  align-self: flex-start; 
}

.response-box p {
  text-align: left;
}

.request-box {
  width: auto; 
  text-align: left;
  font-size: 1.3rem;
  background-color: rgb(19, 84, 224);
  border-radius: 12px;
  color: #f0f0f0;
  align-self: flex-end; 
}

.request-box p {
  font-size: 1.3rem;
  text-align: left;
  margin-left: 1rem;
  margin-right: 1rem;
}


  .chat-box {
    margin: 10px;
    border: 2px solid #999;
    width: 75vw;
    height: 75vh;
    border-radius: 10px;
    margin-left: auto;
    margin-right: auto;
    align-items: space-between;
    justify-content: space-between;
    border-radius: 10px;
  }
  .chat-box-list li {
    margin-bottom: 1.5rem;
  }

  .chat-inputs {
    display: flex;
  }

  input {
    line-height: 3;
    width: 100%;
    border: 2px solid #999;
    border-left: none;
    border-bottom: none;
    border-right: none;
    border-bottom-left-radius: 4px;
    padding-left: 12px;
    border-radius: 12px;
    font-size: 1.5rem;
  }

  button {
    font-size: 21px;
    width: 145px;
    color: white;
    background: #0070C8;
    border-color: #999;
    border-bottom: none;
    border-right:none;
    border-radius: 18px;
  }
  .message-container {
  display: flex;
  align-items: center;
  margin: 10px;
}

.message-icon {
  width: 40px;
  height: 40px;
  margin-right: 10px;
  background-color: white; /* Change this color to your desired color */
  border-radius: 50%
  
}

.user-message {
  justify-content: flex-start;
}

.bot-message {
  justify-content: flex-end;
}

.message-text {
  
.message-text {
  background-color: #f0f0f0;
  padding: 8px;
  border-radius: 10px;
  max-width: 70%;
  line-height: 1.4; /* Add this line to control line spacing */
  margin-bottom: 6px; /* Add this line to add spacing between paragraphs */
}
}


  .chat-box-list-container::-webkit-scrollbar {
  width: 0.8rem; 
  background-color: transparent;

}

.chat-box-list-container::-webkit-scrollbar-thumb {
  background-color: gray; 
}
</style>
