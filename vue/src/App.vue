<template>
  <div id="app">
    <ChatBox msg="Welcome to Your Vue.js App"/>
      <PostList/>
  </div>

</template>

<script>
import ChatBox from './components/ChatBot.vue'
import PostList from './components/PostList.vue'
  
export default {
  name: 'app',
  components: {
    ChatBox,
    PostList
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