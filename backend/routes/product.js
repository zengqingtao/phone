const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var sql="select * from list_product";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    // res.writeHead(200,{
    //   "Access-Control-Allow-Origin":"http://localhost:8080"
    // })
    // res.write(JSON.stringify(result))
    // res.end();
    res.send(result);
  })
})

module.exports=router;