<template>
    <div v-show="cartShow">
        <div class="lay"></div>
        <div class="sku">
            <div class="close iconfont icon-guanbi" @click="close"></div>
            <div class="sku-top">
                <!-- 上部左侧缩略图 -->
                <div class="sku-img">
                    <img src="../assets/img/test.jpg" alt="">
                </div>
                <div class="sku-text">
                    <span class="sku-title">{{detailName}}</span>
                    <span class="sku-price">￥ {{maxPrice}}</span>
                    <span class="sku-count">库存 {{totalCount}} 件</span>
                </div>
            </div>
            <div class="sku-color">
                <div class="sku-color-title">颜色</div>
                <div class="sku-color-item">
                    <span class="sku-black" @click="changeColor(0),selectColor($event)"
                    :class="{colorChecked:colorStatus[0].cIschecked}">黑色</span>
                    <span class="sku-white"  @click="changeColor(1),selectColor($event)"
                    :class="{colorChecked:colorStatus[1].cIschecked}">白色</span>
                </div>
            </div>
            <div class="sku-size">
                <div class="sku-size-title">尺寸</div>
                <div class="sku-size-item">
                    <span class="sku-m" @click="changeSize(0),selectSize($event)"
                    :class="{sizeChecked:sizeStatus[0].sIschecked}">M</span>
                    <span class="sku-l" @click="changeSize(1),selectSize($event)"
                    :class="{sizeChecked:sizeStatus[1].sIschecked}">L</span>
                    <span class="sku-xl" @click="changeSize(2),selectSize($event)"
                    :class="{sizeChecked:sizeStatus[2].sIschecked}">XL</span>
                </div>
            </div>
            <div class="customer-count">
                <span class="customer-count-title">购买数量</span>
                <div class="customer-count-item">
                    <span class="minus" @click="minus">-</span>
                    <span class="c-count">{{count}}</span>
                    <span class="add" @click="add">+</span>
                </div>
            </div>
            <div class="confirm">
                <div class="addcart" @click="addCart">加入购物车</div>
                <div class="buynow" @click="buynow">立即购买</div>
            </div>
        </div>
    </div>
