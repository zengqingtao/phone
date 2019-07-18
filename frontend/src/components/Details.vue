<template>
  <div class="container">
    <div class="head">
      <div class="carousel">
      <img src="../assets/image/details/428_428_1555465042638.png">
      </div>
      <div>
        <p class="price">￥{{product.price}}</p>
        <div class="title">{{product.title}}</div>
        <div class="detail">
          【超级618】①享6期分期免息 ②V3-V5会员额外赠皮革保护壳+一年期碎屏险 ③购机赢法国豪华游 ④晒单赠好礼 </div>
      </div>
      <!--促销-->
      <div class="promotion">
        <div class="left">促销</div>
        <div class="right">
          <div>
            <span>会员专享</span>
            <span>V3-V5会员赠碎屏险+皮革保护壳</span>
          </div>
          <div>
            <span>分期免息</span>
            <span>花呗、掌上生活、工行、农行分期支付可享免息</span>
          </div>
          <div>
            <span>赠送积分</span>
            <span>购买即赠商城积分，积分可抵现</span>
          </div>
        </div>
      </div>
    </div>
    <div class="middle">
      <!--颜色-->
      <div class="color">
        <div class="left">颜色</div>
        <div class="right">
          <!--<div v-for="(sp,i) of specs" :key="i">
            <router-link  :class="{
                active:sp.lid==lid}" :to="`/details/${sp.lid}`">{{sp.spec}}
            </router-link>
          </div>-->
        </div>
      </div>
      <!--版本-->
      <div class="spec">
        <div class="left">版本</div>
        <div class="right">
          <router-link class="speclink" v-for="(sp,i) of specs" :key="i"   :class="{
              active:sp.pid==pid}" :to="`/details/${sp.pid}`">{{sp.spec}}
          </router-link>
        </div>
      </div>
      <div class="type">
        <div class="left">类型</div>
        <div class="right">
          <div>官方标配</div>
        </div>
      </div>
      <div class="num">
        <div class="left">数量</div>
        <div class="right">
          <img src="../assets/image/details/53.png">
          <span>1</span>
          <img src="../assets/image/details/54.png">
        </div>
      </div>
    </div>
    <mt-tabbar class="tabbar" fixed>
      <router-link to="/">
        <div class="tabitem1">
          <img src="../assets/image/details/icon-home-black.png">
          <div class="tabtxt">首页</div>
        </div>
      </router-link>
      <router-link  to="/index">
        <div class="tabitem1">
          <img src="../assets/image/details/icon-service-black.png">     
          <div class="tabtxt">客服</div>
        </div>
      </router-link>
      <router-link  to="/cart">
        <div class="tabitem1">
          <img src="../assets/image/details/icon-cart-black.png">       
          <div class="tabtxt">购物车</div>
        </div>
      </router-link>
      <router-link  to="/toPay">
        <div class="tabitem2">
          <div class="toCart">加入购物车</div>
        </div>
      </router-link>
      <router-link  to="/toPay">
        <div class="tabitem2">
          <div class="toPay">立即购买</div>
        </div>
      </router-link>
    </mt-tabbar>
  </div>
