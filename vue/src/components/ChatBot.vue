<template>
  <section class="chat-box">
    <section class="chat-box-list-container" ref="chatbox">
      <ul class="chat-box-list">
        <span
          class="message"
          v-for="(message, idx) in messages"
          :key="idx"
          :class="message.author"
        >
          <p>
            {{ message.text }}   
          </p>
          <!-- <br>
          <p class="time">{{formattedTimestamp}}</p> -->
        </span>
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

      this.messages.push({
        text: message,
        author: 'request-box'
      })

      this.message = '';
      ChatBotResponseService.getChatbotResponse(message)
      .then(response => {
        console.log(response);
        this.messages.push({
          text: response.data.chatbotResponse,
          author: 'response-box'
        })

        this.$nextTick(() => {
          this.$refs.chatbox.scrollTop = this.$refs.chatbox.scrollHeight
        })  
      }).catch(err => {
        console.error(err);
      })
    },
  
      
    
  },
  computed:{
   formattedTimestamp() {
     let time = '';
      const date = new Date();
      if(date.getMinutes() <10){
     time= date.getHours() + ':' + '0'+ date.getUTCMinutes();
      }
      else{
     time= date.getHours() + ':' + date.getUTCMinutes();
      }
        return time // TODO
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
  justify-content: flex-end;
}

.chat-box-list-container {
  overflow: scroll;
  margin-bottom: 2px;
}
.time {
  padding-top: 10px;
  text-align: right;
}
.chat-box-list {
  display: flex;
  flex-direction: column-reverse;
  align-items: flex-start; /* Align items to the left side */
  padding-left: 15px;
  padding-right: 15px;
}

.response-box,
.request-box {
  max-width: 80%;
  margin-bottom: 1rem;
  display: inline-block;
  word-wrap: break-word; /* Ensure long text wraps within the box */
  padding: 1rem;
  margin: 1rem;
}

.response-box {
  font-size: 1.4rem;
    text-align: left;

  background-color: #8effff;
  border-radius: 12px;
  align-self: flex-start; /* Align the response box to the left */
}

.response-box p {
  text-align: left;
}

.request-box {
  width: auto; /* Let the width adjust to the content */
  text-align: left;
  font-size: 1.3rem;
  background-color: rgb(255, 183, 183);
  border-radius: 12px;
  align-self: flex-end; /* Align the request box to the right */
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
    width: 145px;
    color: white;
    background: #0070C8;
    border-color: #999;
    border-bottom: none;
    border-right:none;
    border-radius: 18px;
  }
</style>