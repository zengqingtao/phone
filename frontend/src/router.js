import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Home from "./components/Home.vue"
import Product from "./components/common/Product.vue"
import Details from "./components/Details.vue"
import Huaweiphone from "./components/common/Huaweiphone.vue"
import footer from "./components/common/footer.vue"
import login from "./components/login.vue"
import register from "./components/register.vue"
import cart from "./components/common/cart.vue"
import search from "./components/common/Search.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',component:Home},
    {path:'/home/:selected',component:Home},
    {path:'/product',component:Product},
    {path:'/details/:pid',component:Details,props:true},
    {path:'/home/details/:pid',component:Details,props:true},
    {path:'/huaweiphone',component:Huaweiphone},
    {path:'/login',component:login},
    {path:'/register',component:register},
    {path:'/footer',component:footer},
    {path:'/cart',component:cart},
    {path:'/search',component:search}
  ]
})
