
// We import route to main view, paths, styles
import { createApp } from 'vue'
import App from './components/App.vue'
import router from './router'
import './assets/style/tailwind.css'



createApp(App).use(router).mount('#app')
