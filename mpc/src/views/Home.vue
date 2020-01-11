<template>
    <div class="home">
        <shop-search></shop-search>
        <shop-carousel :pic="pic"></shop-carousel>
        <div class="ms"><img :src="baseUrl+ms" /></div>
        <div class="showcase">
          <div class="showcase-item" v-for="(show,i) of showcase" :key="i" @click="toList(show.categoryId)">
            <img width="125px" :src="baseUrl+show.pic"/>
          </div>
        </div>
        <div>
          <product-sort @click.native="sort"></product-sort>
        </div>
        <product-list :product="product">
        </product-list>
        <!-- index默认第一个 0 -->
        <shop-foot :index="index"></shop-foot>
        <product-sku v-show="cartShow"></product-sku>
    </div>
</template>

<script>
import ShopCarousel from '../components/ShopCarousel.vue';
import ProductSort from '../components/ProductSort.vue';
import ProductList from '../components/ProductList.vue';
import ProductSku from '../components/ProductSku.vue';
import {baseUrl} from "../../baseUrl.js";
import {mapState} from 'vuex'
export default {
  name: 'home',
  components: {
    ShopCarousel,
    ProductSort,
    ProductList,
    ProductSku,
  },
  data() {
    return {
      pic:"image/carousel/carousel_1.jpg&image/carousel/carousel_2.jpg&image/carousel/carousel_3.jpg",
      ms:"",
      baseUrl,
      showcase:[],
      product:[],
      categoryId:"",
      index:0,
    }
  },
  methods: {
    // 不同条件排序
    sort(e){
      if(e.target.innerHTML === "销量"){
        this.axios.get("/index/sortSale")
        .then(result=>{
          this.product = result.data;
        });
      };
      if(e.target.innerHTML === "上新"){ // 价格
        this.axios.get("/index/sortPrice")
        .then(result=>{
          this.product = result.data;
        });
      };
      if(e.target.innerHTML === "推荐"){
        this.axios.get("/index/sortRecommend")
        .then(result=>{
          this.product = result.data;
        });
      }
    },
    load(){
      this.axios.get("/index/")
      .then((result)=>{
        this.pic = result.data.pic;
        this.ms = result.data.ms;
        this.showcase = result.data.showcase;
        this.product = result.data.product;
      })
    },
    // 跳转到商品列表页
    toList(categoryId){
      this.$store.commit('changeCategoryId',categoryId);
      this.$router.push('/List');
    },
  },
  // 在组件挂载后开始请求数据
  mounted(){
    this.load();
  },
  computed: {
    ...mapState(["cartShow"])
  },
}
</script>
<style scoped>
.home {
  width: 100%;
}
.ms {
  margin-top:2rem;
}
.ms img{
  width: 100%;
}
.showcase {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}
.showcase img {
  display: block;
}
</style>

