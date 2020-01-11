<template>
    <div>
        <div class="sort">
            <span class="sort-text" @click="changeState(0)" :class="{selected:currentIndex[0].isSelect}">推荐</span>
            <span>|</span>
            <span class="sort-text" @click="changeState(1)" :class="{selected:currentIndex[1].isSelect}">销量</span>
            <span>|</span>
            <span class="sort-text" @click="changeState(2)" :class="{selected:currentIndex[2].isSelect}">上新</span>
        </div>
    </div>
</template>
<script>
export default {
    name:"ProductSort",
    data() {
        return {
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
            ]
        }
    },
    methods: {
        changeState(index){
            for(var i = 0;i< this.currentIndex.length;i++ ){
                if(index===i){
                    this.currentIndex[i].isSelect=true;
                }else{
                    this.currentIndex[i].isSelect=false;
                }
            }
        }
    },
}

</script>
<style scoped>
.sort {
    width: 100%;
    display: flex;
    justify-content: center;
    margin: 1.3rem 0;
}
.sort {
    color: #ccc;
    font-size: 0.8rem;
}
.sort span:not(.sort-text){
    margin: 0 0.8rem;
}
.sort>span.selected {
    color: #666;
}
</style>

