<template>
  <div class="container">
    <div v-show="isLogin">
      <div class="header" v-show="!isNull">
        <span>购物车</span>
        <span @click="editor">
          <span v-show="!isEditor">编辑</span>
          <span v-show="isEditor">完成</span>
        </span>
      </div>
      <!--购物车为空时显示，否则隐藏-->
      <div v-show="isNull" class="cart-empty">
      <div class="headerCart">购物车</div>
      <div class="cartEmpty">
        <div>
          <i class="iconfont icon-shopshoppingco"></i>
          <span>亲,购物车是空的哦，赶紧去逛逛吧！</span>
        </div>
        <div class="toShopping" ><router-link :to="`/home/index`">去逛逛</router-link></div>
      </div>
      <div class="productTitle">
        <h4 >热销推荐</h4>
        <div class="products">
          <div v-for="(item,index) of phone" :key="index">
            <router-link :to="`/details/${item.pid}`">
              <img :src="require(`../../assets/image/index/${item.pic}`)">
              <p>{{item.title}}</p>
              <p>￥{{item.price}}</p>
            </router-link>
          </div>
        </div>
      </div>
   </div>
      <!--商品列表-->
      <div class="myproduct" v-for="(item,index) of list" :key="index">
        <div @click="operateSingle(index)" v-model="item.isSelected">
          <i class="iconfont icon-unchecked" v-show="!item.isSelected" ></i>
          <i class="iconfont icon-checked" v-show="item.isSelected"></i>
        </div>
        <img :src="require(`../../assets/image/details/${item.img}`)">
        <div>
          <div class="title">
            {{item.title}}
          </div>
          <div class="price-count">
            <span class="price">￥{{item.price}}</span>
            <div>
              <i class="iconfont icon-jianhao" :style="{color:`${item.reduceColor}`}" @click="reduceCount(index)"></i>
              <span>{{item.count}}</span>
              <i class="iconfont icon-jiahao" :style="{color:`${item.addColor}`}" @click="addCount(index)"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="allSelect-total" v-show="!isNull">
        <div class="allSelect" @click="allSelect">
          <i class="iconfont icon-unchecked" v-show="!isAllSelected"></i>
          <i class="iconfont icon-checked" v-show="isAllSelected"></i>
          <span>全选</span>
        </div>
        <div class="total">
          <span v-show="!isEditor">总计：</span>
          <span v-show="!isEditor">￥{{totalPrice}}</span>
          <span>
            <span v-show="!isEditor">结算({{totalCount}})</span>
            <span v-show="isEditor" @click="delItem">删除</span>
          </span>
        </div>
      </div>
      <div>
    </div>
   </div>
  <!--没有商品--> 
   <div v-show="!isLogin" class="cart-empty">
      <div class="headerCart">购物车</div>
      <div class="cartEmpty">
        <div>
          <!--<i class="iconfont icon-shopshoppingco"></i>-->
          <span>亲,您还未登录哦，赶紧去登录吧！</span>
        </div>
        <!--<div class="toShopping" ><router-link :to="`/home/index`">去逛逛</router-link></div>-->
        <div class="toShopping" ><router-link :to="`/login`">去登录</router-link></div>
      </div>
      <div class="productTitle">
        <h4 >热销推荐</h4>
        <div class="products">
          <div v-for="(item,index) of phone" :key="index">
            <router-link :to="`/details/${item.pid}`">
              <img :src="require(`../../assets/image/index/${item.pic}`)">
              <p>{{item.title}}</p>
              <p class="price">￥{{item.price}}</p>
            </router-link>
          </div>
        </div>
      </div>
   </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isEditor:false,     
      isAllSelected:false,
      isLogin:false,
      isNull:false,
      list:[],
      phone:[],
      totalCount:0,
      totalPrice:0
    }
  },
  methods: {
      // 操作购物车每一个商品的复选框，要执行的方法
    operateSingle(ind){
      // 遍历购物车的每一个商品，做一个逻辑与运算，将最终结果赋值给this.isAllSelected
      if(this.list[ind].isSelected){
        this.list[ind].isSelected = false;
      }else{
        this.list[ind].isSelected = true;
      };
      var result = true;
      for(var i=0;i<this.list.length;i++){
        result = result&&this.list[i].isSelected;
      }
      this.isAllSelected = result;
      this.calcAll();
    },
    allSelect(){
       if(this.isAllSelected){
        this.isAllSelected = false;
      }else{
        this.isAllSelected = true;
      };
      for(var i=0;i<this.list.length;i++){
        this.list[i].isSelected = this.isAllSelected;
      }
      this.calcAll();
    },
    // 计算被选中商品的总价格
  calcAll(){
    this.totalCount = 0;
    this.totalPrice = 0;
    for(var i=0;i<this.list.length;i++){
      if(this.list[i].isSelected){
        this.totalCount += this.list[i].count;
        this.totalPrice += this.list[i].price*this.list[i].count
      }
    }
  },
  // 商品数量的加减
  reduceCount(i){
    if(this.list[i].count>2&&this.list[i].count<100){
      this.list[i].count--;
      this.list[i].reduceColor="#595959";
      this.list[i].addColor="#595959"
    }else if(this.list[i].count==2){
      this.list[i].count--;
      this.list[i].reduceColor="#D7D7D7";          
    }
  },
  addCount(i){
    if(this.list[i].count<100){
      this.list[i].count++;
      this.list[i].reduceColor="#595959"
    }else if(this.list[i].count==100){
      this.list[i].count++;
      this.list[i].addColor="#D7D7D7"
    }
  },
  editor(){
    if(this.isEditor){
      this.isEditor = false;
    }else{
      this.isEditor = true;
    }
    for(var i=0;i<this.list.length;i++){
      this.list[i].isSelected = false;
    }
    this.isAllSelected = false;
    this.calcAll();
  },
  // 确认框
  confirm(){
    this.$messagebox({
      title:"提示",
      message:"确定进行删除操作?",
      showConfirmButton:true,
      showCancelButton:true,
    }).then(action=>{
      if(action == "confirm"){
        var selectedList = [];
      for(var i=0;i<this.list.length;i++){
        if(this.list[i].isSelected){
          this.axios.get("http://localhost:3000/delCart",{
            params:{
              id:this.list[i].pid
            }
          }).then((result)=>{          
            console.log(222);
          })
        }else{
          selectedList.push(this.list[i]);
        }
      }
      this.list = selectedList;
      }else{
        return;
      }
    });
  },
  // 删除购物车的商品
  delItem(){
      this.confirm();
  },
  
  // 加载数据
  load(){
   if(typeof(window.sessionStorage.data) != "undefined"){
     this.isLogin = true;
      this.axios.get("http://localhost:3000/cart",{
      params:{
        uid:window.sessionStorage.data
      }
    }).then((result)=>{
      // console.log(result.data);
      this.list = result.data;
      // 判断数据是否为0，如果不为0，就显示商品，如果为0，就显示“去逛逛”
      if(this.list.length>0){
        this.isNull = false;
      }else{
        this.isNull = true;
      }
      // 遍历商品数组，给每个商品添加属性
      for(var i=0;i<this.list.length;i++){
        this.list.isSelected = false;
        this.list.reduceColor = "#D7D7D7";
        this.list.addColor = "#333";
        if(this.list[i].count == 1){
          this.list[i].reduceColor = "#D7D7D7";
        }
      }
    })
   }else{
     this.isLogin = false;
   }
  },
  // 加载购物车为空时的数据
  cartEmpty(){
    this.axios.get("http://localhost:3000/index").then((result)=>{
      this.phone=result.data.slice(32,37);
      var phone02 = result.data.slice(32,33);
      this.phone.push(phone02[0]);
    });
  }
  },
  created(){
    this.load();
    this.cartEmpty();
  },
  
}
</script>
<style scoped>
  body{position:relative;}  
  /*.container{
     height:50rem;
  }*/
  .header{
    height:2.8rem;
    background-color:#fff;
    display:flex;
    align-items:center;
    justify-content:center
  }
  .header>span:first-child{
    font-size:1.3rem;
  }
  .header>span:last-child{
    position:absolute;
    right:1rem;
    font-size:1rem;
    color:#666;
  }
  /*我的购物车商品*/ 
  .myproduct{
    height:7.5rem;
    margin:2% 2% 0 2%;
    background-color:#fff;
    border-radius:0.5rem;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 0.6rem;
  }
  .myproduct>div>.iconfont{
    color:#666;
    font-size:1.3rem;
  }
  .myproduct>div>.icon-checked{
    color:#CA141D;
  }
  .myproduct img{
    width:23%;
    padding:0 0.5rem;
  }
  .myproduct .title{
    height:4rem;
    color:#333;
    font-size:1rem;
  }
  .price-count{
    display:flex;
    justify-content:space-between;
  }
  .price{
    color:#CA141D;
    font-weight:bold;
  }
  .price-count>div{
    display:flex;
    align-items:center
  }
  .price-count>div>span{
    padding:0 0.5rem;
  }
  .price-count .iconfont{
    font-size:1.5rem;
    color:#333;
  }
  /**全选、总计和结算*/ 
  .allSelect-total{
    width:100%;
    height:4rem;
    padding:0 3%;
    background:#fff;
    position:fixed;
    bottom:3.2rem;
    display:flex;
    align-items:center;
    justify-content:space-between;
  }
  .allSelect{
    display:flex;
    align-items:center;
  }
  .allSelect>span{
    font-size:1rem;
    color:#666;
    padding-left:0.3rem;
  }
  .allSelect-total .iconfont{
    color:#666;
    font-size:1.3rem;
  }
  .allSelect-total .icon-checked{
    color:#CA141D;
  }
  .total{
    display:flex;
    align-items:center;
  }
  .total>span:first-child{
    color:#333;
  }
  .total>span:nth-child(2){
    color:#CA141D;
    font-weight:bold;
    padding-right:0.5rem;
  }
  .total>span:nth-child(3){
    width:6rem;
    height:2.5rem;
    color:#fff;
    display:flex;
    align-items:center;
    justify-content:center;
    background:linear-gradient(45deg,#E23C2C,#CB161E);
    border-radius:2rem;
  }
  /*购物车为空*/  
  .headerCart{
    width:100%;
    height:2.5rem;
    font-size:1.5rem;
    padding-top:0.5rem;
    text-align:center;
    background-color:#fff;
    position:fixed;
    z-index:10;
  }
  .cartEmpty{
    height:11rem;
    padding-top:3.5rem;
    text-align:center;
    background-color:#fff;    
  }
  .cartEmpty .iconfont{
    font-size:1.5rem;
    color:#666;
    padding-right:0.3rem;
  }
  .cartEmpty span{
    font-size:1rem;
    color:#666;
  }
  .toShopping{
    display:flex;
    justify-content:center;
    margin-top:2rem;
  }
  .toShopping a{
    width:30%;
    height:2rem;
    display:flex;
    align-items:center;
    justify-content:center;
    color:#CA141D;
    font-size:1.3rem;
    border:1px #CA141D solid !important;
    border-radius:1rem;
  }
  /*购物车为空时显示的商品*/ 
  .productTitle{
    text-align:center;
    padding:1rem;
    font-size:bold;
  }
  .products{
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
   
  }
  .products>div{
    width:48%;
    background-color:#fff;
    margin-top:0.6rem;
  }
  .products p:last-child{
    color:#CA141D !important;
  }
  .products>div:nth-child(2n-1){
    margin-right:0.25rem;
  }
  .products>div:nth-child(2n){
    margin-left:0.25rem;
  }
  .products>div img{
    width:80%;
    margin-top:1rem;
  }

</style>