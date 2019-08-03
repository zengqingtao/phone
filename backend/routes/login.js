const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  // console.log(uname);
  // console.log(upwd);
  var sql="select uid from user where uname=? and upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      // 将用户uid保存到session对象
      console.log(999);
      console.log(result[0].uid);
      req.session.uid=result[0].uid;
      console.log("mySession:"+req.session.uid);
      res.send({code:1,msg:"登录成功",data:result});
    }else{
      res.send({code:-1,msg:"用户名或者密码错误"});
    }
  })
})

module.exports=router;