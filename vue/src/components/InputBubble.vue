<template>
  <div>
    <div class="message-container" v-if="message.author === 'request-box'">
      <div class="message-content">
        <p class="message-text">{{ message.text }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  //each post gets added to store allMessages array.
  //needs id, message, and state for the button?
    props: {
    message: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style>
</style>