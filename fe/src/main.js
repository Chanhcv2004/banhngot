import { createApp } from 'vue'
import './style.css'
import axios from 'axios'
import router from "./router/index.js"
import App from './App.vue'
import store from './store.js';


window.axios = axios;
const app = createApp(App);
app.use(router);
app.use(store);
app.mount('#app')
