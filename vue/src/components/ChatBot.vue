<template>
  <main class="rootTemplateTag">
    <section class="chat-box">
      <section class="chat-box-list-container" ref="chatbox">
        <ul class="chat-box-list">
          <li v-if="messages.length == 0" class="message response-box">
            <div class="text-and-image-container">
              <div class="bot-image">
                <img
                  src="img/botIcon.png"
                  alt="Bot Icon"
                  class="message-icon"
                />
              </div>
              <p class="message-text">
                Hey! My name is ChatBot. I am a bot designed to help aspiring
                software developers learn more about programming, prepare for,
                and find the job of their dreams! First thing's first. If you
                would like a profile picture, hit the camera button, or select
                your default avatar at any time to add one!
              </p>
              <br /><br />
              <p>
                You can ask me anything you would like, but I'll help you out on
                how to utilize me to your advantage. You can ask me about jobs,
                just be sure to ask me about a job title or skill in the message
                so that I can find you the most accurate jobs you are looking to
                find!
              </p>
              <br /><br />
              <p>
                You can also ask me about a variety of programming topics, like
                programming languages, or concepts. If provided with enough
                information of what you're looking to know, I will find you
                information, as well as articles and videos so you can dig
                deeper into the topic.
              </p>
              <!-- ACTIVATE CAMERA BUTTON -->
              <div>
                <div class="preview-box">
                  <video
                    ref="video"
                    autoplay
                    v-if="showCamera"
                    @loadedmetadata="videoLoaded"
                  ></video>
                  <img
                    class="userDefault localStored"
                    :src="photoDataUrl"
                    alt="Captured Photo"
                  />
                </div>

                <button
                  class="circle-button"
                  @click="toggleCamera"
                  v-if="!showCamera && !photoDataUrl"
                >
                  Take a Photo
                </button>
                <button
                  class="circle-button"
                  @click="takePhoto"
                  v-if="showCamera && !photoDataUrl"
                >
                  Take Photo
                </button>
              </div>
            </div>
            <div class="btn-wrapper">
              <svg
                class="btn-standard"
                @click="toggleCamera"
                v-if="!showCamera && !photoDataUrl"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M6.827 6.175A2.31 2.31 0 015.186 7.23c-.38.054-.757.112-1.134.175C2.999 7.58 2.25 8.507 2.25 9.574V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18V9.574c0-1.067-.75-1.994-1.802-2.169a47.865 47.865 0 00-1.134-.175 2.31 2.31 0 01-1.64-1.055l-.822-1.316a2.192 2.192 0 00-1.736-1.039 48.774 48.774 0 00-5.232 0 2.192 2.192 0 00-1.736 1.039l-.821 1.316z"
                />
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M16.5 12.75a4.5 4.5 0 11-9 0 4.5 4.5 0 019 0zM18.75 10.5h.008v.008h-.008V10.5z"
                />
              </svg>
            </div>
          </li>

          <li
            class="message"
            v-for="message in messages"
            :key="messages.indexOf(message)"
            :class="message.author"
          >
            <!-- User message -->
            <div
              class="message-and-image-container"
              v-if="message.author === 'request-box'"
            >
              <div class="bot-image">
                <!-- we need to change this based on stuff -->
                <img 
                  :src="getImageSource"
                  alt="User Icon"
                  class="message-icon"
                />
                
              </div>
              <div class="message-container">
                <div class="message-content">
                  <p class="message-text">{{ message.text }}</p>
                </div>
              </div>
            </div>
            <!-- BOT MESSAGE -->
            <div class="text-and-image-container" v-else>
              <div class="bot-image">
                <img
                  src="img/botIcon.png"
                  alt="Bot Icon"
                  class="message-icon"
                />
              </div>
              <div class="message-container">
                <div class="message-content">
                  <p v-html="message.text" class="message-text"></p>
                </div>
              </div>
              <!-- SPEAKER BUTTON -->
              <div
                class="btn-wrapper"
                v-if="isSpeaking == false"
                @click="listenToResponse"
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
              <!-- STOP BUTTON  -->
              <button
                class="btn-wrapper"
                v-else
                @click="stopListeningToResponse"
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
                    d="M5.25 7.5A2.25 2.25 0 017.5 5.25h9a2.25 2.25 0 012.25 2.25v9a2.25 2.25 0 01-2.25 2.25h-9a2.25 2.25 0 01-2.25-2.25v-9z"
                  />
                </svg>
              </button>
            </div>
          </li>
        </ul>
        <!-- text to speech/voice -->
        <div class="voiceAndText"></div>
        <div class="suggestion-container"
        v-if="subjectContext!=='0'">
          <div
            class="vertical-buttons"
            v-if="subjectContext !== '0'"
          >
            <button
              class="suggestion-button"
              v-for="(suggestion,index) in newSuggestionArray"
              :key="index"
              :class="{ selected: index === selectedSuggestionSetIndex }"
              @click="setMessageAndSendMessage(suggestion)"
            >
              {{ suggestion}}
            </button>
          </div>
        </div>
      </section>

      <div class="chat-input-bar">
        <input
          class="chat-input"
          type="text"
          placeholder="Aa"
          v-model="message"
          @keyup.enter="sendMessage"
        />

        <!-- RECORD BUTTON -->
        <button
          class="btn-wrapper"
          v-if="audioTracking == false"
          @click="startRecognition"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="btn-standard"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M12 18.75a6 6 0 006-6v-1.5m-6 7.5a6 6 0 01-6-6v-1.5m6 7.5v3.75m-3.75 0h7.5M12 15.75a3 3 0 01-3-3V4.5a3 3 0 116 0v8.25a3 3 0 01-3 3z"
            />
          </svg>
        </button>
        <!-- STOP BUTTON -->
        <button class="btn-wrapper" v-else @click="stopRecognition">
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
              d="M5.25 7.5A2.25 2.25 0 017.5 5.25h9a2.25 2.25 0 012.25 2.25v9a2.25 2.25 0 01-2.25 2.25h-9a2.25 2.25 0 01-2.25-2.25v-9z"
            />
          </svg>
        </button>

        <!-- SEND BUTTON -->
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
    <!-- if this isnt here, email js doesnt work -->
    <section class="sectionForEmailForm">
      <div class="emailForm">
        <form @submit.prevent="sendEmail" ref="hiddenForm" id="hidden-form">
          <!-- now work on fixing the format part! -->
          <input v-model="formData.to_name" type="text" name="to_name" />
          <textarea v-model="formData.message" name="message"></textarea>
          <!-- Other input fields if needed -->
          <button type="submit">Send Email</button>
        </form>
      </div>
    </section>
  </main>
