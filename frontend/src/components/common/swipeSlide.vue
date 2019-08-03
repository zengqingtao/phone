<template>
  <div class="swipe-slide" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
      <div class="swipe-item" v-for="item of f2">
        <router-link :to="`/details/${item.pid}`">
          <img :src="require(`../../assets/image/index/${item.pic}`)">
          <p class="subtitle">{{item.title}}</p>
          <p class="title">{{item.subtitle}}</p>
        </router-link>
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
  props:["f2"],
  methods: {
    touchstart(e){
      // 获取触摸时的坐标
      this.movestart=e.targetTouches[0].clientX;
      // 获取事件对象
      var box=document.getElementsByClassName("swipe-slide")[0];
    },
    touchmove(e){
      var box=document.getElementsByClassName("swipe-slide")[0];
      this.moveing=e.targetTouches[0].clientX;
      // 开始坐标与移动坐标的差值,利用差值减去原来基础上的外边距
      this.left=this.movestart-this.moveing-this.moveend;
      box.style.marginLeft=-this.left+"px";      
    },
    touchend(){
      var box=document.getElementsByClassName("swipe-slide")[0];  
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
  .swipe-slide{
    width:37rem;
    display:flex;
    overflow:hidden;
    background-color:#fafafa;
    margin-top:0.3rem;
    padding-top:1rem;
  }
  .swipe-item{
    margin-right:0.2rem;
    text-align:center;
  }
  .swipe-item img{
    width:5rem;
    padding:0.5rem 0.9rem 1rem;
    background-color:#fff;
    border-radius:0.8rem;
    overflow:hidden;
  }
  .subtitle{
    font-size:0.6rem;
    height:1.2rem;
    color:#666;   
    display:flex;
    align-items:center;
    justify-content:center;
    margin-bottom:0;
    margin-top:-1.5rem;  
    /*文本溢出隐藏*/ 
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap
  }
  .title{
    text-align:center;
    color:#CE262E;
    margin:0;
    font-size:0.5rem;
  } 
</style>