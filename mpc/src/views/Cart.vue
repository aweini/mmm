<template>
    <div class="cart">
        <div class="cart-top">
            <span class="cart-title">购物车</span>
            <span class="cart-state" @click="changeState">管理</span>
        </div>
        <div v-if="cartshow">
            <div class="cartItem"  v-for="(item,i) of cartList" :key="i">
                <div class="selectItem">
                    <input type="checkbox" v-model="item.cb" @change="changeCb"/>
                </div>
                <div class="item-left">
                    <img src="../assets/img/test.jpg" />
                </div>
                <div class="itemcontent">
                        <div class="item-title">{{item.detailName}}</div>
                        <div class="item-spec">
                            <span class="item-color">颜色: {{item.color}}</span>
                            <span class="item-size">型号: {{item.size}}</span>
                        </div>
                        <div class="item-bottom">
                            <span class="item-price">￥{{item.price}}</span>
                            <div class="item-count">
                                <span class="minus" @click="minus($event,i)">-</span>
                                <span class="i-count">{{item.count}}</span>
                                <span class="add" @click="add($event,i)">+</span>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="unLogin" v-else-if="unLogin" @click="goLogin">登录查看购物详情</div>
        <div class="noProduct"  @click="goHome" v-else>快去购物吧</div>
        <div class="total" v-if="state">
            <div class="selectAll">
                <span>全选</span><input type="checkbox" v-model="allcb" @change="selectAll"/>
            </div>
            <div class="total-right">
                <span class="total-title">合计:</span><span class="total-price">￥{{totalPrice}}</span>
                <span class="pay">结算</span>
            </div>
        </div>
        <div class="total" v-else>
            <div class="selectAll" >
                <span>全选</span><input type="checkbox" v-model="allcb" @change="selectAll" />
            </div>
            <div class="total-right">
                <span class="del pay" @click="del">删除</span>
            </div>
        </div>
        <shop-foot :index="index"></shop-foot>
    </div>
