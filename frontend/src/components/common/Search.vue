<template>
  <div class="container">
    <div>
      <div class="search">
        <i class="iconfont icon-jiantou"></i>
        <input placeholder="nova 5 Pro"></input>
        <span>搜索</span>
      </div>
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
    background-color:#fff;
  }
  .search{
    padding-top:0.2rem;
    height:2.5rem;
    display:flex;
    justify-content:space-around;
    align-items:center;
  }
  .search input{
    width:60%;
    height:2rem;    
    background-color:#666;
  }
</style>