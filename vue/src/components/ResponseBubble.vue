<template>
  <div class="text-and-image-container">
    <div class="bot-image">
      <img src="img/botIcon.png" alt="Bot Icon" class="message-icon" />
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
    <button class="btn-wrapper" v-else @click="stopListeningToResponse">
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
</template>

<script>
export default {
  name: "ResponseBubble",

  data() {
    return {
      responseMessage: "", // response message displayed from server
      switchValue: false, // ???
      sending: false, // ???
      isSpeaking: false,
      speech: window.speechSynthesis,
    };
  },
  props: {
    message: {
      type: Object,
      required: true,
    },
  },
  methods: {
    // Method to generate and listen to a response
    listenToResponse() {
      console.log("reached speakResponse");
      this.isSpeaking = true;

      // Listen to response
      if ("SpeechSynthesisUtterance" in window) {
        if (this.speech.speaking) {
          //we check if currently speaking, if so, cancel it/stop
          this.speech.cancel();
        } else {
          // Create a new SpeechSynthesisUtterance instance with the transcribed text
          console.log(this.responseMessage);
          const utterance = new SpeechSynthesisUtterance(this.responseMessage);
          // Use the browser's speech synthesis to speak the utterance
          this.speech.speak(utterance);
        }
      } else {
        console.error("Speech synthesis is not supported in this browser.");
      }
    },
    // stop listening to response
    stopListeningToResponse() {
      this.isSpeaking = false;
      this.speech.cancel();
    },
  },
};
</script>

<style>
</style>