<template>
  <div class="container">
    <div class="header">使用手机号注册</div>
    <div class="country">
      <div>国家/地区</div>
      <div>
        <span>中国&nbsp; +86</span>&nbsp;
        <img src="../assets/image/logReg/arrow-right-copy.png">
      </div>
    </div>
    <div class="inpBox">
      <div>
        <input placeholder="请输入手机号" v-model="phoneVal" ></input>
      </div>
      <p v-show="isPhone" :style="{color:errorColor}">*请输入11位有效手机号码*</p>
      <div>
        <input placeholder="请输入密码" v-model="pwdVal1" type="password"></input>
      </div>      
      <p v-show="isPwd1" :style="{color:errorColor}">*密码必须6-20个字符*</p>      
      <div>
        <input placeholder="请输入确认密码"  v-model="pwdVal2"  type="password"></input>
      </div>     
      <p v-show="isPwd2" :style="{color:errorColor}">*请再次输入密码*</p>            
    </div>
    <div class="checkbox">
      <div @click="check">
        <img v-show="!ischeck" src="../assets/image/logReg/check.png">
        <img v-show="ischeck" src="../assets/image/logReg/checked.png">
      </div>
      <div>
        继续访问代表您已经同意
        <router-link to="">华为商城服务协议</router-link>和
        <router-link to="">华为隐私政策</router-link>
      </div>
    </div>
    <div class="register" :style="{opacity:opacityVal}">
      <mt-button @click="register">注册</mt-button>
    </div>
    <div class="footer">
      <div class="phoneLogin"><router-link to="">手机号验证登录</router-link></div>
      <div class="login"><router-link to="/login">已有账号？立即登录</router-link></div>
      <div class="qq-pay">
        <img src="../assets/image/logReg/qq.png">
        <img src="../assets/image/logReg/pay.png">
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      phoneVal:"",
      pwdVal1:"",
      pwdVal2:"",
      isPhone:false,
      isPwd1:false,
      isPwd2:false,
      opacityVal:0.5,
      errorColor:"#f00",
      ischeck:false,
    }
  },
  methods: {
    check(){
      if(!this.ischeck){
        this.ischeck=true;
        this.opacityVal=1;
      }else{
        this.ischeck=false;
        this.opacityVal=0.5;
      }
    },
    
    //设置注册按钮的背景颜色 判断三个输入框输入的值是否符合格式
    phoneBlur(){
      var phoneReg=/^1[3456789]\d{9}$/;
      if(!phoneReg.test(this.phoneVal)){
        this.isPhone=true;
        return;
      }else{this.isPhone=false;}
    },
    pwd1Blur(){
      var pwdReg=/^[a-zA-Z0-9]{6,20}$/;
      if(!pwdReg.test(this.pwdVal1)){
        this.isPwd1=true;
        return;
      }else{this.isPwd1=false}
    },
    pwd2Blur(){
      if(this.pwdVal2==this.pwdVal1){
        this.isPwd2=false;
      }else{
        this.isPwd2=true;
      }
    },
    // 注册
    register(){
      if(this.opacityVal&&(this.phoneVal)&&(this.pwdVal1)&&(this.pwdVal2)){//)&&(this.phoneVal="")&&(this.pwdVal1="")&&(this.pwdVal2="")
        var url="http://127.0.0.1:3000/register";
        var obj={uname:this.phoneVal,upwd:this.pwdVal1};
        this.axios.get(url,{params:obj})
        .then(result=>{
          console.log(result);
          // code=-1，说明该用户存在
          if(result.data.code==-1){
            this.$messagebox("消息",result.data.msg);
            return;
          }else if(result.data.code==200){
            this.$toast(result.data.msg);
            this.$router.push("/login"); 
          }else{
            this.$messagebox("消息",result.data.msg);
            return;        
          }
        });
      }else{
        this.$toast("请完成填写信息！");
      }
    },
  },
  watch: {
    phoneVal(){
      this.phoneBlur();
    },
    pwdVal1(){
      this.pwd1Blur();
    },
    pwdVal2(){
      this.pwd2Blur();
      // if(this.isPwd2&&!this.isPhone){
      //   this.opacityVal=1;
      // }else{
      //   this.opacityVal=0.5;
      // }
    },
  },

}
</script>
<style scoped>
  .container{
    padding-top:1.2rem !important;  
    background:#fff;
    height:51rem;
 }
  .header{
    height:2.6rem;
    display:flex;
    align-items:center;
    color:#000;
    font-size:1.1rem;
    padding-left:1rem;
    background-color:rgba(0,0,0,0.4);
  }
  .country{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:3.8rem 0.5rem 1rem 0.7rem; 
  }
  .country>div:first-child{
    color:#191919;
    font-size:1rem;
  }
  .country>div:last-child{
    display:flex;
    align-items:center;
    font-size:0.9rem;
    color:#808080;
  }
  .country>div:last-child>img{
    width:1.1rem;
    height:1.1rem;
  }
  .register{
    text-align:center;
    margin-top:3rem;
  }
  .register .mint-button{
    width:94%;
    background-color:#666;
    color:#fff;
  }
  /*输入框*/ 
  .inpBox>div{
    border-bottom:0.01rem solid #DDDDDD;
    margin:1.3rem  0.7rem 0.1rem;
  }
  .inpBox p{
    margin-bottom:0;
    padding-left:0.7rem;
    color:#f00;
  }
  .inpBox>div span{
    padding-right:1rem;
  }
  
  .inpBox>div input{
    margin-bottom:0.3rem;
    padding-top:1rem;
    color:#333;
    font-size:1rem;
    border:0;
  }
  .inpBox>div:first-child{
    width:100%;
    padding-left:4%;
  }
  .checkbox{
    display:flex;
    margin-top:1rem;
    padding-left:0.7rem;
  }
  .checkbox>div{
    display:flex;
    align-items:center;
    font-size:0.7rem !important;
  }
  .checkbox>div img{
    width:1.2rem;
    height:1.2rem;
  }
  /*注册下的内容*/
  .footer>div{
    width:100%;
    text-align:center;
  }
  .footer>.login a,.footer>.phoneLogin a{
    font-size:0.9rem;    
    color:#005BBA !important;
  }
  .footer>.phoneLogin{
    padding:2rem 0 1rem 0;
  }
  .footer>.qq-pay{
    padding-top:2.5rem;
  }
.qq-pay>img{
  width:3rem;
  height:3rem;
  margin:1rem;
}
</style>