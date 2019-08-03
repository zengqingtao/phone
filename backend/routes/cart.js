const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var uid=req.query.uid;
  console.log("cart99");
  console.log(uid);
  var sql="select * from cart where uid = ?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send(result);
    // console.log(result);
  })
})

module.exports=router;