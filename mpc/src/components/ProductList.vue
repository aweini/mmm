<template>
    <div>
        <div class="product-list">
            <div class="product-item" v-for="(pro,i) of product" :key="i">
                <div class="product-img">
                    <img :src="baseUrl+pro.pic" @click="toDetail(pro.detailName)" />
                </div>
                <span class="product-title">{{pro.detailName}}</span>
                <div class="product-btm">
                    <span class="product-price">{{'￥'+pro.maxPrice.toFixed(2)}}</span>
                    <span class="shop-cart iconfont icon-gouwuche" @click="changeShow($event),changeDname(pro.detailName),changePrice(pro.maxPrice)"></span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import {baseUrl} from "../../baseUrl.js"
import {mapMutations} from 'vuex'
export default {
    name:"ProductList",
    props:{
        product:Array,
    },
    data(){
        return {
            baseUrl,
            cartShow:false,
        }
    },
    methods: {
        ...mapMutations(["changeCartShow","changeDetailName","changeMaxPrice"]),
        // 商品规格页面的显示与隐藏(使用v-show;变量使用vuex进行管理，点击购物车变量为true,点击规格页面右上角的关闭按钮,变量未false,两次更改变量的过程均是通过vuex实现)
        changeShow(e){
            this.cartShow = true;
            this.changeCartShow(this.cartShow);
        },
        // 通过vuex管理detailName变量，然后通过父子间的传值，有home组件传递到sku组件
        changeDname(detailName){
            this.changeDetailName(detailName);
        },
        changePrice(maxPrice){
            this.changeMaxPrice(maxPrice);
        },
        // 点击商品大图进入对应的商品详情页(通过detailName查询不同商品的具体信息并渲染出来)
        toDetail(detailName){
            this.changeDetailName(detailName);
            this.$router.push("/Detail");
        }
    },
}
</script>
<style scoped>
    .product-list {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }
    .product-item {
        width: 47%;
        border:1px solid #f0f0f0;
        margin-top:0.4rem;
    }
    .product-title {
        display: block;
        color: #666;
        font-size: 14px;
        margin: 1rem 0.2rem; 
        margin-top:0.7rem;
               
    }
    .product-item img {
        width: 100%;
    }
    .product-btm {
        color: #c00;
        display: flex;
        justify-content:space-between;
        align-items: center;
        font-size: 14px;
        font-weight: 700;
        margin:0.4rem 0;
        margin-top:0.8rem;
        padding: 0 0.3rem;
    }
    .shop-cart {
        font-size: 18px;
    }
    .product-item:last-child{
        margin-bottom: 3.4rem;
    }
</style>

