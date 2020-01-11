<template>
    <div class="carousel">
        <van-swipe :autoplay="3000" indicator-color="white" :height="348">
            <van-swipe-item v-for="(p,i) of pics" :key="i"><img :src="baseUrl+p">
            </van-swipe-item>
        </van-swipe>
    </div>
</template>
<script>
import {baseUrl} from "../../baseUrl.js"
export default {
    name:"carousel",
    // 接收上一级组件传过来的参数
    props:{
        pic:String,
    },
    data() {
        return {
          baseUrl,
        }
    },
    // 根据pic计算pics属性并返回(pics属性是用于v-for循环创建轮播图的)
    computed: {
        pics(){
            return this.pic.split("&");
        }
    },
}
</script>
<style scoped>
.carousel {
    width: 100%;
    height: 20rem;
    margin-top: 3.4rem;
}
.carousel img {
    width: 100%;
}
</style>


