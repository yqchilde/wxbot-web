import { createRouter, createWebHistory } from 'vue-router'
import routes from './router.js'

const router = createRouter({
    history: createWebHistory(),
    routes
});


router.beforeEach((to, from, next) => {
    if (to.meta.title) {
        document.title = to.meta.title
    }
    next()
})

export default router;
