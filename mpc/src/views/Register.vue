<template>
    <div class="register">
        <div class="register-top">
            <span class="iconfont icon-shouye" @click="gohome"></span>
            <span class="register-title">注 册</span>
        </div>
        <div class="register-box">
            <div class="uname-box">
                <span>用户姓名</span> <van-field v-model="username"  clearable  placeholder="请输入用户名" />
            </div>
            <div class="password-box">
                <span>用户密码</span><van-field type="password" v-model="password" clearable placeholder="请输入用户密码" />
            </div>
            <div class="phone-box">
                <span>手机号码</span><van-field v-model="userphone" clearable placeholder="请输入手机号" />
            </div>
            <div class="verify-box">
               <span>验证码</span><van-field v-model="sms" center clearable placeholder="请输入短信验证码">
                      <van-button slot="button" size="small" type="primary">
                        发送验证码
                      </van-button>
                 </van-field>
            </div> 
        </div>
        <button @click="register" >注 册</button>
        <div class="register-other">
            <span class="register-message">点击注册即表示您已同意用户协议</span>
            <span class="registerToLogin" @click="toLogin">已有账号?</span>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            username:"",
            password:"",
            userphone:"",
            sms:""
        }
    },
    methods: {
        // 去首页
        gohome(){
            this.$router.push('/');
        },
        // 去登录页面
        toLogin(){
            this.$router.push('/Login');
        },
        register(){
            //只能是汉字与大小字母及_的组合
            var userNameReg = new RegExp(/^[A-Za-z_\u4e00-\u9fa5]{2,10}$/);
            // 正则验证 六位以上数字和大小写字母及._的组合,但是只能以数字或字母开头
            var userPwdReg = new RegExp(/^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[._]){5,19}$/);
            // 11位合法手机号
            var phoneReg  =  new RegExp(/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/);
            if(!userNameReg.test(this.username)){
                this.$toast("用户名格式错误!");
                return;
            };
            if(!userPwdReg.test(this.password)){
                this.$toast("密码格式错误!");
                return;
            };
            if(!phoneReg.test(this.userphone)){
                this.$toast("手机号码格式错误!");
                return;
            };
            this.axios.post('/user/register',`uname=${this.username}&&upassword=${this.password}&&uphone=${this.userphone}`).then((result)=>{
                console.log(result.data);
            })
        }
    },
}
</script>
<style scoped>
 .register{
     position: fixed;
     top: 0;
     width: 100%;
     height: 100%;
     background-color: #f0f0f0;
 }
 .register-top {
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
  .register-top>span{
     font-size: 22px;
     color: #c00;
 } 
.register-top>.register-title{
    font-size: 18px;
    margin-right: 8rem;
 }
 .register-box {
     width: 100%;
     display: flex;
     flex-direction: column;
     justify-content: center;
     align-items: center;
     margin-top: 5rem;
     background-color: #fff;
 }
 .uname-box,
 .password-box,
 .phone-box,
 .verify-box {
     display: flex;
     width: 100%;
     font-size: 16px;
     border-bottom: 1px solid #ddd;
     align-items: center;
     color: #6c6c6c;
 }
 .verify-box {
     border:none;
 }
 .uname-box>span,
 .password-box>span,
 .phone-box>span,
 .verify-box>span{
     width: 30%;
     margin-left: 1rem;
 }
 .register>button{
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
  .register-other {
     width: 100%;
     display: flex;
     justify-content: space-between;
     align-items: center;
     color: #ff0036;
     margin-top: 0.7rem;
     padding: 0 1rem;
     box-sizing: border-box;
     font-size: 12px;
 }
</style>


