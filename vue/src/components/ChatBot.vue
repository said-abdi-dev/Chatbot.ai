<template>
  <section class="chat-box">
    <section class="chat-box-list-container" ref="chatbox">
      <div class="vertical-buttons">

        <button class="custom-button" @click="handleButton1">"What is java?"</button>
        <button class="custom-button" @click="handleButton2"> "I wnat to know about java"</button>
        <button class="custom-button" @click="handleButton3">Button 3</button>
        <button class="custom-button" @click="handleButton4">Button 4</button>
      </div>
      <ul class="chat-box-list">
        <li v-if="messages.length == 0" class="message-content">
          <div class="bot-image">
            <img src="img/botIcon.png" alt="Bot Icon" class="message-icon" />
          </div>
          Hello, how can I help you?
        </li>

        <li
          class="message"
          v-for="message in messages"
          :key="messages.indexOf(message)"
          :class="message.author"
        >
          <div
            class="message-container"
            v-if="message.author === 'request-box'"
          >
            <!-- User message -->

            <div class="message-content">
              <p class="message-text">{{ message.text }}</p>

              <!-- <p class="time user">{{ currentTime }}</p> -->
            </div>
          </div>

          <div class="message-container" v-else>
            <!-- Bot message -->
            <div class="bot-image">
              <img src="img/botIcon.png" alt="Bot Icon" class="message-icon" />
            </div>

            <div class="message-content">
              <span class="">
                <p v-html="message.text" class="message-text"></p>
              </span>

              <!-- <p>{{ sendLinkMessage }}</p> -->

              <!-- <p class="time bot">{{ currentTime }}</p> -->

              <!-- <a v-if=""> -->
            </div>
          </div>
        </li>
      </ul>
    </section>
    <div class="chat-inputs">
      <input type="text" v-model="message" @keyup.enter="sendMessage" />

      <button @click="sendMessage">Send</button>
    </div>
  </section>
</template>

<script>
import ChatBotResponseService from "../services/ChatbotResponseService";
import LinkedInService from "../services/LinkedInService";

export default {
  name: "ChatBox",

  data() {
    return {
      // currentTime: '',

      message: "",
      messages: [],
      showGreeting: true,
    };
  },
  created() {
  },
  methods: {

    handleButton1() {
      
      console.log("reached button1");
    },
    
    handleButton2() {
      console.log("reached button1");
    },
    handleButton3() {
      console.log("reached button1");
    },
    handleButton4() {
      console.log("reached button1");
    },
    sendMessage() {
      const message = this.message;
      // this.currentTime = this.formattedTimestamp()

      this.messages.unshift({
        text: message,
        author: "request-box", //this is coming from the user as a response.
      });

      this.message = "";
        if (message.includes('jobs')) {
          //THIS logs, it just messes up, we need to change our api 
        LinkedInService.getJob(message).then( response =>{
        console.log(response.data.data[0].url)
        this.messages.unshift({
          text: response.data.data[0].url,
          author: 'response-box' //this is coming from the chatbot as a response. 
         })
         });
        }
        else {
      ChatBotResponseService.getChatbotResponse(message)
        .then((response) => {
          //this.showGreeting = false;
          this.messages.unshift({
            text: response.data.chatbotResponse,

            author: "response-box", //this is coming from the chatbot as a response.
          });
        }).catch(err => {
        console.error(err);
      })
        }
        this.$nextTick(() => {
          this.$refs.chatbox.scrollTop = this.$refs.chatbox.scrollHeight
        })  
    
    
},
  },
};
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
  color: white;
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
  border: 3px solid rgb(14, 11, 11);
  width: 38vw;
  height: 95vh;
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

.custom-button {
 display: block;
    width:350px;
    margin:20px auto;
    padding:7px 13px;
    text-align:center;
  
    background: gray;
    font-size:20px;
    font-family: 'Arial', sans-serif;
    color:#ffffff;
    white-space: nowrap;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.custom-button:hover {
  background-color: rgb(133, 47, 47); /* Change background on hover */
  
}

input {
  line-height: 3;
  width: 100%;
  border: 3px solid rgb(7, 5, 5);
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
  background: #0070c8;
  border-color: #999;
  border-bottom: none;
  border-right: none;
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
  background-color: white;
  border-radius: 50%;
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
    line-height: 1.4;
    margin-bottom: 6px;
  }
}

.chat-box-list-container::-webkit-scrollbar {
  width: 0.8rem;
  background-color: transparent;
}

.chat-box-list-container::-webkit-scrollbar-thumb {
  background-color: gray;
}
.greeting {
  margin: 10px;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 10px;
}
</style>
