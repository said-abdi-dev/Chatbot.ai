<template>
  <div id="app">
    <ChatBox msg="Welcome to Your Vue.js App"/>
  </div>

</template>

<script>
import ChatBox from './components/ChatBot.vue'
<<<<<<< HEAD
import PostList from './components/PostList.vue'
  
=======

>>>>>>> 4663448b4cfb9d629b89d1a65465d3f0b7a8dc33
export default {
  name: 'app',
  components: {
    ChatBox,
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>