<template>
  <main class="rootTemplateTag">
    <section class="chat-box">
      <section class="chat-box-list-container" ref="chatbox">
        <div class="vertical-buttons">
          <button
            class="custom-button"
            @click="handleSuggestionButton()"
            v-if="subjectContext != '0'"
          >
            {{ variableContext }}
          </button>
        </div>
        <ul class="chat-box-list">
          <li v-if="messages.length == 0" class="message-content">
            <div class="text-and-image-container">
              <div class="bot-image">
                <img
                  src="img/botIcon.png"
                  alt="Bot Icon"
                  class="message-icon"
                />
              </div>

              <p class="message-text">Hello, how can I help you?</p>
            </div>
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
              </div>
            </div>

            <div class="text-and-image-container" v-else>
              <div class="bot-image">
                <img
                  src="img/botIcon.png"
                  alt="Bot Icon"
                  class="message-icon"
                />
              </div>
              <div class="message-container">
                <!-- Bot message -->
                <div class="message-content">
                  <p v-html="message.text" class="message-text"></p>
                </div>
              </div>
              <div
                class="btn-wrapper"
                v-if="messages.length != 0"
                @click="speakResponse"
              >
                <svg
                  class="btn-standard"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M19.114 5.636a9 9 0 010 12.728M16.463 8.288a5.25 5.25 0 010 7.424M6.75 8.25l4.72-4.72a.75.75 0 011.28.53v15.88a.75.75 0 01-1.28.53l-4.72-4.72H4.51c-.88 0-1.704-.507-1.938-1.354A9.01 9.01 0 012.25 12c0-.83.112-1.633.322-2.396C2.806 8.756 3.63 8.25 4.51 8.25H6.75z"
                  />
                </svg>
              </div>
            </div>
          </li>
        </ul>
        <!-- text to speech/voice -->
        <div class="voiceAndText"></div>
      </section>

      <div class="chat-input-bar">
        <input
          class="chat-input"
          type="text"
          placeholder="Aa"
          v-model="message"
          @keyup.enter="sendMessage"
        />
        <button
          class="btn-wrapper"
          v-if="audioTracking == true"
          @click="startRecognition"
        >
          <svg
            class="btn-standard"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
          >
            <!-- SVG path data here -->
          </svg>
        </button>
        <button class="btn-wrapper" v-else @click="speakResponse">
          <svg
            class="btn-standard"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
          >
            <!-- SVG path data here -->
          </svg>
        </button>

        <!-- what is this line doing JM (:disabled="message.trim() === ''") -->
        <button
          class="btn-wrapper"
          @click="sendMessage"
          :disabled="message.trim() === ''"
        >
          <svg
            class="btn-standard"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5"
            />
          </svg>
        </button>
      </div>
    </section>
    <!-- div email form temp here -->
    <section class="sectionForEmailForm">
      <div class="emailForm">
        <form @submit.prevent="sendEmail" ref="hiddenForm" id="hidden-form">
          <!-- now work on fixing the format part! -->
      <input v-model="formData.to_name" type="text" name="to_name" />
      <textarea v-model="responseMessage" name="message"></textarea>
      <!-- Other input fields if needed -->
      <button type="submit" :disabled="sending">Send Email</button>
    </form>
    </div>
    </section>
  </main>
</template>

<script>
import ChatBotResponseService from "../services/ChatbotResponseService";
import LinkedInService from "../services/LinkedInService";
import emailjs from "emailjs-com";

