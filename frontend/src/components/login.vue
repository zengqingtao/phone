<template>
  <div class="app">
    <div class="loginBox">
      <div class="logo">
        <img src="../assets/image/logReg/huawei.png">
      </div>
      <div class="huawei">
        <h3>华为账号</h3>
      </div>
      <div class="inpdiv">
        <mt-field class="inp1" :placeholder="placeholderName" v-model="nameVal"></mt-field>
        <p v-show="isPassName">{{nameErrorMessage}}</p>
        <mt-field class="inp1" :placeholder="placeholderPwd" v-model="pwdVal" type="password"></mt-field>
      </div>
      <div class="test">
        <div @click="loginMethod">
          <span v-show="isAccountLogin">短信验证码登录</span>
          <span  v-show="!isAccountLogin">账号密码登录</span>
        </div>
        <div>
          <div @click="saveACcount">
            <img v-show="isSaveAccount"  src="../assets/image/logReg/check.png">
            <img v-show="!isSaveAccount" src="../assets/image/logReg/checked.png">
          </div>
          <div>记住账号</div>
        </div>
      </div>
      <div class="footer">
        <div><mt-button :style="{opacity:loginOpacity}" @click="login">登录</mt-button></div>
        <div><router-link to="/register">注册账号</router-link></div>
        <div>忘记密码</div>
        <div>
          <img src="../assets/image/logReg/qq.png">
          <img src="../assets/image/logReg/pay.png">
        </div>
        <div>更多</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      placeholderName:"手机号/邮箱地址/华为号",
      placeholderPwd:"密码",
      isAccountLogin:true,
      isSaveAccount:true,
      nameVal:"",
      pwdVal:"",
      isPassName:false,
      isPassLogin:false,
      nameErrorMessage:"*用户名必须在6-20个字符*",
      loginOpacity:0.5
    }
  },
  methods: {
    //是否记住账号
    saveACcount(){
        if(this.isSaveAccount){
          this.isSaveAccount=false;
        }else{this.isSaveAccount=true}
      },
    // 登录方式的切换
    loginMethod(){
      if(!this.isAccountLogin){
        this.placeholderName="手机号/邮箱地址/华为号";
        this.placeholderPwd="密码"
        this.isAccountLogin=true;
      }else{
        this.placeholderName="请输入您的手机号";
        this.placeholderPwd="验证码";
        this.isAccountLogin=false;
      }
    },
    // 登录验证
    nameTest(){
      var nameReg=/^[a-zA-Z0-9]{6,20}$/;
      if(!nameReg.test(this.nameVal)){
        this.isPassName=true;
        return;
      }else{this.isPassName=false}
    },
    //登录
    login(){
      var url="http://127.0.0.1:3000/login";
      var obj={uname:this.nameVal,upwd:this.pwdVal};
      this.axios.get(url,{params:obj})
      .then(result=>{
        console.log(result);
        if(result.data.code==1){
          console.log(result.data.data[0].uid);
          window.sessionStorage.setItem("data",result.data.data[0].uid);
          window.sessionStorage.setItem("uname",this.nameVal)
          this.$router.push("/");
        }else{
          this.$messagebox("温馨提示",result.data.msg);
        }
      })
    }
  },
  watch: {
   nameVal(){
    this.nameTest();
   },
   pwdVal(){
      if(this.pwdVal.length>0){
        this.loginOpacity=1;
      }else{
        this.loginOpacity=0.5;
      }
   }
  },
}
</script>
<style scoped>
  
  .app{
    padding:2.5rem 1rem;
    background-color:#fff;
    height:51rem;
  }
  .logo,.huawei{
    display:flex;
    justify-content:center;
    padding-top:1.2rem;
  }
  .loginBox img{
    width:3.5rem;
    height:3.5rem;
  }
  .huawei>h3{
    font-size:1.3rem;
  }
  .inpdiv{
    padding-top:1rem;
    position:relative;
  }
  .inpdiv p{
    padding-left:0.7rem;
    color:#f00;
  }
  .inpdiv img{
    width:1.5rem;
    height:1.5rem;
    position:absolute;
    top:1.8rem;
    right:0.5rem;
  }
  input[type='text'],input[type='password']{
    border:0 !important;
    border-bottom:1px solid #DDDDDD !important;
    padding:0 !important;
    margin-bottom:0 !important;
    margin-top:0.5rem !important;
  }
  /*短信验证登录 记住账号 栏*/
  .test{
    display:flex;
    justify-content:space-between;
    padding:1rem 0.7rem 0;
    font-size:0.7rem;
  }
  .test>div:first-child{
    color:#007FC9;
  }
  .test>div:last-child{
    display:flex;
    color:#19193E;
  }
  .test>div:last-child img{
    width:1.4rem;height:1.4rem;
    margin-right:0.1rem;
  }
  .footer>div{
    display:flex;
    justify-content:center;
    text-align:center;
  }

  .footer .mint-button{
    width:13rem !important;
    height:2rem !important;
    margin-top:2rem;
    background-color:#007DFF;
    color:#fff;
    font-size:1rem;
  }
  .footer>div:nth-child(2),.footer>div:nth-child(3){
    padding-top:1rem;
    color:#007FC9;
    font-size:0.8rem;
  }
  .footer>div:nth-child(4){
    margin-top:3rem;
  }
  .footer>div:nth-child(4)>img{
    width:2.8rem;
    height:2.8rem;
    margin:0 1rem; 
  }
  .footer>div:last-child{
    padding-top:2rem;
    color:#007FC9;
    font-size:1rem;
  }
</style>