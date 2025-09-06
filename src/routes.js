import { createRouter, createWebHistory } from 'vue-router'
import HomeView from './views/HomeView.vue'
import TextDisplayer from './views/TextDisplayer.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'home', component: HomeView, props: true },
    {
      path: '/Article/:index',
      name: 'ArticlePage',
      component: TextDisplayer,
      props: route => ({
        selectedIndex: parseInt(route.params.index),
        cards: history.state.cards
      })
    }
  ]
})

export default router
