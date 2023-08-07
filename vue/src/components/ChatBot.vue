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
          <p>
            <span>{{ message.text }} </span>
                
          </p>
          <br>
          <p class="time">{{formattedTimestamp}}</p>

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

      this.message = ''

      this.$axios.get(`https://www.cleverbot.com/getreply?key=CC8uqcCcSO3VsRFvp5-uW5Nxvow&input=${message}`)
      .then(respose => {
        this.messages.push({
          text: respose.data.output,
          author: 'server'
        })

        this.$nextTick(() => {
          this.$refs.chatbox.scrollTop = this.$refs.chatbox.scrollHeight
        })  
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

  span {
    padding: 10px;
    color: white;
    border-radius: 6px;
  }

  .server {
    span {
      background: gray;
      color: white;

      
    }
    p {
      float: left;
            font-size: 1.3rem;

    }
  }

  .client {
    span {
      background: #0070C8; 
      
    }
    p {
      float: right;
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
  border-radius: 10px;
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
  
    
  }
}
</style>