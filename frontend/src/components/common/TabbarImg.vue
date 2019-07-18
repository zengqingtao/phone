<template>
  <div>
    <img :src="bool?selectedImg:normalImg" alt="">
  </div>
</template>
<script>
export default {
  data() {
    return {
      
    }
  },
  props:{
    bool:"",
    selectedImg:"",
    normalImg:""
  },
}
</script>
<style>
  img{
    width:1.5rem;
    height:1.5rem;
  }
</style>