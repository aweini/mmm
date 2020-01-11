import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import List from '../views/List.vue'
import Cart from '../views/Cart.vue'
import All from '../views/All.vue'
import Concat from '../views/Concat.vue'
import Self from '../views/Self.vue'
import Detail from '../views/ProductDetail.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path:'/List',
    name:'list',
    component: List
  },
  {
    path:'/All',
    name:'all',
    component:All
  },
  {
    path:'/Cart',
    name:'cart',
    component:Cart
  },
  {
    path:'/Concat',
    name:'concat',
    component:Concat
  },
  {
    path:'/Self',
    name:'self',
    component:Self
  },
  {
    path:'/Detail',
    name:'detail',
    component:Detail
  },
  {
    path:'/Login',
    name:'login',
    component:Login
  },
  {
    path:'/Register',
    name:'register',
    component:Register
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
