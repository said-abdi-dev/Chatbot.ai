import axios from "axios";
export default{

     getChatbotResponse(userInput){
          return axios.get(`/${userInput}`)
     },

     
}