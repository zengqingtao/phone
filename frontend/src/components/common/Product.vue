<template>
  <div class="container">
    <div class="headerbox">
      <div class="header" >
      <div class="search">
        <router-link to="/search">
          <div>
            <img src="../../assets/image/product/sousuo.png" alt="">
            <span>HUAWEI P30</span>
          </div>
        </router-link>
      </div>
      <div class="message">
        <router-link to="/message">
          <img src="../../assets/image/product/duanxin.png" alt="">
        </router-link>
      </div>
    </div>
  </div>
    <div class="listdiv">
      <ul class="list">
        <li v-for="(item,i) in list" :key="i" >
          <div @click="setactive(i)" :class="[ind==i?'active':'']">{{item}}</div>
        </li>
      </ul>
    </div>
    <div class="tab">
      <mt-tab-container v-model="active">
        <mt-tab-container-item id="tab0">
          
        </mt-tab-container-item>
        <mt-tab-container-item id="tab1">
          <div class="tabitem">
            <p class="series">HUAWEI P系列</p>
            <ul class="ulitem">
              <li v-for="item of h1">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
        <!---->
          <div class="tabitem">
            <p class="series">HUAWEI Mate系列</p>
            <ul class="ulitem">
              <li v-for="item of h2">
                <img :src="require(`../../assets/image/product/${item.pic}`)">                
                <p class="title">{{item.title}}</p>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">HUAWEI nova系列</p>
            <ul class="ulitem">
              <li v-for="item of h3">
                <img :src="require(`../../assets/image/product/${item.pic}`)">
                <p class="title">{{item.title}}</p>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">华为畅享系列</p>
            <ul class="ulitem">
              <li v-for="item of h4">
                <img :src="require(`../../assets/image/product/${item.pic}`)">
                <p class="title">{{item.title}}</p>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem" >
            <p class="series">HUAWEI 麦芒系列</p>
            <ul class="ulitem">
              <li v-for="item of h5">
                <img :src="require(`../../assets/image/product/${item.pic}`)">                
                <p class="title">{{item.title}}</p>
              </li>
            </ul>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="tab2">
        </mt-tab-container-item>
        <mt-tab-container-item id="tab3">
        </mt-tab-container-item>
        <mt-tab-container-item id="tab4">
        </mt-tab-container-item>
        <mt-tab-container-item id="tab5">
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active:"tab0",
      list:["为您推荐","华为手机","荣耀手机","笔记本&平板","智能穿戴","智能家居","专属配件","通用配件","生态产品","增值服务","智能计算"],
      ind:0,
      products:[
        {pid:"",title:"",pic:0,pid:""},
        {pid:"",title:"",pic:0,pid:""},
        {pid:"",title:"",pic:0,pid:""},
      ],
      h1:[],
      h2:[],
      h3:[],
      h4:[],
      h5:[],
    }
  },
  created(){
    //在create阶段结束后，自动调用
    this.axios.get("http://localhost:3000/product").then((result)=>{
      this.products=result.data;
      console.log(this.products);
      this.h1=this.products.slice(0,4);
      this.h2=this.products.slice(4,8);
      this.h3=this.products.slice(8,12);
      this.h4=this.products.slice(12,18);
      this.h5=this.products.slice(18,19);
    });

  },
  methods: {
    setactive(i){
      this.ind=i;
      this.active="tab"+i;
    }
  },
}

</script>
<style >
  .container{
    background-color:#fff;
    position:relative;
  }
  /*头部搜索*/ 
  .header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0.3rem  0.8rem 0 0.8rem;
  }
  .header>.search{
    width:88%;
    height:2.2rem;
    border-radius:0.3rem;
    background-color:#F5F5F5;
    display:flex;
    align-items:center;
  }
  .header>.search div{
    display:flex;
    align-items:center;
  }
  .header>.search div>img{  
    margin:0 0.5rem;
  }
  .header>.message img{
    width:1.5rem;
    height:1.5rem;
  }
  .active{
    color:#e01d20 !important;
    border-right:2px solid #e01d20;
  }
  .listdiv{
    position:fixed;
  }
  .list{
    width:27.22%;
    display:flex;
    flex-wrap:wrap;
    text-align:left;
    float:left;
    min-height:91.5%;
    padding:0;
    margin:0;
    padding-bottom:2.45rem;
  }
  .list>li{
    width:100%;
    height:50px;
    padding:0.8rem 0 0.8rem 0.8rem;
    font-size:0.85rem;
    font-weight:normal;
    color:#333;
  }
  
  .tab{
    float:right;
    width:72.78%;
    height:100%;
  }
  /*.mint-cell-wrapper{
    padding:0 !important;
  }*/
  .tabitem{
    padding-top:1.5rem;
  }
  .ulitem{
    display:flex;
    flex-wrap:wrap;
    text-align:center;
  }
  .ulitem li{
    width:26.2%;
    margin:0 0.2rem 0 1rem;
  }
  
  .ulitem img{
    width:69%;
    height:47%
  }
  .ulitem .title{
    font-size:0.3rem;
    color:#666;
  }
 .series{
   text-align:center;
   color:#000;
 }
</style>