<template>
  <section class="chat-box">
    <div class="chat-box-list-container" ref="chatbox">
      <ul class="chat-box-list">
        <li
          class="message"
          v-for="(message, idx) in messages"
          :key="idx"
          :class="message.author"
        >   
          <section class="message-section">
            
            <p class="content_paragraph">{{ message.text }} 
             </p>
             <p class="time">{{formattedTimestamp}}</p>
             

                
        </section>
         
         
        </li>
      </ul>
    </div>
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
        author: 'client'
      })

      this.message = '';
      ChatBotResponseService.getChatbotResponse(message)
      .then(response => {
        console.log(response);
        this.messages.push({
          text: response.data.chatbotResponse,
          author: 'server'
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

.chat-box,
.chat-box-list {
  display: flex;
  flex-direction: column;
  list-style-type: none;
}

.chat-box-list-container {
  overflow: scroll;
  margin-bottom: 2px;
}
.time{
  padding-top: 10px;
  text-align: right;


}
.chat-box-list {
  padding-left: 15px;
  padding-right: 15px;

  .content_paragraph {
    padding: 10px;
    color: white;
    border-radius: 6px;
    text-align: right;
    width: 55%;
    background-color: rgb(194, 99, 21);
 
  }

  .server {
    span {
      background: gray;
      color: rgb(148, 20, 20);     
    }
    .content_paragraph {
      float: left;
      padding: 22px;
      font-size: 1.4rem;
      background-color:#705cf6;
      padding: auto;
      margin: auto;
      border-radius: 12px;
      width: 60%;
      


    }
  }

  .client {
    span {
      background: rgb(112, 117, 121)
      
    }
    p {
      float: right;
      word-spacing: 2px;
      font-size: 1.3rem;

    }
  }
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
  border-radius: 20px;
 -webkit-box-shadow: 1.5px 1.7px 2px 3px #ccc;  /* Safari 3-4, iOS 4.0.2 - 4.2, Android 2.3+ */
  -moz-box-shadow:    1.5px 1.5px 1.4px 3px #ccc;  /* Firefox 3.5 - 3.6 */
  box-shadow:         2px 2px 3px 3px #ccc;  /* Opera 10.5, IE 9, Firefox 4+, Chrome 6+, iOS 5 */
  
}

.chat-inputs {
  display: flex;
  
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
    font-size: 1.2rem;
  
    
  }
}
</style>