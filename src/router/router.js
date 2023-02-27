const routes = [
    {
        name: 'home',
        path: '/',
        meta: { title: "首页 | WxBot" },
        component: () => import('../views/Home.vue')
    },
    {
        name: 'menu',
        path: '/menu',
        meta: { title: "指令合集 | WxBot" },
        component: () => import('../views/Menu.vue')
    },
]

export default routes