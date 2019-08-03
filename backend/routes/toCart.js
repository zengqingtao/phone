const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var pid = req.query.pid;
  var obj = req.query;
  // console.log(obj);
  // 查询购物车表是否有该pid商品
  var sql1 = "SELECT * FROM cart WHERE pid = ?";
  pool.query(sql1,[pid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      count = Number(obj.count);
      count += result[0].count; 
      // 如果有更新该商品数量
      var sql2="UPDATE cart SET count = ? WHERE pid = pid";
      pool.query(sql2,[count,pid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"加入购物车成功"});
        }else{
          res.send({code:-1,msg:"加入购物车失败"});
        }
      })
    }else{
      // 如果没有，就插入该该商品
      var sql2="INSERT INTO cart SET ?";
      pool.query(sql2,[obj],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"加入购物车成功"})
        }else{
          res.send({code:-1,msg:"加入购物车失败"});
        }
      })
    }
  });
 
})

module.exports=router;