</template>
<script>
import Vue from "vue";
export default {
    name:"Cart",
    data() {
        return {
            index:1,
            state:true,
            uname:"",
            cartshow:true,
            unLogin:false,
            allcb:false,
            cartList:[],
            totalPrice:0,
        }
    },
    methods: {
        // 很笨的数量计算方法(肯定有简易的方法 vue.set)
        // 只有data中的数据才能动态显示到页面中，v-for默认只会对页面渲染一次，即使其数组中的数据发生 了变化，视图(view)中也不会发生变化：解决办法Vue.set()
        minus(e,i){   
           this.cartList[i].count-=1;
           Vue.set(this.cartList[i],i,this.cartList[i]);
            if(this.cartList[i].count<=0){
                this.$toast("不能再少了!");
                this.cartList[i].count=0;
            }
            // 总价格随着数量的减少而减少(每个商品的价格不一样,所以使用i)
            if(this.cartList[i].cb){
                this.totalPrice-=this.cartList[i].price;
            }
        },
        add(e,i){
            this.cartList[i].count+=1;
            Vue.set(this.cartList[i],i,this.cartList[i]);
            if(this.cartList[i].count>=10){
                this.$toast("不能再多了!");
                this.cartList[i].count=10;
            };
            // 总价格随着数量的增多而增多(每个商品的价格不一样,所以使用i)
            // 如果此项商品没有被选中则商品加减不影响总的价格
            if(this.cartList[i].cb){
                this.totalPrice+=this.cartList[i].price;
            }
        },
        goLogin(){
            this.$router.push('/Login');
        },
        goHome(){
            this.$router.push('/');
        },
        changeState(e){
            if(this.state){
                this.state = false;
                e.target.innerHTML = "完成"
                for(var item of this.cartList){
                    item.cb = false;
                }
                this.allcb = false;
            }else{
                this.state = true;
                e.target.innerHTML = "管理";
                for(var item of this.cartList){
                    item.cb = false;
                }
                this.allcb = false;
            }
        },
        getCart(){
             this.axios.get("/cart/getproduct")
            .then((result)=>{
                if(result.data==3){
                    this.unLogin = true;
                    this.cartshow = false;
                }else if(result.data==0){
                    this.unLogin = false;
                    this.cartshow = false;
                }else{
                    var rows = result.data;
                    for(var list of rows){
                        list.cb = false;
                    }
                    this.cartList = rows;
                }
            }) 
        },
        changeCb(){
            var length = this.cartList.length;
            var sum = 0;
            this.totalPrice = 0;
            for(var i=0;i<this.cartList.length;i++){
                if(this.cartList[i].cb){
                    sum+=1;
                    this.totalPrice+=(this.cartList[i].price*this.cartList[i].count)
                }
            }
            if(sum===length){
                this.allcb = true;
            }else{
                this.allcb = false;
            }
        },
        selectAll(){
            if(this.allcb){
                for(var i=0;i<this.cartList.length;i++){
                    this.cartList[i].cb = this.allcb;
                    this.totalPrice+=(this.cartList[i].price*this.cartList[i].count);
                }
            }else {
                for(var i=0;i<this.cartList.length;i++){
                    this.cartList[i].cb = this.allcb;
                }
                this.totalPrice = 0;
            }
        },
        del(){
            var str = "";
            this.$dialog.confirm({title:"提示",message:"是否删除指定商品?"})
            .then(()=>{
                for(var i = 0; i<this.cartList.length;i++){
                    if(this.cartList[i].cb){
                        str+=this.cartList[i].id + ","
                    }
                }
                str = str.substring(0,str.length-1);
                var obj = {id:str};
                this.axios.get("/cart/del",{
                    params:obj
                }).then((result)=>{
                    if(result.data===1){
                        this.getCart();
                        this.allcb = false;
                    }
                })
            }).catch(()=>{
                return;
            })
        }
    },
    created() {
       this.getCart();
    },
    mounted() {
        this.uname = JSON.parse(window.localStorage.getItem("userName"));
    },
}
</script>
<style scoped>
    .cart{
     position: fixed;
     top: 0;
     width: 100%;
     height: 100%;
     background-color: #f0f0f0;
    }
    .cart-top {
        width: 100%;
        height: 3rem;
        background-color: #f7f7f8;
        border-bottom: 1px solid #ccc;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        box-sizing: border-box;
    }
    .cart-top>.cart-state{
        color: #333;
        margin-right: 1rem;
        font-size: 14px;
    }
    .cart-top>.cart-title{
        margin-right: 7rem;
        color: #333;
    }
    .cartItem {
        width: 96%;
        margin: 1rem auto;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        background-color: #fff;
        height: 7rem;
        border-radius: 0.4rem;
    }
    .cartItem>.selectItem{
        padding: 0 0.5rem;
    }
    .item-left{
        width: 5.2rem;
        height: 5.2rem;
        overflow: hidden;
    }
    .item-left>img{
        width: 100%;
    }
    .itemcontent {
        width: 60%;
        display: flex;
        flex-direction: column;
        padding-left: 0.9rem;
    }
    .itemcontent>.item-title{
        color: #333;
        margin-bottom: 0.5rem;
    }
    .itemcontent>.item-spec{
        color: #aaa;
        font-size: 12px;
    }
    .itemcontent>.item-spec>.item-size{
        padding-left: 0.6rem;
    }
    .item-bottom{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 1.8rem;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    }
    .item-bottom>.item-price{
        color: #f00;
    }
    .item-bottom>.item-count>span{
        display: inline-block;
        width: 1.5rem;
        height: 1.5rem;
        border:1px solid #ccc;
        line-height: 1.5rem;
        text-align: center;
        font-size: 14px;
        color: #666;
    }
    .item-bottom>.item-count>span:not(:first-child){
        border-left: none;
    }
    .total {
        position: fixed;
        bottom: 3.4rem;
        width: 100%;
        height: 3rem;
        background-color: #fff;
        border-top: #ddd;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-sizing: border-box;
    }
    .total>.selectAll{
        padding-left: 1rem;
    }
    .total>.selectAll>span{
        color: #333;
        margin-right: 0.5rem;
    }
    .total>.total-right{
        margin-right: 0.8rem;
    }
    .total>.total-right>.pay{
        display: inline-block;
        width: 4.5rem;
        height: 2rem;
        border-radius: 2rem;
        line-height: 2rem;
        text-align: center;
        color: #fff;
        background-color: #f00;
    }
    .total-right>.total-title{
        color: #666;
        font-size: 16px;
    }
    .total-right>.total-price{
        color: #f00;
        font-size: 13px;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        margin-right: 0.7rem;
    }
    .unLogin,.noProduct{
        position: absolute;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        border:1px solid #ccc;
        padding: 0.5rem 1rem;
        color: #f00;
    }
</style>


