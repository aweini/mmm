<template>
    <div class="product-detail">
        <div class="detail-top">
            <span class="pre iconfont icon-fanhui" @click="back"></span>
            <span class="title">详情</span>
            <span class="cart iconfont icon-icon22fuzhi"></span>
        </div>
        <div class="detail-carousel">
            <van-swipe :autoplay="3000" indicator-color="white" :height="375">
                <van-swipe-item v-for="(p,i) of cList" :key="i"><img :src="baseUrl+p"/>
                </van-swipe-item>
            </van-swipe>
        </div>
        <div class="detail-middel">
            <div class="middle-name">{{detailName}}</div>
            <div class="middle-price">
                <span class="minprice">￥{{minPrice}}</span>
                <span class="maxprice"><s>￥{{maxPrice}}</s></span>
            </div>
        </div>
        <div class="detail-blank"></div>
        <div class="detail-desc">
            <div class="desc-title">详情介绍</div>
            <div class="desc-pic">
                <img v-for="(item,i) of dList" :src="baseUrl+item" :key="i">
            </div>
        </div>
        <div class="detail-bottom">
            <div class="bottom-left">
                <div class="home" @click="gohome">
                    <span class="iconfont icon-shouye"></span>
                    <div>首页</div>
                </div>
                <div class="share">
                    <span class="iconfont icon-fenxiang"></span>
                    <div>分享</div>
                </div>
            </div>
            <div class="addcart">加入购物车</div>
            <div class="buynow">立即购买</div>
        </div>
    </div>
</template>
<script>
import {baseUrl} from "../../baseUrl.js"
export default {
    data(){
        return{
            detailList:{},
            carousellist:"image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp",
            baseUrl,
            descList:"image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",
            maxPrice:"",
            minPrice:"",
            detailName:"",
        }
    },
    methods: {
        load(detailName){
            this.axios.get('index/detail',{
                params:{
                    dName:detailName
                }
                }).then((result)=>{
                    this.carousellist = result.data[0].carouselPic;
                    this.descList = result.data[0].detailPic;
                    this.maxPrice = result.data[0].maxPrice;
                    this.minPrice = result.data[0].minPrice;
            })
        },
        // 利用vue-router返回上一页
        back(){
            this.$router.go(-1);
        },
        // 底部返回首页按钮
        gohome(){
            this.$router.push("/");
        }
    },
    mounted() {
        // 页面跳转过来时this.$store.getters.getDetailName 不为空 所以不会执行if
        // 页面刷新时由于vux的不会保存数据状态所以这时this.$store.getters.getDetailName为空，所以会执行if语句(调用缓存中保存的值)；是在store.js中该条数据状态变化时保存到缓存中的 
        this.detailName = this.$store.getters.getDetailName;
        if(!this.detailName){
            this.detailName=JSON.parse(window.localStorage.getItem('defaultName'));
        } 
        this.load(this.detailName);   
    },
    computed: {
        // 解析数据文件图片格式由字符串计算为数组(为v-for做准备)
        cList(){
            return this.carousellist.split("&");
        },
        dList(){
            return this.descList.split("&");
        }
    },

}
</script>
<style scoped>
.product-detail {
    width: 100%;
}
.detail-top {
    width:100%;
    height: 3rem;
    display: flex;
    position: fixed;
    top: 0;
    justify-content: space-between;
    align-items: center;
    font-size: 16px;
    color: #333;
    border-bottom: 1px solid #f0f0f0;
    box-sizing: border-box;
    padding:0 1rem;
    background-color: #fff;
    z-index: 9;
}
.pre,
.cart {
    font-size: 22px;
}
.detail-carousel {
    width: 100%;
    margin-top:3rem; 
}
.detail-carousel img{
    width: 100%;
}
.detail-middel {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    border-top: 1px solid #ccc;
    padding-left: 0.7rem;
    padding-top: 1rem;
    padding-bottom: 1rem;
    font-size: 18px;
    box-sizing: border-box;
}
.middle-name {
    color: #333;
    margin-bottom: 0.7rem;
}
.minprice {
    color: #e65e60;
    font-weight: 500;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
.maxprice {
    color: #ccc;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 15px;
    margin-left: 2rem;
    
}
.detail-blank {
    width: 100%;
    height: 1rem;
    background-color: #f3f0f0;
}
.detail-desc {
    width: 100%;
}
.desc-title {
    width: 100%;
    height: 2rem;
    border-bottom: 1px solid #f0f0f0;
    padding-left: 0.7rem;
    color: #333;
    font-size: 14px;
    line-height: 2rem;
    box-sizing: border-box;
}
.desc-pic {
    width: 100%;
}
.desc-pic img {
    width: 100%;
}
.desc-pic>img:last-child{
    margin-bottom: 3.2rem;
}
.detail-bottom {
    width: 100%;
    height: 3rem;
    display: flex;
    position: fixed;
    bottom: 0;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid #f0f0f0;
}
.bottom-left {
    width: 40%;
    height: 100%;
    display: flex;
    justify-content: center;
    background-color: #fff;
}
.home,.share {
    width: 50%;
    text-align: center;
    padding: 0.6rem;
}
.bottom-left>.home>span,
.bottom-left>.share>span{
    color: #c00;
}
.home > div,
.share > div {
    font-size: 12px;
    color: #333;
}
.bottom-left>.share {
    border-left:1px solid #f0f0f0; 
}
.addcart,
.buynow {
    width: 30%;
    text-align: center;
    line-height: 3rem;
    font-size: 15px;
    color: #fff;
}
.addcart {
    background-color: #333;
}
.buynow {
    background-color: #c00;
}
</style>


