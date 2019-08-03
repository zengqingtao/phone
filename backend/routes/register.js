const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var uname=req.query.uname;
  var obj=req.query;
  var sql1="select * from user where uname=?";
  pool.query(sql1,[uname],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:-1,msg:"*该账号已注册*"});
    }else{
      // 插入数据
      var sql2="insert into user set ?";
      pool.query(sql2,[obj],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
          res.send({code:200,msg:"注册成功,请登录"})
        }else{
          res.send({code:301,msg:"注册失败"});
        }
      })
    }
  })
})
module.exports=router;
