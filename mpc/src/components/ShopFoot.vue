<template>
    <div>
        <div class="footer">
            <div @click="checked(0),toPage(0)" :class="{checked:status[0].checked}">
                <span class="shouye iconfont icon-shouye"></span>
                <div>首页</div>
            </div>
            <div @click="checked(1),toPage(1)" :class="{checked:status[1].checked}">
                <span class="cart iconfont icon-icon22fuzhi"></span>
                <div>购物车</div>
            </div>
            <div @click="checked(2),toPage(2)" :class="{checked:status[2].checked}">
                <span class="all iconfont icon-quanbu"></span>
                <div>全部商品</div>
            </div>
            <div @click="checked(3),toPage(3)" :class="{checked:status[3].checked}">
                <span class="service iconfont icon-icon--"></span>
                <div>联系客服</div>
            </div>
            <div @click="checked(4),toPage(4)" :class="{checked:status[4].checked}">
                <span class="me iconfont icon-geren"></span>
                <div v-if="uname===''">个人中心</div>
                <div v-else>{{uname}}</div>
            </div>
        </div>
    </div>

</template>
<script>
import {mapState,mapMutations} from 'vuex'
export default {
    props:{
        index:Number,
    },
    data() {
        return {
            status:[
                {checked:true},
                {checked:false},
                {checked:false},
                {checked:false},
                {checked:false},
            ]
        }
    },
    methods: {
        checked(index){
            for(var i = 0;i<this.status.length;i++){
                if(i==index){
                    this.status[i].checked = true;
                }else{
                    this.status[i].checked = false;
                };
            };
        },
        toPage(num){
            if(num===0){
                this.$router.push('/')
            };
            if(num===1){
                this.$router.push('/Cart');
            }
            if(num===2){
                this.$router.push('/All');
            };
            if(num===4){
                this.$router.push('/Self');
            };
        },
        ...mapMutations(["changeUname"])
    },
    mounted() {
        this.checked(this.index);
        var uname = JSON.parse(window.localStorage.getItem("userName"));
        this.changeUname(uname||"");
    },
    computed: {
        ...mapState(["uname"])
    },
}
</script>
<style scoped>
    .footer {
        width: 100%;
        height: 3.333rem;
        position: fixed;
        bottom: 0;
        display: flex;
        justify-content: space-between;
        align-content: center;
        background-color: #fff;
        z-index: 999;
        font-size: 14px;
        padding: 0 8px;
        color: #666;
        border-top: 1px solid #cecdce;
    }
    .footer>div{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .footer>div:last-child{
        margin-right: 14px;
    }
    .footer>div>span{
        font-size: 26px;
        text-align: center;
    }
    .checked {
        color: #e65e60;
    }
</style>


