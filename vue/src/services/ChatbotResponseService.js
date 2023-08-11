import axios from "axios";

function sanitizeUrl(url) {
    const specialCharsRegex = /[^\w\d\-._~]/g;
    const sanitizedUrl = url.replace(specialCharsRegex, ' ');
    return sanitizedUrl;
}

export default {
    getChatbotResponse(userInput, subjectContext, topicContext) {
        const sanitizedInput = sanitizeUrl(userInput); // Sanitize userInput
        return axios.get(`/${sanitizedInput}/${subjectContext}/${topicContext}`);
    },
    getChatbotSuggestions(contextString) {
         return axios.get(`/${contextString}`);
    }
}
