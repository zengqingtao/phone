import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Index from "./components/Index.vue"
import Product from "./components/common/Product.vue"
import Details from "./components/Details.vue"
import Huaweiphone from "./components/common/Huaweiphone.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',component:Index},
    {path:'/product',component:Product},
    {path:'/details/:pid',component:Details,props:true},
    {path:'/huaweiphone',component:Huaweiphone},
  ]
})
