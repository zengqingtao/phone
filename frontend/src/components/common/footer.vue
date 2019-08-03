<template>
  <div class="container">
    <div class="login">
      <router-link :to="`/login`">登录</router-link>
      <router-link to="">反馈</router-link>
    </div>
    <div class="spces">
      <div>
        <img src="../../assets/image/index/bangzhushouji.png">
        <p>客户端</p> 
      </div>
      <div>
        <img src="../../assets/image/index/shouzhi.png">
        <p>触屏版</p> 
      </div>
      <div>
        <img src="../../assets/image/index/diannaoban.png">
        <p>电脑版</p> 
      </div>
    </div>
    <div class="footer-text">
      隐私政策用户协议关于Cookie
Copyright 2012-2019 VMALL.COM 版权所有
营业执照 备案主体编号：44201919072182
粤ICP备19015064号-4粤公网安备 44190002003939号
增值电信业务经营许可证：粤B2-20190762
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      
    }
  },
}
</script>
<style scoped>
  .login{
    display:flex;
    justify-content:center;
    border-bottom:0.01rem solid #f5f5f5;
  }
  .login a{
    color:#333 !important;
    padding:0.5rem 1.5rem;
  }
  .spces{
    display:flex;
    justify-content:center;
  }
  .spces>div{
    width:20%;
    padding-top:1rem;
    text-align:center
  }
  .spces img{
    width:40%;
  }
  .footer-text{
    text-align:center;
    color:#b0b0b0;
    font-size:0.8rem;
  }
</style>