import axios from "axios";
const http = axios.create ({

  //  baseURL: 'https://linkedin-jobs-search.p.rapidapi.com/',
    headers: {
        'content-type': 'application/json',
        'X-RapidAPI-Key': '0fe371429dmsh4efb3bc2fedf3bbp1ac14ejsn292a99d6a1b8',
        'X-RapidAPI-Host': 'linkedin-jobs-search.p.rapidapi.com'
      }

})



export default{
     getJob(jobType) {
          console.log(jobType)
         let data = {
               "search_terms": "python programmer",
               "location": "Chicago, IL",
               "page": "1"
          }
          return http.post(`https://linkedin-jobs-search.p.rapidapi.com/`, data)   
     }
     
}