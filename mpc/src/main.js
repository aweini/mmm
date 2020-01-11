import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import store from './store/store'
import axios from 'axios'
// 引入分组件(为了设置为全局组件)
import ShopSearch from './components/ShopSearch.vue'
import ShopFoot from './components/ShopFoot.vue';
// 引入Vant组件到当前项目中
import Vant from 'vant';
// 单独引入Vant库中样式文件
import 'vant/lib/index.css';
// 将Vant注册vue对象
Vue.use(Vant)
// 引入字体图标的css样式
import "./assets/font/iconfont.css"

//配置axios(默认不携带cookie)  前后端分离时默认是需要跨域的
// 发送请求保存session信息
axios.defaults.withCredentials=true // 全局设置axios允许携带cookie进行访问 
// 配置基础路径
axios.defaults.baseURL="http://127.0.0.1:7070"
// 将axios方法添加到Vue的原型对象上,任何组件都可以使用 this调用
Vue.prototype.axios=axios

Vue.config.productionTip = false

// 将引入的分组件注册为全局组件
Vue.component("ShopSearch",ShopSearch);
Vue.component("ShopFoot",ShopFoot);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
