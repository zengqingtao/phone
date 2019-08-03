<template>
  <div class="container">
    <div class="header">
      <div class="message">
        <img src="../../assets/image/me/shezhi.png"><img src="../../assets/image/me/duanxin.png">
      </div>
      <div class="logReg">
        <div class="left">
          <img src="../../assets/image/me/touxiang.png">          
        </div>
        <div class="right">
          <div v-show="!isLogin">
            <span><router-link :to="`/login`">登录</router-link></span> /
            <span><router-link to="register">注册</router-link></span>
          </div>
          <div v-show="isLogin">{{uname}}</div>
          <div>
            <img src="../../assets/image/me/qiandao.png">
            <span>签到领积分</span>
          </div>
        </div>
      </div>
    </div>
    <div class="header-bottom">
      <div>
        <p>-</p>
        <p>积分</p>
      </div>
      <div>
        <p>-</p>
        <p>优惠券</p>
      </div>
      <div>
        <p>-</p>
        <p>代金券</p>
      </div>
    </div>
    <div class="my-order">
      <div>
        <div>我的订单</div>
        <div class='all-order'>全部订单&nbsp;<span>></span></div>
      </div>
      <div>
        <div>
          <i class="iconfont icon-tuihuanhuo"></i>
          <p>退换/退款</p>
        </div>
        <div>
          <i class="iconfont icon-tuihuanhuodingdan"></i>
          <p>待回收</p>
        </div>
        <div>
          <i class="iconfont icon-daifukuan"></i>
          <p>待付款</p>
        </div>
        <div>
          <i class="iconfont icon-icon-test"></i>
          <p>待评价</p>
        </div>
        <div>
          <i class="iconfont icon-huishouqia"></i>          
          <p>回收单</p>
        </div>
      </div>
    </div>
    <div class="myVmall">
      <div>我的VMALL</div>
      <div>
        <div>
          <img src="../../assets/image/me/myVmall01.png">
          <div>会员频道</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall02.png">
          <div>邀请有礼</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall03.png">
          <div>优享购</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall04.png">
          <div>优购码</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall05.png">
          <div>收货地址</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall06.png">
          <div>实名认证</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall07.png">
          <div>预约记录</div>
        </div>
        <div>
          <img src="../../assets/image/me/myVmall08.png">
          <div>账号中心</div>
        </div>
      </div>
    </div>
    <div class="myVmall myService">
      <div>
        我的服务
      </div>
      <div>
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>依旧换新</div>
        </div>
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>线下门店</div>
        </div>
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>补够保障</div>
        </div>
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>手机充值</div>
        </div>
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>在线客服</div>
        </div> 
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>常见问题</div>
        </div> 
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>一口价换电池</div>
        </div> 
        <div>
          <img src="../../assets/image/me/myService01.png">
          <div>意见反馈</div>
        </div>         
      </div>
    </div>
    <div class="recommend">
      <img src="../../assets/image/me/recommend01.png">
      <img src="../../assets/image/me/recommend02.png">
      <img src="../../assets/image/me/recommend03.png">
      <img src="../../assets/image/me/recommend04.png">
      <img src="../../assets/image/me/vmall.png">
    </div>
    <div class="foot">
      <foot></foot>    
    </div>
  </div>
</template>
<script>
import foot from './footer.vue'
export default {
  data() {
    return {
      uname:"",
      isLogin:false
    }
  },
  components:{
    "foot":foot
  },
  methods: {
    // 登录成功获取账号
    phone(){
      if(typeof(window.sessionStorage.uname) != "undefined"){
        this.uname = window.sessionStorage.uname;
        console.log("uname:"+this.uname);
        this.isLogin = true;
      }else{
        this.isLogin = false;
      }
    }
  },
  created(){
    this.phone();
  }
}
</script>
<style scoped>
 
  .header{
    height:10.5rem;
    background:linear-gradient(90deg,#EB4733,#E0252E);
    border-radius:0 0 1rem 1rem;
  }
  /*设置-信息*/ 
  .message{
    text-align:right;
  }
  .message img:last-child{
    margin:0  1rem 0 0.6rem;
  }
  .message img{
    width:1.3rem;
    margin-top:0.6rem;
  }
  /*登录-注册*/ 
  .logReg{
    display:flex;
    padding-left:1.5rem;
  }
  .left>img{
    width:3.5rem;
  }
  .right{
    padding:0.5rem 0 0 0.6rem;
    color:#FFFDFD;
  }
  .right>div:first-child a{
    font-size:1.2rem;
    color:#FFFDFD !important;
  }
  .right>div:last-child{
    margin-top:0.3rem;
    font-size:0.3rem;
    background-color:rgba(0,0,0,0.2);
    border-radius:3rem;
  }
  .right img{
    width:1.1rem;
    padding:0 0.2rem;
  }
  .header-bottom{
    width:94%;
    height:4rem;
    display:flex;
    align-items:center;
    justify-content:space-around;
    margin-left:3%;
    background-color:#fff;
    margin-top:-1rem;
    border-radius:0.6rem;
    text-align:center;
  }
  .header-bottom p{
    margin-bottom:0;
  }
  /**我的订单*/ 
  .my-order{
    background-color:#fff;
    height:7rem;
    margin:2% 3%;
    border-radius:0.5rem;    
  }
  .my-order>div:first-child{
    display:flex;
    justify-content:space-between;
    font-size:1rem;
    padding:2% 2%;
    color:#333;
  }
  .my-order .all-order{
    font-size:0.8rem;    
    color:#666;
  }
  .my-order .all-order>span{
    color:#b0b0b0;
  }
  .my-order>div:last-child{
    display:flex;
    justify-content:space-around;
    text-align:center;
    margin-top:0.5rem;
  }
  .my-order>div:last-child p{
    margin-top:0.5rem;
    font-size:0.8rem !important;    
  }
  .my-order>div:last-child i{
    color:#A4A4A4;
    font-size:1.5rem ;
  }
  .icon-huishouqia{
    font-size:1.3rem !important;
  }
  .icon-tuihuanhuodingdan,.icon-tuihuanhuo{
    font-size:1.8rem !important;
  }
  /*我的Vmall*/ 
  .myVmall{
    height:11rem;
    background-color:#fff;
    margin:0 3%;
    border-radius:0.5rem;
  }
  .myVmall>div:first-child{
    font-size:1rem;
    font-weight:bold;
    color:#333;    
    padding:1% 2%;
  }
  .myVmall>div:last-child{
    display:flex;
    flex-wrap:wrap;
    justify-content:space-between;
    text-align:center;
    font-size:0.8rem;
    color:#666;
  }
  .myVmall>div:last-child>div{
    width:23%;
  }
  .myVmall>div:last-child img{
    width:2.5rem;
  }
  .myService{
    margin-top:1rem;
  }
  .recommend{
    display:flex;
    align-items:column;
    flex-wrap:wrap;
    padding:0 3%;
  }
  .recommend>img{
    width:100%;  
    height:8rem;
    margin:2% 0; 
    border-radius:0.5rem;
    overflow:hidden; 
  }
  .recommend>img:last-child{
    width:30%;
    height:1.5rem;
    margin-left:35%;
  }
  /*脚部*/ 
  .foot{
    background-color:#fff;
  }
</style>