// Initialize EmailJS with your user ID
emailjs.init("wKoUGtuY-Z0xMUnPc");
export default {
  name: "ChatBox",

  data() {
    return {
      cat: "4",
      message: "",
      messages: [], //all the messages in an array
      responseArrayFromServer: [], //remember to RENAME this later
      subjectContext: "0", //both coming from the backend with default of 0
      topicContext: "0", //both coming from the backend with default of 0
      variableContext: "",
      recognition: null,
      transcribedText: "",
      responseMessage: "", // response message displayed from server
      audioTracking: true, // tells whether the audio is currently being recorded

      isSpeaking: false,
      speech: window.speechSynthesis,

      formData: {
        //object sent to emailjs
        to_name: "abdishirdon@gmail.com", 
        message: "cats",
      },
      sending: false,
    };
  },
  mounted() {
    // When the component is mounted(fully compiled), initialize the speech recognition
    this.initializeRecognition();
  },
  methods: {
    // Method to initialize speech recognition

    initializeRecognition() {
      // Check if SpeechRecognition is supported in the browser
      if (
        "SpeechRecognition" in window ||
        "webkitSpeechRecognition" in window
      ) {
        // Get the appropriate SpeechRecognition constructor
        const SpeechRecognition =
          window.SpeechRecognition || window.webkitSpeechRecognition;

        // Create a new SpeechRecognition instance
        this.recognition = new SpeechRecognition();
        this.recognition.lang = "en -US"; // Set the language to English (United States)
        this.recognition.continuous = false; // Continuously listen for speech
        this.recognition.interimResults = true; // Get interim results as the user speaks

        // Set the event handler for speech recognition results
        this.recognition.onresult = this.handleRecognitionResult;

        // Set the event handler for speech recognition errors
        this.recognition.onerror = (event) => {
          console.error("Speech recognition error:", event.error);
        };
      } else {
        console.error("Speech recognition is not supported in this browser.");
      }
    },
    // Method to handle speech recognition results
    handleRecognitionResult(event) {
      let transcript = ""; //stores transcribed speech

      // Loop through the speech recognition results
      for (let i = event.resultIndex; i < event.results.length; i++) {
        transcript += event.results[i][0].transcript; // Concatenate transcribed speech
      }
      //store transcribedText in a variable, meaning you can call it later
      this.transcribedText = transcript;
      this.message = this.transcribedText.toLowerCase(); //set transcribedText to message(right side of chatbot)
    },

    startRecognition() {
      console.log("We reached startReconginition");
      this.audioTracking = true;
      if (this.recognition) {
        this.recognition.start(); // Start speech recognition
      }
    },

    stopRecognition() {
      console.log("reached stoprecognition");
      this.recognition.stop();
    },

    // Method to generate and speak a response
    speakResponse() {
      console.log("reached speakResponse");
      this.audioTracking = false;
      // Check if SpeechSynthesisUtterance is supported in the browser
      if ("SpeechSynthesisUtterance" in window) {
        if (this.speech.speaking) {
          //we check if currently speaking, if so, cancel it/stop
          this.speech.cancel();
        } else {
          // Create a new SpeechSynthesisUtterance instance with the transcribed text
          const utterance = new SpeechSynthesisUtterance(this.responseMessage);
          // Use the browser's speech synthesis to speak the utterance
          this.speech.speak(utterance);
        }
      } else {
        console.error("Speech synthesis is not supported in this browser.");
      }
    },

    handleSuggestionButton() {
      let longResult = ChatBotResponseService.getChatbotSuggestions(
        this.subjectContext
      );
      console.log(longResult);
      ChatBotResponseService.getChatbotSuggestions(this.subjectContext).then(
        (response) => {
          console.log(response.data);
          this.variableContext = response.data;
        }
      );
    },
    sendMessage() {
      const message = this.message;

      this.messages.unshift({
        //**we'll come back for this**
        text: message,
        author: "request-box", //this is coming from the user as a response.
      });

      this.message = "";
      this.$refs.chatbox.scrollTop = this.$refs.chatbox.scrollHeight;
      //probably a good idea to have this if condition in a different method
      if (message.includes("job")) {
        LinkedInService.getJob(message).then((response) => {
          let linkedJobs = "";
          response.data.data.forEach((item) => {
            linkedJobs += `<a href="${item.url}" target="_blank">${item.title}</a><br>`;
          });
          this.messages.unshift({
            text: 'here are some jobs, reply YES if you want us to email them to you<br>' + linkedJobs,
            author: "response-box",
          });
        });
      console.log(this.messages);
      } 
      else if (message.includes("YES") || message.includes("yes") && this.messages[1].text.includes("job")){
        this.messages.unshift({
            text: 'what is your email?',
            author: "response-box",
          });
      }
      else if (message.includes("@") && this.messages[1].text.includes("email")){
        console.log(this.messages[0])
        this.formData = this.messages[0].text;
        this.sendEmail()
      }
       else{
        //get normal response
        ChatBotResponseService.getChatbotResponse(
          message,
          this.subjectContext,
          this.topicContext
        )
          .then((responseArray) => {
            //after a response comes back from the server we take
            console.log(this.messages[0].text)
            this.subjectContext = responseArray.data[1];
            this.topicContext = responseArray.data[2];
            this.responseMessage = responseArray.data[0];
            this.messages.unshift({
              //
              text: responseArray.data[0], //response from server

              author: "response-box", //this is coming from the chatbot as a response.
            });
          })
          .catch((err) => {
            console.error(err);
          });
      }
    },
    sendEmail() {
      //emailjs send email method
      this.sending = true;
      const serviceID = "default_service";
      const templateID = "template_qjk5gaf";
      const formElement = this.$refs.hiddenForm;

      emailjs
        .sendForm(serviceID, templateID, formElement)
        .then(() => {
          this.sending = false;
          alert("Sent!");
        })
        .catch((err) => {
          this.sending = false;
          alert(JSON.stringify(err));
        });
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
  background-color: white;
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
  background-color: #1e272c;
  color: #f3f3f3;
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
  background-color: #c27c0e;
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
  border: 3px solid rgb(75, 61, 61);
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

.chat-input-bar {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 10vh;
  // color: black;
  background-color: black;
  bottom: 0;
}

.chat-input {
  height: 4vh;
  width: 80%; /* Adjust the width as needed */
  padding: 10px;
  border: none;
  background-color: #f0f0f0;
  border-radius: 25px; /* Half of the height to create the pill shape */
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  margin-left: 1rem;
}

input {
  // background-color: rgb(70, 70, 70);
  // line-height: 3;
  width: 100%;
  // border: 3px solid rgb(7, 5, 5);
  // border-left: none;
  // border-bottom: none;
  // border-right: none;
  // border-bottom-left-radius: 4px;
  // border-radius: 12px;
  // font-size: 1.5rem;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 25px;
}

.custom-button {
  display: block;
  width: 350px;
  margin: 20px auto;
  padding: 7px 13px;
  text-align: center;
  background: gray;
  font-size: 20px;
  font-family: "Arial", sans-serif;
  color: #ffffff;
  white-space: nowrap;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.custom-button:hover {
  background-color: rgb(133, 47, 47);
}

button {
  font-size: 21px;
  width: 145px;
  color: white;
  background-color: rgb(19, 84, 224);
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
.greeting {
  margin: 10px;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 10px;
}

.send-btn-svg {
  height: 1.75rem;
  width: 1.75rem;
  z-index: 2;
}
.send-button {
  height: 4rem;
  width: 4rem;
  margin-top: 1rem;
  margin-bottom: 1rem;
  margin-left: 1rem;
  margin-right: 1rem;
  border-radius: 50%;
}
.voiceAndText {
  padding-top: 200;
  display: flex;
}
.btn-wrapper {
  height: 3.5rem;
  width: 3.5rem;
  margin-top: 1rem;
  margin-bottom: 1rem;
  margin-left: 0.5rem;
  margin-right: 0.5rem;
  background-color: #33414b;
  border-radius: 50%;
  display: flex; /* Use flexbox to create a flexible container */
  justify-content: center; /* Center horizontally */
  align-items: center; /* Center vertically */
  cursor: pointer;
  z-index: 1;
}

.btn-standard {
  height: 4vh;
  width: 8vw;
  border-radius: 60%;
  color: #1abc9c;
}
::-webkit-scrollbar-corner {
  background: transparent; /* Replace 'your-color' with the desired background color */
}
</style>