</template>

<script>
import ChatBotResponseService from "../services/ChatbotResponseService";
import LinkedInService from "../services/LinkedInService";
import emailjs from "emailjs-com";
import ChatGPTService from "../services/ChatGPTService.js"

// Initialize EmailJS with your user ID
emailjs.init("wKoUGtuY-Z0xMUnPc");
export default {
  name: "ChatBox",

  data() {
    return {
      message: "",
      messages: [], //all the messages in an array
      responseArrayFromServer: [], //remember to RENAME this later
      subjectContext: "0", //both coming from the backend with default of 0
      topicContext: "0", //both coming from the backend with default of 0
      variableContext: "",
      recognition: null,
      transcribedText: "",
      responseMessage: "", // response message displayed from server
      audioTracking: false, // tells whether the audio is currently being recorded
      isSpeaking: false,
      speech: window.speechSynthesis,
      suggestionArray: ["a", "b", "c"],
      sending: null,
      stream: null,

      photoDataUrl: null,

      showCamera: false,

      selectedSuggestionSetIndex: 0,
      emailMessageLinks: "",
      formData: {
        //object sent to emailjs
        to_name: "noah@",
        message: "cats",
      },
    };
  },
  computed: {
    newSuggestionArray() {
      return this.suggestionArray;
    },
    localStoragePhoto() {
      return localStorage.getItem("capturedPhoto");
    },
    getImageSource() {
      if (this.photoDataUrl !== null) {
        return this.photoDataUrl; // Set the new image source here
      } else {
        return "img/userIcon.png"; // Default image source
      }
    },
  },
  mounted() {
    // When the component is mounted(fully compiled), initialize the speech recognition
    this.initializeRecognition();
    // this.fetchSuggestions();
    this.scrollToBottom();
  },
    watch: {
    message(newMessage) {
      if (newMessage.includes("send")) {
        // console.log("This message includes 'send'");
        this.stopRecognition;
        this.sendMessage()
      }
      if (newMessage) {
        this.getSuggestions(newMessage); // gets the suggestion as the user types
      }
    },
  },
  methods: {
    // setProfilePhoto(){
    //   if (this.photoDataUrl == null) {

    //   }
    //   else (this.photoDataUrl != null){

    //   }
    // }
    async toggleCamera() {
      this.showCamera = !this.showCamera;

      if (this.showCamera) {
        try {
          this.stream = await navigator.mediaDevices.getUserMedia({
            video: true,
          });
          const videoElement = this.$refs.video;
          videoElement.srcObject = this.stream;
        } catch (error) {
          console.error("Error accessing camera:", error);
        }
      } else {
        if (this.stream) {
          this.stream.getTracks().forEach((track) => track.stop());
        }
      }
    },
async takePhoto() {
  try {
    const videoElement = this.$refs.video;
    console.log("reached" + "takePhoto")
    // Pause the video to freeze the frame
    videoElement.pause();

    const canvas = document.createElement("canvas");
    canvas.width = videoElement.videoWidth;
    canvas.height = videoElement.videoHeight;
    const context = canvas.getContext("2d");
    context.drawImage(videoElement, 0, 0, canvas.width, canvas.height);

    this.capturedPhoto = canvas.toDataURL("image/png");

    // Save photo data to LocalStorage
    localStorage.setItem("userAvatar", this.capturedPhoto);
    // Update the component's photoDataUrl property
    this.photoDataUrl = this.capturedPhoto;
    // Turn off the video stream after capturing the photo
    if (this.stream) {
      this.stream.getTracks().forEach((track) => track.stop());
    }
  } catch (error) {
    console.error("Error capturing photo:", error);
  }
},


    // retakePhoto() {
    //   this.photoDataUrl = null;
    //   this.showCamera = true;
    //   const videoElement = this.$refs.video;
    //   videoElement.play();
    // },
    videoLoaded() {
      // Video loaded, start playing
      const videoElement = this.$refs.video;
      videoElement.play();
    },

    // beforeUnmount() {
    //   if (this.stream) {
    //     this.stream.getTracks().forEach(track => track.stop());
    //   }
    // },

    setMessageAndSendMessage(suggestion) {
      this.message = suggestion;
      this.$nextTick(() => {
        this.sendMessage();
      });
    },
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
      console.log("we reached startRecognition() ");

      this.audioTracking = true;
      this.buttonChanging = true;

      if (this.recognition) {
        this.recognition.start(); // Start speech recognition
      }
      console.log('the user stopped speaking now')
    },

    stopRecognition() {
      console.log("reached stoprecognition");
      this.audioTracking = false;
      this.recognition.stop();
    },

    // Method to generate and listen to a response
    listenToResponse() {
      setTimeout(() => {
        if (this.recognition) {
          this.recognition.start(); // Start speech recognition
          this.buttonChanging = false; // Reset buttonChanging after the delay
        }
      }, 2000);
       // Delay of 2 seconds

      console.log("reached speakResponse");
      this.isSpeaking = true;

      setTimeout(() => {
        // Check if SpeechSynthesisUtterance is supported in the browser
        if ("SpeechSynthesisUtterance" in window) {
          if (this.speech.speaking) {
            //we check if currently speaking, if so, cancel it/stop
            this.speech.cancel();
          } else {
            // Create a new SpeechSynthesisUtterance instance with the transcribed text
            const utterance = new SpeechSynthesisUtterance(
              this.responseMessage
            );
            // Use the browser's speech synthesis to speak the utterance
            this.speech.speak(utterance);
          }
        } else {
          console.error("Speech synthesis is not supported in this browser.");
        }
      }, 2000); //wait about 2 seconds before listening starts here??? not too sure
    },
    stopListeningToResponse() {
      this.isSpeaking = false;
      this.speech.cancel();
    },
    getGptResponse(x) {
      ChatGPTService.generateChat(x)
        .then(response => {
          console.log(response.data.choices[0].message.content);
           this.messages.unshift({
            text: response.data.choices[0].message.content,
            author: "response-box",
          });
          // Handle the response here, e.g., update a variable in the component's data
        })
        .catch(error => {
          console.log(error);
        });
    },

    sendMessage() {
      const message = this.message;

      this.messages.unshift({
        //**we'll come back for this**
        text: message,
        author: "request-box", //this is coming from the user as a response.
      });

      this.message = "";
      this.scrollToBottom();
      //probably a good idea to have this if condition in a different method

      if (message.includes("job")) {
        LinkedInService.getJob(message).then((response) => {
          let linkedJobs = "";
          response.data.data.forEach((item) => {
            linkedJobs += `<a href="${item.url}" target="_blank">${item.title}</a><br>`;
          });
          this.scrollToBottom();

          this.messages.unshift({
            text:
              "here are some jobs, reply YES if you want us to email them to you<br>" +
              linkedJobs,
            author: "response-box",
          });
          this.formData.message = linkedJobs;
        });
        this.scrollToBottom();
      }
      else if (message.includes("code")){
        this.getGptResponse(message)
      } else if (
        message.includes("YES") ||
        (message.includes("yes") && this.messages[1].text.includes("job"))
      ) {
        this.messages.unshift({
          text: "what is your email?",
          author: "response-box",
        });
      } else if (
        message.includes("@") &&
        this.messages[1].text.includes("email")
      ) {
        console.log(this.formData.message + "formDataLog");
        this.formData.to_name = message;
        this.$nextTick(() => {
          this.sendEmail();
        });
        this.scrollToBottom();
      } else {
        //get normal response
        ChatBotResponseService.getChatbotResponse(
          message,
          this.subjectContext,
          this.topicContext
        )
          .then((responseArray) => {
            //after a response comes back from the server we take
            this.subjectContext = responseArray.data[1];
            this.topicContext = responseArray.data[2];
            this.responseMessage = responseArray.data[0];
            this.messages.unshift({
              text: responseArray.data[0], //response from server

              author: "response-box", //this is coming from the chatbot as a response.
            });
            this.scrollToBottom();
          })
          .catch((err) => {
            console.error(err);
          });
      }
      this.scrollToBottom();
      //audiotracking needs to be disabled on submit, but this caused alot of errors so i commented it out
      // this.audioTracking=false;
      
    },

    getSuggestions(message) {
      ChatBotResponseService.getChatbotSuggestions(message).then((responseArray) => {
        this.suggestionArray = responseArray.data; // Update suggestions directly
      });
    },
    sendEmail() {
      //emailjs send email method
      this.sending = true;
      const serviceID = "default_service";
      const templateID = "template_qjk5gaf";
      const formElement = this.$refs.hiddenForm;
      console.log(formElement);

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
    scrollToBottom() {
      this.$nextTick(() => {
        const chatbox = this.$refs.chatbox;
        chatbox.scrollTop = chatbox.scrollHeight;
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
.userDefault {
  width: 90px;
  height: 90px;
}
.request-box {
  width: auto;
  text-align: left;
  font-size: 1.3rem;
  background-color: #1436cc;
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
  height: 86vh;
  border-radius: 10px;
  margin-left: auto;
  margin-right: auto;
  align-items: space-between;
  justify-content: space-between;
  border-radius: 10px;
}
.chat-box-list li {
  margin-bottom: 0.5rem;
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

  /* Add this property to allow text wrapping */
  white-space: normal;
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
  cursor: pointer;
}

.send-button {
  height: 4rem;
  width: 4rem;
  margin-top: 1rem;
  margin-bottom: 1rem;
  margin-left: 1rem;
  margin-right: 1rem;
  border-radius: 50%;
  cursor: pointer;
}
.send-button:hover {
  text-decoration-color: green;
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

.suggestion-container {
  bottom: 10vh;
  left: 50%;
  max-width: 90%;
  //overflow-x: auto;
  // transform: translateX(-50%);
  background-color: white;
  border-radius: 10px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  padding: 10px;
  z-index: 2;
}

.vertical-buttons {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 10px;
  white-space: nowrap;
  // overflow-x: auto;
}

.suggestion-button {
  padding: 20px 15px;
  background-color: #33414b;
  border-radius: 10px;
  border: none;
  cursor: pointer;
  font-size: 14px;
  color:white
}
.sectionForEmailForm {
  position: absolute;
  left: -9999px;
  top: auto;
  width: 1px;
  height: 1px;
  overflow: hidden;
}
</style>
