import Vue from 'vue'
import Vuex from 'vuex'
// axios好像并不能在这里直接使用,即使在main.js中有引入
import axios from 'axios'
axios.defaults.baseURL="http://127.0.0.1:7070"
Vue.prototype.axios=axios
Vue.use(Vuex)

export default new Vuex.Store({
  state: { // 组件间的共用的数据
    categoryId:2021,
    cartShow:false,
    detailName:"",
    userInfo:{},
    uname:"",
    maxPrice:"",
  },
  mutations: { // 向各个组件提供改变state中某项数据的函数集合
    changeCategoryId(state,id){
        state.categoryId=id;
    },
    changeCartShow(state,bol){
      state.cartShow = bol;
    },
    changeMaxPrice(state,maxPrice){
      state.maxPrice = maxPrice;
    },
    // 用户商品的具体姓名
    changeDetailName(state,name){
      state.detailName = name;
      // vex 是 vue 的状态管理器，存储的数据是响应式的。但是并不会保存起来，刷新之后就回到了初始状态，具体做法应该在vuex里数据改变的时候把数据拷贝一份保存到localStorage里面，刷新之后，如果localStorage里有保存的数据，取出来再替换store里的state。
      window.localStorage.setItem("defaultName",JSON.stringify(state.detailName));
    },
    changeUname(state,uname){
      state.uname = uname;
      window.localStorage.setItem("userName",JSON.stringify(state.uname));
    },
    changeUserInfo(state,userInfo){
      state.userInfo = userInfo;
      window.localStorage.setItem("userInfo",JSON.stringify(state.userInfo));
    }
  },
  actions: { // 执行的异步操作都在这里执行(可以配合mutations使用)(登录，注销操作均在这里进行)
    // context表示整个vuex对象 因为这里只能传递一个参数,所以组件调用时以对象的形式传参
    login(context,user){ 
      // 采用ES7的形式管理异步操作
      (async function(){
        var result = await axios.get("/user/login",{
             params:user
         })
         context.commit("changeUname",result.data[0].uname)//异步请求回来之后可以直接将其放在state的属性中
         context.commit("changeUserInfo",result.data[0]);
      })()
    }
  },
  getters: { // 用于向组件提供获取state中的值的函数组合
    getCategoryId(state){
      return state.categoryId;
    },
    getCartShow(state){
      return state.cartShow;
    },
    getDetailName(state){
      return state.detailName;
    },
    getUserInfo(state){
      return state.userInfo;
    }
  }
})
