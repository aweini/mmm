<template>
    <div>
        <all-search></all-search>
        <all-sort @click.native="sort"></all-sort>
        <div class="blank"></div>
        <product-list :product="product">
        </product-list>
        <shop-foot :index="index"></shop-foot>
    </div>
</template>
<script>
    import ProductList from '../components/ProductList.vue';
    import AllSearch from '../components/All/AllSearch.vue';
    import AllSort from '../components/All/AllSort.vue';
export default {
    data() {
        return {
            baseUrl:"",
            product:[],
            index:2,
        }
    },
    methods: {
        load(url){
            this.axios.get(url)
            .then((result)=>{
                this.product = result.data;
            })
        },
        sort(e){
            if(e.target.innerHTML === "价格↑"){
                this.load("/index/ascprice");
            };
            if(e.target.innerHTML === "价格↓"){
                this.load("/index/descprice");
            };
            if(e.target.innerHTML === "销量"){   
                this.load("/index/descsale");
            };
            if(e.target.innerHTML === "默认"){
                this.load('/index/toall');
            }
        },
    },
    mounted() {
        this.load('/index/toall');
    },
    components:{
        ProductList,
        AllSearch,
        AllSort
    }
}
</script>
<style scoped>
    .blank{
        width: 100%;
        height: 6.5rem;
    }
</style>


