
// We import the routes into the views
import { createRouter, createWebHistory } from 'vue-router'
import UserList from '@/views/UserList.vue'

const routes = [ // Paths to URL
    {
        path: '/',
        name: 'list',
        component: UserList
    },
    {
        path: '/register',
        name: 'register',
        component: () => import('@/views/Register.vue')
    },
    {
        path: '/update/:id',
        name: 'update',
        component: () => import('@/views/Update.vue')
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router
