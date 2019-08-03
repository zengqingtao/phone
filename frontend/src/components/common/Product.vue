<template>
  <div class="container">
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
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">HUAWEI nova系列</p>
            <ul class="ulitem">
              <li v-for="item of h3">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">华为畅享系列</p>
            <ul class="ulitem">
              <li v-for="item of h4">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem" >
            <p class="series">HUAWEI 麦芒系列</p>
            <ul class="ulitem">
              <li v-for="item of h5">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="tab2">
          <div class="tabitem">
            <p class="series">荣耀系列</p>
            <ul class="ulitem">
              <li v-for="item of r1">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">荣耀畅玩系列</p>
            <ul class="ulitem">
              <li v-for="item of r2">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">移动4G+专区</p>
            <ul class="ulitem">
              <li v-for="item of r3">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
        </mt-tab-container-item>
        <mt-tab-container-item id="tab3">
          <div class="tabitem">
            <p class="series">笔记本电脑</p>
            <ul class="ulitem">
              <li v-for="item of laptop1">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">平板电脑</p>
            <ul class="ulitem">
              <li v-for="item of laptop2">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">笔记本配件</p>
            <ul class="ulitem">
              <li v-for="item of laptop3">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
        </mt-tab-container-item>
        <mt-tab-container-item id="tab4">
          <div class="tabitem">
            <p class="series">手环</p>
            <ul class="ulitem">
              <li v-for="item of watch1">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">手表</p>
            <ul class="ulitem">
              <li v-for="item of watch2">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
          <div class="tabitem">
            <p class="series">VR</p>
            <ul class="ulitem">
              <li v-for="item of watch3">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
        </mt-tab-container-item>
        <mt-tab-container-item id="tab5">
           <div class="tabitem">
            <p class="series">智能家居分类</p>
            <ul class="ulitem">
              <li v-for="item of home1">
                <router-link :to="`/details/${item.pid}`">
                  <img :src="require(`../../assets/image/product/${item.pic}`)">                
                  <p class="title">{{item.title}}</p>
                </router-link>
              </li>
            </ul>
          </div>
          <!---->
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active:"tab1",
      list:["为您推荐","华为手机","荣耀手机","笔记本&平板","智能穿戴","智能家居","专属配件","通用配件","生态产品","增值服务","智能计算"],
      ind:1,
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
      r1:[],
      r2:[],
      r3:[],
      laptop1:[],
      laptop2:[],
      laptop3:[],
      watch1:[],
      watch2:[],
      watch3:[],
      home1:[],
    }
  },
  created(){
    //在create阶段结束后，自动调用
    this.axios.get("http://localhost:3000/product").then((result)=>{
      this.products=result.data;
      // console.log(this.products);
      this.h1=this.products.slice(0,4);
      this.h2=this.products.slice(4,8);
      this.h3=this.products.slice(8,12);
      this.h4=this.products.slice(12,18);
      this.h5=this.products.slice(18,20);
      this.r1=this.products.slice(20,31);
      this.r2=this.products.slice(31,34);
      this.r3=this.products.slice(34,37);
      this.laptop1=this.products.slice(37,46);
      this.laptop2=this.products.slice(46,58);
      this.laptop3=this.products.slice(58,59);
      this.watch1=this.products.slice(59,68);
      this.watch2=this.products.slice(68,78);
      this.watch3=this.products.slice(78,79);
      this.home1=this.products.slice(79,83);
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
<style scoped>
  .container{
    background-color:#fff !important;
    position:relative;
  }
  .mint-tab-container-item{
    background-color:#fff !important;
  }
  /*头部搜索*/ 
  .header{
    width:100%;  
    height:2.5rem;
    display:flex;
    justify-content:space-between;
    align-items:center;
    text-align:center;
    padding:0.3rem  0.8rem 0 0.8rem;
    position:fixed;
    z-index:10;
    background-color:#fff;
  }
  .header>.search{
    width:88%;
    height:2.1rem;
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
    width:1.5rem;  
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
    height:100%;
    position:fixed;
    margin-top:2.5rem;
    background-color:#fff;
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
    padding-bottom:7rem;
  }
  .list>li{
    width:100%;
    padding:0.8rem 0 0.8rem 0.8rem;
    font-size:0.85rem;
    font-weight:normal;
    color:#333;
  }
  
  .tab{
    float:right;
    width:72.78%;
    height:100%;
    padding-top:1.2rem;
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
    width:4rem;
    height:6.6rem;
    margin:0 0.2rem 0 1rem;
  }
  
  .ulitem img{
    width:3.1rem;
    height:3.2rem;
  }
  .ulitem .title{
    font-size:0.2rem;
    font-weight:normal;
    color:#666;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    /**设置多少行后溢出就隐藏 */
    -webkit-line-clamp: 2;
    overflow: hidden;
  }
 .series{
   text-align:center;
   color:#000;
 }
</style>