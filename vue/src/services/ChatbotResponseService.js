import axios from "axios";
export default{

     getChatbotResponse(userInput, context){
          userInput = context + userInput
          return axios.get(`/${userInput}`)
     },

     
     
}