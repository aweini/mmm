<template>
    <div class="list">
        <shop-search></shop-search>
        <div class="blank"></div>
        <product-sort @click.native="sort"></product-sort>
        <product-list :product="product"></product-list>
        <shop-foot></shop-foot>
    </div>
</template>
<script>
import ProductSort from '../components/ProductSort.vue';
import ProductList from '../components/ProductList.vue';
import {baseUrl} from "../../baseUrl.js";
export default {
    data() {
        return {
            product:[],
            CaId:2,
        }
    },
    components: {
        ProductSort,
        ProductList,
    },
    methods: {
        sort(e){
        if(e.target.innerHTML === "销量"){
            this.axios.get("/index/sortSale",
            {
                params:{
                    CaId:this.CaId,
                }
            })
            .then(result=>{
            this.product = result.data;
            });
        };
        if(e.target.innerHTML === "上新"){ // 价格
            this.axios.get("/index/sortPrice",
            {
                params:{
                    CaId:this.CaId,
                }
            })
            .then(result=>{
            this.product = result.data;
            });
        };
        if(e.target.innerHTML === "推荐"){
            this.axios.get("/index/sortRecommend",{
                params:{
                    CaId:this.CaId,
                }
            })
            .then(result=>{
            this.product = result.data;
            });
        }
        },
        // 根据CategoryId的不同加载列表
        load(CategoryId){
            this.axios.get("/index/toList",{
                params:{CategoryId}
            })
            .then(result=>{
                this.product = result.data;
            });
        }
    },
    mounted() {
        this.load(this.$store.getters.getCategoryId);
        this.CaId = this.$store.getters.getCategoryId;
    },
}
</script>
<style scoped>
    .list {
        width: 100%;
    }
    .blank {
        width: 100%;
        margin-top: 4.5rem;
    }
</style>


