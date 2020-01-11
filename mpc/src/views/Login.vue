<template>
    <div class="login">
        <div class="login-top">
            <span class="iconfont icon-shouye" @click="gohome"></span>
            <span class="login-title">登 录</span>
        </div>
        <div class="login-box">
            <div class="uname-box">
                <span>用户姓名</span><van-field v-model="username" clearable placeholder="请输入用户名"/>
            </div>
            <div class="password-box">
                <span>用户密码</span><van-field type="password" v-model="password" clearable placeholder="请输入用户密码"/>
            </div>
        </div>
        <button @click="myLogin">登 录</button>
        <div class="login-other">
            <span class="login-message">短信登录</span>
            <span class="loginToRegister" @click="toRegister">免费注册</span>
        </div>
    </div>
</template>
<script>
import {mapActions,mapState} from "vuex"
export default {
    data() {
        return {
            username:"",
            password:"",
            userInfo:"",
        }
    },
    methods: {
        myLogin(){
        //只能是汉字与大小字母及_的组合
         var userNameReg = new RegExp(/^[A-Za-z_\u4e00-\u9fa5]{2,10}$/);
         // 正则验证 六位以上数字和大小写字母及._的组合,但是只能以数字或字母开头
         var userPwdReg = new RegExp(/^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[._]){5,19}$/);
         if(!userNameReg.test(this.username)){
             this.$toast("用户名格式错误!");
             return;
         };
         if(!userPwdReg.test(this.password)){
             this.$toast("密码格式错误!");
             return;
         }
        this.login({
                username:this.username,
                password:this.password
            });
        this.userInfo = this.$store.getters.getUserInfo;
            if(this.userInfo){
                this.$toast("登录成功");
                this.$router.push('/')
            }else{
                this.$toast("登录失败");
            }
        },
        ...mapActions(["login"]),//将vuex中的action中的函数引过来(所有的都会过来),所以[]内又谁,就表示这个组件将要使用谁,又因为他是以对象的形式存在的所以需要...结构出来
        // 返回首页
        gohome(){
            this.$router.push('/');
        },
        // 去注册
        toRegister(){
            this.$router.push('/Register');
        }
    },
}
</script>
<style scoped>
 .login{
     position: fixed;
     top: 0;
     width: 100%;
     height: 100%;
     background-color: #f0f0f0;
 }
 .login-top {
     position: fixed;
     display: flex;
     flex-direction: row-reverse;
     line-height: 3rem;
     box-sizing: border-box;
     padding-right: 0.8rem;
     top: 0;
     width: 100%;
     height: 3rem;
     background-color: #f7f7f8;
 }
 .login-top>span{
     font-size: 22px;
     color: #c00;
 } 
.login-top>.login-title{
    font-size: 18px;
    margin-right: 8rem;
}
 .login-box {
     width: 100%;
     display: flex;
     flex-direction: column;
     justify-content: center;
     align-items: center;
     margin-top: 5rem;
     background-color: #fff;
 }
 .uname-box,
 .password-box {
     display: flex;
     width: 100%;
     font-size: 16px;
     border-bottom: 1px solid #ddd;
     align-items: center;
     color: #6c6c6c;
 }
 .password-box {
     border:none;
 }
 .uname-box>span,
 .password-box>span{
     width: 30%;
     margin-left: 1rem;
 }
 .login>button{
     display: block;
     width: 93%;
     height: 3rem;
     border:none;
     background-color: #ff0036;
     color: #fff;
     border-radius: 0.5rem;
     margin: 0 auto;
     margin-top: 2rem;  
 }
 .login-other {
     width: 100%;
     display: flex;
     justify-content: space-between;
     align-items: center;
     color: #ff0036;
     margin-top: 0.7rem;
     padding: 0 1rem;
     box-sizing: border-box;
 }
</style>

