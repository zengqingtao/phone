<template>
  <div class="container">
    <div class="head">
      <div class="arrow-menu">
        <div class="arrow">
          <router-link to="">
            <img src="../assets/image/details/icon_back_grey.png">
          </router-link>
        </div>
        <div class="menu-btn" @click="menubtn">
          <img src="../assets/image/details/icon_more_grey.png">
        </div>
      </div>
      <div class="menu-list" v-show="ismenu">
        <router-link to="/">
          <div>
            <img src="../assets/image/details/icon-home-black.png">
            <span>首页</span>
          </div>
        </router-link>
        <router-link :to="`/search`">
          <div>
            <img src="../assets/image/details/icon_search_black.png">
            <span>搜索</span>
          </div>
        </router-link>
        <router-link :to="`/home/product`">
          <div>
            <img src="../assets/image/details/icon_menu_category_black.png">
            <span>分类</span>
          </div>
        </router-link>
        <router-link :to="`/home/cart`">
          <div>
            <img src="../assets/image/details/icon-cart-black.png">
            <span>购物车</span>
          </div>
        </router-link>
        <router-link :to=" `/home/me`">
          <div>
            <img src="../assets/image/details/icon_person_black.png">
            <span>我的</span>
          </div>
        </router-link>
        <router-link to="/share">
          <div>
            <img src="../assets/image/details/icon_share_1.png">
            <span>分享</span>
          </div>
        </router-link>
      </div>
      <!--轮播广告--> 
      <div class="carousel">
        <mt-swipe>
          <mt-swipe-item v-for="(item,i) of pics" :key="i">
            <img :src="require(`../assets/image/details/${item.pic}`)">
          </mt-swipe-item>
        </mt-swipe>
      </div>
      <div>
        <p class="price">￥{{product.price}}</p>
        <div class="title">{{product.title}} ({{product.color}})</div>
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
          <router-link class="colorlink" v-for="(item,i) of specColors" :key="i"  to="">
              <div>{{item.color}}</div>
          </router-link>
        </div>
      </div>
      <!--版本-->
      <div class="spec">
        <div class="left">版本</div>
        <div class="right">
          <router-link class="speclink" v-for="(item,i) of specColors" :key="i"   :class="{
              active:item.pid==pid}" :to="`/details/${item.pid}`">{{item.spec}}
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
          <i class="iconfont icon-jianhao" :style="{color:reduceColor}" @click="reduceCount"></i>
          <span>{{count}}</span>
          <i class="iconfont icon-jiahao" :style="{color:addColor}" @click="addCount"></i>
        </div>
      </div>
    </div>
    <mt-tabbar class="tabbar" fixed>
      <router-link :to="`/home/index`">
        <div class="tabitem1">
          <img src="../assets/image/details/icon-home-black.png">
          <div class="tabtxt">首页</div>
        </div>
      </router-link>
      <router-link  to="">
        <div class="tabitem1">
          <img src="../assets/image/details/icon-service-black.png">     
          <div class="tabtxt">客服</div>
        </div>
      </router-link>
      <router-link  :to="`/home/cart`">
        <div class="tabitem1">
          <img src="../assets/image/details/icon-cart-black.png">       
          <div class="tabtxt">购物车</div>
          <div class="cartCount" v-if="cartCount>0">{{cartCount}}</div>
        </div>
      </router-link>
      <router-link  to="">
        <div class="tabitem2">
          <div class="toCart" @click="addToCart()">加入购物车</div>
        </div>
      </router-link>
      <router-link  to="">
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
        reduceColor:"#D7D7D7",
        addColor:"#333",
        count:1,
        cartCount:0,
        product:{title:"",price:0},
        specColors:[],
        pics:[],
        selected:"",
        ismenu:false,
      }
    },
    props:["pid"],
    created(){
      this.load();
    },
    methods:{
      // 商品数量的加减
      reduceCount(){
        if(this.count>2&&this.count<7){
          this.count--;
          this.reduceColor="#595959";
          this.addColor="#595959"
        }else if(this.count==2){
          this.count--;
          this.reduceColor="#D7D7D7";          
        }
      },
      addCount(){
        if(this.count<5){
          this.count++;
          this.reduceColor="#595959"
        }else if(this.count==5){
          this.count++;
          this.addColor="#D7D7D7"
        }
      },
      load(){
        this.axios.get("http://localhost:3000/details",{
        params:{
          pid:this.pid,
        }
      }).then(result=>{
        var {product,specColors,pics}=result.data;
        this.product=product;
        this.specColors=specColors;
        this.pics=pics;
        console.log(product);
        console.log(111);
        console.log(pics);
      })
      },
      menubtn(){
        if(this.ismenu){
          this.ismenu=false;
        }else{this.ismenu=true}
      },
      //加入购物车
      addToCart(){
        if(typeof(window.sessionStorage.data) != "undefined"){
          if((this.cartCount+this.count)>6){
            this.$toast("数量超限")
          }else{
            if(window.sessionStorage.data =="undefined"){
              this.$toast("请您先登录");
            }else{
              this.axios.get("http://localhost:3000/toCart",{
              params:{
                uid:window.sessionStorage.data,
                pid:this.product.pid,
                img:this.pics[0].pic,
                price:this.product.price,
                title:this.product.title,
                count:this.count
                }
              }).then(result=>{          
                this.$toast(result.data.msg);
              })
              this.cartCount +=this.count;
            }
          }
        }else{
          this.$toast("请先登录");
        }
      }
    },
    watch:{
      // 监控pid的值，如果pid发生变化，就会触发该方法
      pid(){
        this.load();
      }
    }
}
</script>
<style scoped>
  body{   
    background-color:#F9F9F9 !important;    
  }
  /*顶部的箭头与列表*/ 
  .arrow,.menu-btn{
    position:absolute;
    top:0.5rem;
    z-index:10;
  }
  .arrow{
    left:1rem;
  }
  .arrow-menu img{
    width:1.6rem;
  }
  .menu-btn{
    right:1rem;
  }
  .menu-list{
    width:6rem;
    position:absolute;
    right:0.5rem;
    top:2.3rem;
    z-index:10;
    text-align:center;  
    padding:0 !important; 
    border: 0.01rem solid #ECECEC;
    background-color:#fff;
  }
  .menu-list div{
    height:2.5rem;
    display:flex;
    align-items:center;
    font-size:0.9rem;
    color:#545454;
    padding:0.25rem 0 0.25rem 0.5rem; 
    border-bottom:0.01rem solid #ECECEC;
  }
  .menu-list div>img{
    width:1.2rem;
    height:1.2rem;
    margin-right:0.2rem;
  }
  /*设置页面中灰色横条样式*/ 
  .head>div:not(.carousel),.middle{
    padding:0 1rem 0.5rem 1rem;
  }
  .head,.middle{
    background-color:#fff;
  }
  .middle{
    margin-top:1rem;
    padding-top:0.5rem;
  }
  .carousel{
    height:21rem;
    padding:0 0.5rem 0.5rem 0.5rem;
    text-align:center;
  }
  .carousel img{
    width:86%;
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
  .promotion .right,.spec>.right,.type>.right,.num>.right{
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
  .color{
    justify-content:flex-start;
  }
  .color>.left{
    margin-top:0.2rem;
  }
  .color>.right{
    padding-left:1.2rem;
  }
  .color>.right,.spec>.right,.num>.right{
    display:flex;
    flex-wrap:wrap;
  }
  .color>.right>.colorlink{
    width:3.8rem;
    color:#666;
    border:1px solid #DCDCDC;
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
    color:#666;
    border:1px solid #DCDCDC;
    border-radius:0.5rem;
    margin-right:0.2rem;
    margin-top:0.2rem;
  }
  .speclink.active,.colorlink.active{
      color:#ca141d;
      border-color:#ca141d !important;
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
 .num>.right>.iconfont{
   font-size:1.7rem;
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
  position:relative;
}
.tabitem1 img{
  width:1.3rem;  
}
/**购物车数量*/ 
.tabitem1 .cartCount{
  width:1rem;
  height:1rem;
  color:#fff;
  display:flex;
  align-items:center;
  justify-content:center;  
  background-color:#CA141D;
  border-radius:50%;
  position:absolute;
  top:0;
  right:0.1rem;
}
.tabitem2{
  width:5.3rem;
  height:2.2rem;
  font-size:0.9rem;
  color:#fff;
  display:flex;
  align-items:center;
  justify-content:center;
  background:linear-gradient(90deg,#F65E39,#D32322);
  border-radius:1rem;
  
}
</style>