</template>
<script>
export default {
    data(){
      return{
        product:{title:"",color:"",price:0},
        specs:[],
        pics:[],
        selected:"",
      }
    },
    props:["pid"],
    created(){
      this.load();
    },
    methods:{
      load(){
        this.axios.get("http://localhost:3000/details",{
        params:{
          pid:this.pid,
        }
      }).then(result=>{
        var {product,specs,pics}=result.data;
        this.product=product;
        this.specs=specs;
        this.pics=pics;
      })
      }
    },
    watch:{
      pid(){
        this.load();
      }
    }
}
</script>
<style>
  body{   
    background-color:#F9F9F9 !important;    
  }
  /*设置页面中灰色横条样式*/ 
  .head,.middle{
    background-color:#fff;
    padding:0 1rem 0.5rem 1rem;
  }
  .middle{
    margin-top:1rem;
    padding-top:0.5rem;
  }
  .carousel{
    height:21rem;
  }
  .carousel>img{
    width:auto;
    height:100%;
  }
  /**价格商品详情部分的样式 */
  .title{
    font-size:.1.1rem;
    color:#333;
    font-weight:bold;
  }
  .price{
    font-size:1.3rem;
    color:#ca141d;
    font-weight:bold;
  }
  .detail{
    font-size:0.8rem;
    color:#ca141d;
  }
  /*促销、颜色、版本、类型、数量部分的共同样式*/ 
  .promotion,.color,.spec,.type,.num{
    display:flex;
    justify-content:space-between;
    font-size:0.8rem;
    color:#666666;
  }
  /*所有left的共同样式*/ 
  .promotion .left,.color>.left,.type>.left,.num>.left{
    width:2.5rem;
  }
  .spec>.left{
    width:4rem;
  }
  .promotion .right,.color>.right,.spec>.right,.type>.right,.num>.right{
    padding-left:1.5rem;
  }
  /**促销部分的样式 */
  .promotion{
    margin-top:0.5rem;
    border-top:1px solid #F5F5F5;
    padding-top:0.5rem;
  }
  .promotion .right>div>span:first-child{
    display:inline-block;
    width:5rem;
    height:1.5rem;
    text-align:center;
    border:1px solid #EF5A62;
    border-radius:0.7rem;
    color:#EF5A62;
    margin-right:0.3rem;
  }
  .promotion .right>div{
    display: -webkit-box;
    -webkit-box-orient: vertical;
    /**设置多少行后溢出就隐藏 */
    -webkit-line-clamp: 1;
    overflow: hidden;
  }
  .promotion .right>div+div{
    margin-top:0.3rem;
  }
  /*颜色*/
  .color>.left{
    margin-top:0.2rem;
  }
  .color>.right,.spec>.right,.num>.right{
    display:flex;
    flex-wrap:wrap;
  }
  .color>.right>div{
    width:3.8rem;
    border:1px solid #666;
    border-radius:0.8rem;
    text-align:center;
    margin-right:0.2rem;
    margin-top:0.2rem;
  }
  /*版本*/
  .spec{
    padding-top:0.8rem;
  }
  .spec>.right>.speclink{
    width:8rem;
    text-align:center;
    font-size:0.6rem;
    color:#000;
    border:1px solid #000;
    border-radius:0.5rem;
    margin-right:0.2rem;
    margin-top:0.2rem;
  }
    .spec>.right>.speclink.active{
      color:#ca141d;
      border-color:#ca141d;
    }
  /*类型*/ 
  .type{
    justify-content:flex-start;
    padding-top:1.5rem;
  }
 .type>.right>div{
   width:5.5rem;
   text-align:center;
   color:#ca141d;
   border:1px solid #ca141d;
   border-radius:0.65rem;
 }
  /*数量*/ 
 .num{
   padding-top:1.5rem;
   align-items:center;         
   justify-content:flex-start;
 }
 .num>.right{
   align-items:center;      
 }
 .num>.right>img{
   width:2rem;
   height:2rem;
 }
 .num>.right>span{
   font-size:1.3rem;
   color:#333;
   vertical-align:middle;   
 }
/**底部导航*/
.tabbar{
  height:3.2rem;
  padding:0.5rem 0;
  line-height:1;  
  align-items:center;  
  justify-content:space-between;
}
.tabitem1{
  width:3.5rem !important;
  font-size:0.7rem;
  color:#000;
}
.tabitem1 img{
  width:1.3rem;  
}
.tabitem2{
  width:5rem;
  height:2.2rem;
  font-size:0.9rem;
  color:#fff;
  background-color:#ca141d;
  display:flex;
  align-items:center;
  justify-content:center;
}

</style>