<template>
  <div class="container">
    <!--头部logo，搜索、、-->
    <div class="header">
      <img class="logo" src="../../assets/image/index/logo_vmall.png"> 
      <div>
        <router-link :to="`/search`">
          <div class="search">
            <img src="../../assets/image/index/sousuo.png">
            <span>HUAWEI PRO</span>
          </div>
        </router-link>
      </div>
      <div>
        <router-link to="">
          <img src="../../assets/image/index/duanxin.png">
        </router-link>        
        <router-link :to="`/login`">
          登录  
        </router-link>
      </div>
    </div>
    <!--轮播-->
    <div class="carousel">
      <div>
        <mt-swipe >
          <mt-swipe-item v-for="(item,i) of urls" :key="i">
            <img :src="require(`../../assets/image/index/${item.imgUrl}`)">
          </mt-swipe-item>
        </mt-swipe>
      </div>
    </div>
    <!--f1--> 
    <div class="f1">
      <div v-for="(item,i) of f1" :key="i">
        <router-link :to="`/details/${item.pid}`">
          <img :src="require(`../../assets/image/index/${item.pic}`)">
          <p>{{item.title}}</p>
        </router-link>
      </div>
    </div>
    <!---->
    <div class="f2">
      <swipe-slide :f2="f2"></swipe-slide>
    </div>
    <!--f3 产品列表-->
    <div class="list">
      <div class="list1">
        <div class="list1-left">
          <div>
            <router-link :to="`/details/${f3[0].pid}`"><img :src="require(`../../assets/image/index/f3-1.jpg`)"></router-link>            
          </div>
          <div>
            <router-link :to="`/details/${f3[1].pid}`"><img :src="require(`../../assets/image/index/f3-2.jpg`)"></router-link>
            <router-link :to="`/details/${f3[2].pid}`"><img :src="require(`../../assets/image/index/f3-3.jpg`)"></router-link>
          </div>
        </div>
        <div class="list1-right">
          <router-link :to="`/details/${f3[3].pid}`"><img :src="require(`../../assets/image/index/f3-4.jpg`)"></router-link>       
          <router-link :to="`/details/${f3[4].pid}`"><img :src="require(`../../assets/image/index/f3-5.jpg`)"></router-link>        
          <router-link :to="`/details/${f3[5].pid}`"><img :src="require(`../../assets/image/index/f3-6.jpg`)"></router-link>        
          <router-link :to="`/details/${f3[6].pid}`"><img :src="require(`../../assets/image/index/f3-7.jpg`)"></router-link>        
        </div>
      </div>
      <div class="list-footer">
        <router-link :to="`/details/${item.pid}`" v-for="item of f31">
          <div>
            <p class="new-product">新品</p>
            <img :src="require(`../../assets/image/index/${item.pic}`)">
            <p class="title">{{item.title}}</p>  
            <p class="subtitle">{{item.subtitle}}</p>  
            <p class="price">{{item.price}}<s>{{item.subprice}}</s></p>
          </div>
        </router-link> 
      </div>
    </div>
    <!--手机--> 
    <div class="phone">
      <phone-child :phone1="phone1" :phone2="phone2"></phone-child>
    </div>
    <div class="laptop">
      <laptop-child :laptop1="laptop1" :laptop2="laptop2"></laptop-child>
    </div>
    <div>
      <parts-child :parts1="parts1" :parts2="parts2"></parts-child>
    </div>
    <div class="footer">
      <foot></foot>      
    </div>
  </div>
