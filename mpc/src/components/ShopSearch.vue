<template>
    <div class="search">
        <div class="searchbox">
            <div class="search-ico"></div>
            <span>搜索商品</span>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
.search {
    position: fixed;
    display: flex;
    align-items: center;
    top: 0;
    z-index: 9999;
    width: 100%;
    height: 3.4rem;
    background-color:#fff;
}
.searchbox {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 20rem;
    margin: 0 auto;
    height: 2.1rem;
    background-color:#eee;
    border-radius: 2rem;
    font-size: 0.9rem;
    color: #aaa;
}
</style>


