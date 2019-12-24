import axios from 'axios'

const service = axios.create({
  baseURL: 'http://127.0.0.1:5000/api',
  timeout: 0
})

service.interceptors.response.use(
  response => {
    console.log(response.data)
    return response.data
  },
  error => {
    return Promise.reject(error)
  }
)

export default service
