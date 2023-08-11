import axios from "axios";
export default{

     getChatbotResponse(userInput, subjectContext, topicContext){
          
          return axios.get(`/${userInput}/${subjectContext}/${topicContext}`);
     },
}