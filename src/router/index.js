
// We import the routes into the views
import { createRouter, createWebHistory } from 'vue-router'
import UserList from '@/views/UserList.vue'
import Register from '@/views/Register.vue'
import Update from '@/views/Update.vue'

const routes = [ // Paths to URL
    { path: '/', component: UserList },
    { path: '/register', component: Register },
    { path: '/update/:id', component: Update }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router
