const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var pid = req.query.id;
  console.log(pid);
  var sql = "delete from cart where pid = ?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      console.log(">0");
    } 
  })
})

module.exports=router;