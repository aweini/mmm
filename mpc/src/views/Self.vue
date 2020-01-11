<template>
    <div class="self">
        <div class="self-top">
            <div class="self-pic" v-if="uname===''"><img src="../assets/img/default.png"/></div>
            <div class="self-pic" v-else><img :src="baseUrl+userInfo.photo"/></div>
            <div class="self-title" @click="goLogin" v-if="uname===''">亲! 请登录</div>
            <div class="self-title"  v-else>欢迎！{{uname}}</div>
        </div>
        <div class="self-asset">
            <div class="credits">
                <span class="credits-number">0</span>
                <span class="credits-title">积分</span>
            </div>
            <div class="coupon">
                <span class="coupon-number">0</span>
                <span class="coupon-title">卡券</span>
            </div>
        </div>
        <div class="self-middle">
            <div class="allorder">
                <span class="iconfont icon-quanbudingdan"></span>
                <span class="middle-title">全部订单</span>
            </div>
            <div class="noorder">
                <span class="iconfont icon-daifukuan"></span>
                <span class="middle-title">待付款</span>
            </div>
            <div class="sendorder">
                <span class="iconfont icon-icon-test"></span>
                <span class="middle-title">待发货</span>
            </div>
            <div class="receiveorder">
                <span class="iconfont icon-daishouhuo"></span>
                <span class="middle-title">待收货</span>
            </div>
        </div>
        <div class="self-list">
            <ul>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-wodexinxi"></span><span class="list-title">我的信息</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-collection"></span><span class="list-title">收藏的商品</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-youhuiquan"></span><span class="list-title">我的优惠券</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-wodedizhi"></span><span class="list-title">我的地址</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-jifen"></span><span class="list-title">我的积分</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-qiandao"></span><span class="list-title">每日签到</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-ico"></span><span class="list-title">我的二维码</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-shizhong"></span><span class="list-title">特卖惠</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-kefu"></span><span class="list-title">客户服务</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
                <li>
                    <div class="list-left">
                        <span class="list-icon iconfont icon-geren"></span><span class="list-title">我是代言人</span>
                    </div>
                    <div class="list-right">
                        <span class="list-detail iconfont icon-next"></span>
                    </div>
                </li>
            </ul>
        </div>
        <button class="logout" @click="logout">退出登录</button>
        <shop-foot :index="index"></shop-foot>
    </div>
</template>
<script>
// 统一使用map功能函数使用Vuex
import {mapState,mapMutations} from 'vuex'
import {baseUrl} from "../../baseUrl.js"
export default {
    name:"self",
    data() {
        return {
            baseUrl,
            userInfo:{},
            index:4,
        }
    },
    methods: {
        // 去登陆
        goLogin(){
            this.$router.push('/Login')
        },
        // 退出登录
        logout(){
            localStorage.clear();
            this.axios.get("/user/loginOut")
            .then((result)=>{
                console.log(result.data);
                if(result.data == 1){
                    this.$toast("退出成功")
                    this.$router.go(0);
                }
            })
        },
        // 改变vuex中state中的值
        ...mapMutations(["changeUname"]),
    },
    mounted() {
        // 重新打开页面时
        var uname = JSON.parse(window.localStorage.getItem("userName"));
        this.changeUname(uname||"");
        // 获取浏览器缓存中保存的用户数据(包括头像)
        this.userInfo = JSON.parse(window.localStorage.getItem("userInfo"))
    },
    computed: {
        ...mapState(["uname"]),
    },
}
</script>
<style scoped>
    .self{
        width: 100%;
    }
    .self-top {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 8.2rem;
        background:url(../assets/img/self.gif) no-repeat;
        background-size: 100%;
        background-position: 0 0;
    }
    .self-pic{
        width: 70px;
        height: 70px;
        border-radius: 50%;
        border:2px solid #fff;
        overflow: hidden;
    }
    .self-pic>img{
        width: 100%;
    }
    .self-top>.self-title{
        margin-top: 0.5rem;
        color: #ff0036;
    }
    .self-asset{
        width: 100%;
        height: 3rem;
        display: flex;
        color: #fff;
        justify-content: space-between;
        background-color: rgb(207, 226, 243);
    }
    .credits,
    .coupon {
        width: 50%;
        background-color: rgba(51,51,51,.3);
        text-align: center;
        line-height: 3rem;
    }
    .coupon {
        border-left: 1px solid #fff;
        box-sizing: border-box;
    }
    .self-middle {
        width: 100%;
        height: 4.3rem;
        display: flex;
        justify-content: space-around;
        align-items: center;
        box-sizing: border-box;
        border-bottom: 1px solid #ccc;
        color: #666;
    }
    .self-middle>div>span.middle-title{
        font-size: 13px;
    }
    .self-middle>div{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        color: #666;
    }
    .self-middle>div>span:first-child{
        font-size: 24px;
    }
    .self-list>ul>li{
        width: 100%;
        height: 3rem;
        border-bottom: 1px solid #ccc;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #666;
        box-sizing: border-box;
        padding:0 0.5rem 0 1rem;
    }
    .self-list>ul>li>.list-left>.list-title{
        font-size: 13px;
    }
    .self-list>ul>li>.list-left>.list-icon{
        font-size: 22px;
        padding-right: 0.4rem;
    }
    .logout {
     display: block;
     width: 93%;
     height: 3rem;
     border:none;
     background-color: #ff0036;
     color: #fff;
     border-radius: 0.5rem;
     margin: 3rem auto 6rem;
    }
</style>


