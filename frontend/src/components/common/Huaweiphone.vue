<template>
  <div class="container">
    <div class="listdiv">
      <p class="series">HUAWEI P系列</p>
      <ul class="list">
        <li>
          <img  src="../../assets/image/index/428_428_1551094056841mp.png">
          <p class="title">HUAWEI P30</p>
        </li>
      </ul>
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
  .container{
    width:100%;
    text-align:center;
  }
  .list{
    display:flex;
    flex-wrap:wrap;
  }
  .list>li{
    width:26.2%;
    margin:0 3%;
  }
  
  img{
    width:90%;
  }
  .title{
    font-size:0.3rem;
    color:#666;
  }
</style>