</template>
<script>
import {mapState} from "vuex"
export default {
    name:"ProductSku",
    data() {
        return {
            colorStatus:[
                {cIschecked:true},
                {cIschecked:false}
            ],
            sizeStatus:[
                {sIschecked:true},
                {sIschecked:false},
                {sIschecked:false}
            ],
            count:0,
            cartShow:false,
            clothColor:"黑色",
            clothSize:"M",
            totalCount:"55",
            dName:"",
            username:""
        }
    },
    methods: {
        changeColor(index){
            for(var i=0;i<this.colorStatus.length;i++){
                if(index === i){
                    this.colorStatus[i].cIschecked=true;
                }else{
                    this.colorStatus[i].cIschecked=false;
                }
            }
        },
        changeSize(index){
            for(var i = 0; i < this.sizeStatus.length;i++){
                if(index === i){
                    this.sizeStatus[i].sIschecked = true;
                }else{
                    this.sizeStatus[i].sIschecked = false;
                }
            }
        },
        minus(){
            this.count--;
            if(this.count<0){
                this.$toast('亲！不能再少啦!');
                this.count =0;
            }
        },
        add(){
            this.count++;
            if(this.count>this.totalCount){
                this.$toast('亲！都被你买光啦!');
            }
        },
        close(){
            this.cartShow = false;
            this.$store.commit("changeCartShow",this.cartShow);
        },
        // 动态获取不同类型产品数量的函数
        getDesc(){
            if(!this.dName){
                return; // 页面首页打开没有选择产品名时,不会像后台获取商品的规格信息
            }
                this.axios.get("/index/clothselect",{
                params:{
                    dName:this.dName,
                    color:this.clothColor,
                    size:this.clothSize,
                }
            }).then((result)=>{
                    this.totalCount = result.data[0].totalCount;
            })
        },
        // 不同的颜色
        selectColor(e){
            this.clothColor = e.target.innerHTML;
            this.getDesc();
        },
        // 不同的尺寸  
        selectSize(e){
            this.clothSize = e.target.innerHTML;
            this.getDesc();
        },
        addCart(){
            if(this.count===0){
                this.$toast("请选择购买数量！");
                return;
            }
            // 后面需要查询axios的post形式请求的传参方式(目前这种方法太复杂、太笨)
            var str= `detailName=${this.dName}&&color=${this.clothColor}&&size=${this.clothSize}&&pic=${"image/shangyi/test.jpg"}&&count=${this.count}&&price=${599}`
            this.axios.post('/cart/addproduct',str).then(result=>{
                if(result.data===1){
                    this.$toast("添加成功")
                };
                if(result.data===3){
                    this.$toast("请先登录")
                    setTimeout(()=>{ // 避免提示信息在登录页面显示
                        this.$router.push('/Login')
                    },2000)
                }
            })
        },
        buynow(){
            if(this.count===0){
                this.$toast("请选择购买数量！");
                return;
            };
            let el = this
            if(!this.username){
                this.$toast("请先登录")
                setTimeout(()=>{ // 避免提示信息在登录页面显示
                    this.$router.push('/Login')
                },2000)
            }
        }
    },
    watch: {
        dName(){
            this.getDesc()
        },
    },
    // 因为目前不清楚mapState所带来的属性值除了显示还有没有其他的用法以及怎么用
    mounted() {
        this.dName = JSON.parse(window.localStorage.getItem("defaultName"));
        this.username = JSON.parse(window.localStorage.getItem("userName"));
    },
    computed: {
        ...mapState(["detailName","maxPrice"])
    },
}
</script>
<style scoped>
    .lay {
        position: fixed;
        top:0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.3);
        z-index: 1001;
    }
    .sku{
        width: 100%;
        position: fixed;
        display: flex;
        flex-direction: column;
        bottom: 0;
        z-index: 1002;
        background-color: #fff;
    }
    .close {
        position: absolute;
        right: 0.3rem;
        font-size: 30px;
        color: #c00;
    }
    .sku-top {
        padding-left: 0.8rem;
        display: flex;
        height: 6rem;
        border-bottom: 1px solid #f0f0f0;
    }
    .sku-top>.sku-img{
        width: 6.2rem;
        height: 6.2rem;
        padding: 0.3rem;
        margin-top:-2.3rem;
        background-color: #fff;
        border-top-left-radius: 0.2rem;
        border-top-right-radius: 0.2rem; 
    }
    .sku-top>.sku-img img {
        width: 100%;
    }
   .sku-top>.sku-text {
       margin-left: 1.7rem;
       display: flex;
       flex-direction: column;
       color: #c00;
       font-size: 14px;
       height: 6rem;
    }
    .sku-top>.sku-text span {
        margin-top: 0.4rem;
    }
    .sku-top>.sku-text>.sku-count{
        font-size: 12px;
    }
    .sku-color,
    .sku-size {
        padding: 0.8rem 0;
        padding-left: 0.8rem;
        color: #444;
        font-size: 14px;
        border-bottom: 1px solid #f0f0f0;
        padding-bottom: 1.2rem;
    }
    .sku-color>.sku-color-title,
     .sku-size>.sku-size-title{
        margin-bottom: 1rem;
    }
    .sku-color>.sku-color-item>span ,
    .sku-size>.sku-size-item>span{
        margin-left: 1.2rem;
        border:1px solid #ddd;
        padding: 0.3rem 0.6rem;
        border-radius: 0.2rem;
    }
    .customer-count {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
        color: #444;
        padding: 1rem 0;
        padding-left: 0.8rem;
        border-bottom: 1px solid #f0f0f0;
    }
    .customer-count-item {
        margin-right: 0.8rem;
        display: flex;
        border-bottom: 1px solid #f0f0f0;
    }
    .customer-count>.customer-count-item>span{
        width: 2.3rem;
        height: 2.3rem;
        border:1px solid #f0f0f0;
        line-height: 2.3rem;
        text-align: center;
    }
    .customer-count>.customer-count-item>span:not(:first-child){
        border-left: none;
    }
    .customer-count>.customer-count-item>.add,
    .customer-count>.customer-count-item>.minus {
        font-size: 18px;
    }
    .confirm {
        padding-top: 1rem;
        display: flex;
    }
    .confirm>div {
        width: 50%;
        height: 3rem;
        line-height: 3rem;
        text-align: center; 
        color: #fff;
        font-size: 14px;
    }
    .confirm>.addcart {
        background-color: #333;
    }
    .confirm>.buynow {
        background-color: #c00;
    }
    .colorChecked,
    .sizeChecked {
        background-color: #333;
        color: #fff;
    }
</style>