</template>
<script>
import phoneChild from './phoneChild.vue'
import laptopChild from './laptopChild.vue'
import partsChild from './partsChild.vue'
import swipeSlide from './swipeSlide.vue'
import footer from './footer.vue'
export default {
  data() {
    return {
      left:0,
      urls:[
        {imgUrl:"banner1.jpg"},
        {imgUrl:"banner2.jpg"},
        {imgUrl:"banner3.jpg"},
        {imgUrl:"banner4.jpg"},
      ],
      products:[],
      f1:[],
      f2:[],
      f3:[
        {pid:0,pic:""},
        {pid:0,pic:""},
        {pid:0,pic:""},
        {pid:0,pic:""},
        {pid:0,pic:""},
        {pid:0,pic:""},
        {pid:0,pic:""}
      ],
      f31:[],
      phone1:[],
      phone2:[],
      laptop1:[],
      laptop2:[],
      parts1:[],
      parts2:[]
    }
  },
  components:{
    "phone-child":phoneChild,
    "laptop-child":laptopChild,
    "parts-child":partsChild,
    "swipe-slide":swipeSlide,
    "foot":footer
  },
  methods: {

  },
  created(){
      this.axios.get("http://localhost:3000/index").then((result)=>{
      this.products=result.data;
      this.f1=this.products.slice(0,5);
      this.f2=this.products.slice(5,12);
      this.f3=this.products.slice(12,19);
      this.f31=this.products.slice(20,23);
      this.phone1=this.products.slice(28,32);
      this.phone2=this.products.slice(32,37);
      this.laptop1=this.products.slice(38,42);
      this.laptop2=this.products.slice(42,47);
      this.parts1=this.products.slice(47,51);
      this.parts2=this.products.slice(51,56)
    });
  }
}
</script>
<style scoped>
  .container{
    padding:0.01rem 0.3rem;
    background-color:#fff;
  }
  .header{
    width:100%;
    display:flex;
    position:fixed;
    align-items:center;
    justify-content:flex-start;
    padding:0.2rem 0 !important;
    background-color:#fff;
    z-index:10;
  }
  .header .logo{
    width:3.5rem;
    height:0.85rem;
    margin-right:0.5rem;    
  }
  .header .search{
    width:13rem;
    height:2rem;
    display:flex;
    align-items:center;
    background-color:#f0f0f0;
    border-radius:0.3rem;
    margin-right:0.5rem; 
    color:#B3B3B3;   
    font-size:0.85rem;   
  }
  .header .search>img{
    width:1.5rem;
    height:1.5rem;
  }
  .header>div:last-child{
    display:flex;
    align-items:center;
    justify-content:space-around;
    width:5.2rem;
  }
  .header>div:last-child img{
    width:1.25rem;
    height:1.25rem;
  }
  .header div:last-child a:last-child{
    color:#333;
    font-size:0.9rem !important;
  }
  .tabbar{
    height:0rem !important;
  }
  /*轮播*/

  .mint-swipe{
    width:22.8rem;
    height:10rem;
    margin-top:2.5rem;
    border-radius:5px;   
  }
  .mint-swipe img{
    width:100%;
    height:100%;
  }
  .mint-swipe-item:first-child{
   
  }
  /*f1*/ 
  .f1{
    display:flex;
    justify-content:space-between;
    margin-top:0.6rem;
  }
  .f1>div p{
    font-size:0.6em;
  }
  .f1>div img{
    width:3.2rem;
    height:3.2rem;
  }
  /*f2*/ 

  /*list --产品列表*/ 
  .list1{
    display:flex;
    justify-content:space-between;
    margin-top:0.8rem;
  }
  .list1-left,.list1-left>div,.list1-right{
    display:flex;
    flex-direction:column;  
    flex:1; 
  }
  .list1-left{
    padding-right:0.15rem;
  }
  .list1-right{
    padding-left:0.15rem;
  }
  .list1-left>div:first-child a{
    display:block;
    height:98.1%;
  }
  .list1-left>div:first-child a img{
    height:100%;
  }
  /*所有图片宽度一致*/ 
  .list1 a>img{
    width:100%;
  }
  .list-footer{
    display:flex;
    
  }
  .list-footer a{
    background-color:#F9F9F9 !important;     
  }
  .list-footer div{
    display:flex;
    flex-direction:column;
    align-items:center;
    padding:0 0.3rem 0.5rem;  
  }
  .list-footer a+a{
    margin-left:0.3rem;
  }
  .list-footer div>img{
    width:55%;
  }
  /*特惠，爆款,新品*/ 
  p.preferential,.explosive,.new-product{
    width:3rem;
    height:1rem;
    line-height:1rem;
    text-align:center;
    font-size:0.5rem;
    color:#fff;
  }
  .preferential{
    background-color:#22975F;
  }
  .explosive{
    background-color:#FF6A6E;
  }
  .new-product{
    background-color:#68BEFF;
  }
  /*标题、价格*/ 
  .list-footer .title{
    color:#555;
    font-size:0.8rem;
    margin-top:0.5rem;
    margin-bottom:0.2rem;
  } 
  .list-footer .subtitle{
    margin-bottom:0.2rem;
  }
  .list-footer .price{
    color:#CA141D;
    font-size:0.9rem;
    margin-bottom:0;
  }
  .list-footer .price>s{
    color:#666;
  }
</style>