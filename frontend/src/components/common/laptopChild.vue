<template>
  <div class="parent">
    <h3>笔记本</h3>
    <div class="four">
      <div class="four-item" v-for="item of laptop1">
        <router-link :to="`/details/${item.pid}`">
          <img :src="require(`../../assets/image/index/${item.pic}`)">
          <p class="subtitle">{{item.subtitle}}</p>
          <p class="title">{{item.title}}</p>
          <p class="price">￥{{item.price}}<s>￥{{item.subprice}}</s></p>
          <!--<p class="topTitle">爆款</p>-->
        </router-link>
      </div>
    </div>
    <div class="swipe" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
      <div class="swipe-item" v-for="item of laptop2">
        <router-link :to="`/details/${item.pid}`">
          <img :src="require(`../../assets/image/index/${item.pic}`)">
          <p class="subtitle">{{item.subtitle}}</p>
          <p class="title">{{item.title}}</p>
          <p class="price">￥{{item.price}}<s>￥{{item.subprice}}</s></p>
          <p class="topTitle">爆款</p>
        </router-link>
      </div>
    </div>
    <div class="loadMore">
      <span>发现更多笔记本</span>
      <img src="../../assets/image/index/jiantou.jpg">
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      movestart:0,
      moveing:0,
      moveend:0
    }
  },
  props:["laptop1","laptop2"],
  methods: {
   touchstart(e){
      // 获取触摸时的坐标
      this.movestart=e.targetTouches[0].clientX;
      // 获取事件对象
      var box=document.getElementsByClassName("swipe")[1];
    },
    touchmove(e){
      var box=document.getElementsByClassName("swipe")[1];
      this.moveing=e.targetTouches[0].clientX;
      // 开始坐标与移动坐标的差值,利用差值减去原来基础上的外边距
      this.left=this.movestart-this.moveing-this.moveend;
      box.style.marginLeft=-this.left+"px";      
    },
    touchend(){
      var box=document.getElementsByClassName("swipe")[1];  
        // 最大左边距=box的宽度-设备宽度
      var maxLeft=box.offsetWidth-document.body.clientWidth+50;
      if(this.left<0){
        this.left=0;              
      }else if(this.left>maxLeft){
        this.left=maxLeft;
      }
      box.style.marginLeft=-this.left+"px";       
      this.moveend=box.style.marginLeft.replace(/px/,"")
    }
  },  
}
</script>
<style scoped>
  .parent{
    text-align:center;
  }
  h3{
    color:#333;
    margin-top:1.5rem;
  }
  .four{
    display:flex;
    justify-content:space-between;
    flex-wrap:wrap;
    margin-top:1rem;
  }
  .four-item{
    width:49%;
    position:relative;
  }
  .four-item img{
    width:100%;
    padding:15%; 
    border-radius:0.8rem;
    overflow:hidden;
    background-color:#F9F9F9;
  }
  .subtitle{
    height:1.5rem;
    font-size:0.6rem;
    display:flex;
    align-items:center;
    justify-content:center;
    color:#999;
    background-color:#F0F0F0;
    position:relative;
    border-radius:0 0 0.8rem 0.8rem;
    margin-top:-1.8rem;
    margin-bottom:0;
  }
  .title{
    text-align:center;
    color:#333;
    margin:0;
    margin-top:0.3rem;
    font-size:0.8rem;
  }
  .price{
    text-align:center;
    color:#CA141D;
    font-size:0.8rem;
  }
  .price>s{
    color:#b0b0b0;
  }
  .topTitle{
    width:20%;
    height:1rem;
    font-size:0.5rem;
    color:#fff;
    display:flex;
    align-items:center;
    justify-content:center;
    position:absolute;
    top:0;
    left:50%;
    transform:translate(-50%);
    background-color:#FF6A6E;
  }
  /*左右滑动*/ 
  .swipe{
    width:43rem;
    display:flex;
    justify-content:flex-start;
    overflow:hidden;
    margin-top:0.3rem;
  }
  .swipe-item{
    margin-right:0.3rem;
    text-align:center;
    position:relative;
  }
  .swipe .topTitle{
    width:35%;
    font-size:0.5rem;
  }
  .swipe-item .subtitle{
    height:1.2rem;
    color:#666;   
    background-color:rgba(0,0,0,0.1); 
    margin-top:-1.5rem;    
  }
  .swipe-item img{
    width:8rem;
    padding:1.1rem;
    background-color:#f5f5f5;
    border-radius:0.8rem;
    overflow:hidden;
  }
  /*加载更多*/ 
  .loadMore{
    display:flex;
    justify-content:center;
    align-items:center;
    color:#333;
    font-size:0.9rem;
    padding:1rem;
  }
  .loadMore img{
    width:0.9rem;
  }
</style>