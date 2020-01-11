<template>
    <div class="allsearch">
        <div class="lay" :class="{unfold:visi}">
            <div class="slidefold">
                <ul>
                    <li>上衣/打底</li>
                    <li>毛衫</li>
                    <li>外套/大衣</li>
                    <li>羽绒/棉服</li>
                    <li>连衣裙/半裙</li>
                    <li>裤子</li>
                    <li>靴子</li>
                    <li>配件</li>
                </ul>
            </div>
        </div>
        <div class="slideall iconfont icon-gengduo-2" @click="overlay">
        </div> 
        <div class="allsearch-box">
            <span class="allsearch-icon iconfont icon-tubiao-fangdajing"></span>
            <input type="text" placeholder="搜索商品" class="searchall" @focus="userSearch" :class="{wSearch:wantSeacrch}" @blur="outSearch"  v-model="val">
            <span :class="{cancled:cancle}" class="cancle-w">取消</span>
            <button :class="{btn:outbtn}">搜索</button>
        </div>
    </div>
</template>
<script>
export default {
    name:"AllSearch",
    data() {
        return {
            wantSeacrch:false,
            cancle:false,
            outbtn:false,
            visi:false,
            val:"",
        }
    },
    methods: {
        userSearch(){
            if(!this.wantSeacrch){
                this.wantSeacrch=true;
                this.cancle = true;
            };
        },
        outSearch(){
            this.wantSeacrch=false;
            this.cancle = false;
            this.outbtn = false;
        },
        overlay(){
            if(!this.visi){
                this.visi = true;
            }else{
                this.visi = false;
            }
        }
    },
    watch: {
        val(){
            this.cancle = false;
            this.outbtn = true;
        }
    },
}
</script>
<style scoped>
    .allsearch {
        position: fixed;
        width: 100%;
        display: flex;
        align-items: center;
        height: 3.5rem;
        background-color: #f3f3f3;
    }
    .slideall {
        font-size: 25px;
        color:#444;
        padding: 0 0.5rem;
    }
    .allsearch-box {
        display: flex;
    }
    .allsearch-icon {
        font-size: 30px;
        text-align: center;
        width: 40px;
        background-color: #ddd;
        color: #fff;
        border-top-left-radius: 0.3rem;
        border-bottom-left-radius: 0.3rem;
        line-height: 40px;
    }
    .searchall{
        width: 15.8rem;
        outline: none;
        border:none;
        font-size: 0.9rem;
        padding-left: 0.5rem;
        color: #999;
    }
    .wSearch {
        width: 14rem;
    }
    .cancle-w{
        overflow: hidden;
        width: 2rem;
        opacity: 0;
    }
    .cancled {
        color: #2491F7;
        line-height: 2.5rem;
        padding-left: 0.7rem;
        width: 2rem;
        opacity: 1;
    }
    .allsearch-box>button {
        border:none;
        background-color: #2491F7;
        color: #fff;
        width: 3rem;
        font-size: 0.9rem;
        margin-left: -1.5rem;
        border-radius: 0.2rem;
        display: none;
    }
    .allsearch-box>button.btn {
        display: block;
    }
    .lay {
        position: fixed;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,.6);
        z-index: 9988;
        top:3.5rem;
        display: none
    }
    .unfold {
        display: block;
    }
    .slidefold {
        position: absolute;
        width: 68%;
        height: 100%;
        z-index: 9989;
        background-color: #fff;
    }

    .slidefold ul li {
        padding-left: 0.9rem;
        margin-top: 1rem;
        border-bottom: 1px solid #fff;
        height: 2rem;
        line-height: 2rem;
        background-color: #ddd;
    }
</style>


