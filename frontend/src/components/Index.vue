<template>
  <div class="container">
    <div class="tab-container">
      <mt-tab-container v-model="selected">
        <mt-tab-container-item id="index">
        index
        </mt-tab-container-item>
        <mt-tab-container-item id="product">
          <product></product>
        </mt-tab-container-item>
        <mt-tab-container-item id="find">
        find
        </mt-tab-container-item>
        <mt-tab-container-item id="cart">
        cart
        </mt-tab-container-item>
        <mt-tab-container-item id="me">
        me
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <div class="tabbar">
      <mt-tabbar v-model="selected" fixed @click="tab">
        <mt-tab-item id="index" @click.native="change(0)">
          <tabbarimg :selectedImg="require('../assets/image/index/index2.jpg')"
                     :normalImg="require('../assets/image/index/index.jpg')"
                     :bool="arr[0].isselected">
          </tabbarimg>
          <span>首页</span>
        </mt-tab-item>
        <mt-tab-item id="product" @click.native="change(1)">
          <tabbarimg :selectedImg="require('../assets/image/index/product2.jpg')"
                     :normalImg="require('../assets/image/index/product.jpg')"
                     :bool="arr[1].isselected">
          </tabbarimg>
          <span>分类</span>
        </mt-tab-item>
        <mt-tab-item id="find" @click.native="change(2)">
          <tabbarimg :selectedImg="require('../assets/image/index/find2.jpg')"
                     :normalImg="require('../assets/image/index/find.jpg')"
                     :bool="arr[2].isselected">
          </tabbarimg>
          <span>发现</span>
        </mt-tab-item>
        <mt-tab-item id="cart" @click.native="change(3)">
          <tabbarimg :selectedImg="require('../assets/image/index/cart2.jpg')"
                     :normalImg="require('../assets/image/index/cart.jpg')"
                     :bool="arr[3].isselected">
          </tabbarimg>
          <span>购物车</span>
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="change(4)">
          <tabbarimg :selectedImg="require('../assets/image/index/me2.jpg')"
                     :normalImg="require('../assets/image/index/me.jpg')"
                     :bool="arr[4].isselected">
          </tabbarimg>
          <span>我的</span>
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
import Product from './common/Product.vue'
import TabbarImg from './common/TabbarImg.vue'
export default {
  data() {
    return {
      selected:"index",
      arr:[
        {isselected:true},
        {isselected:false},
        {isselected:false},
        {isselected:false},
        {isselected:false},
      ],
      selectedImg:"",

      normalImg:"",
    }
  },
  components:{ 
    "product":Product,
    "tabbarimg":TabbarImg,
  },
  methods: {
    change(n){
      for(var i=0;i<this.arr.length;i++){
        if(n==i){
          this.arr[i].isselected=true;
        }else{
          this.arr[i].isselected=false;
        }
      }
    }
  },
}
</script>
<style >
/*底部面板的文字颜色，被选中的背景色和文字颜色,*/ 
.mint-tabbar>.mint-tab-item{
  color:#333;
}
.mint-tabbar>.mint-tab-item.is-selected{
  background-color:transparent !important;
  color:#C81517 !important;
}
</style>