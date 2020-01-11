<template>
    <div class="allsort">
        <span :class="{checked:status[0].ischecked}" @click="checked(0)">默认</span>
        <span :class="{checked:status[1].ischecked}" @click="checked(1)">价格↑</span>
        <span :class="{checked:status[2].ischecked}" @click="checked(2)">价格↓</span>
        <span :class="{checked:status[3].ischecked}" @click="checked(3)">销量</span>
    </div>
</template>
<script>
export default {
    name:"AllSort",
    data() {
        return {
            status:[
                {ischecked:true},
                {ischecked:false},
                {ischecked:false},
                {ischecked:false},
            ]
        }
    },
    methods: {
        checked(index){
            for(var i = 0; i < this.status.length;i++){
                if(i === index){
                    this.status[i].ischecked = true;
                }else {
                    this.status[i].ischecked = false;
                }
            }
        }
    },
}
</script>
<style scoped>
    .allsort {
        position: fixed;
        width: 100%;
        height: 3rem;
        display: flex;
        justify-content:space-between;
        align-items: center;
        font-size: 0.9rem;
        color: #333;
        box-sizing: border-box;
        padding: 0 1.5rem;
        top:3.5rem;
        background-color: #fff;
    }
    .checked {
        color: #f60;
    }
</style>


