import { createApp } from 'vue'
import App from './App.vue'
import '../node_modules/bootstrap/dist/css/bootstrap.css'
import router from './routes'
import $bus from './utils/Events'
import VueScrollTo from 'vue-scrollto'
import './assets/theme.css'

const app = createApp(App)

app.use(router)

app.provide('$bus', $bus)

app.use(VueScrollTo)

app.mount('#app')
