const express=require("express")
const router=express.Router();
const pool=require("../pool")

//app.use("/details",Details)
//鏈嶅姟绔帴鍙ｅ湴鍧€http://localhost:3000/details
//瀹㈡埛绔姹傛椂:
//http://localhost:3000/details?lid=1
router.get("/",(req,res)=>{
  var pid=req.query.pid;
  var output={
    product:{},
    specColors:[],
    pics:[],
  }
  if(pid!==undefined){
    var sql1=`select * from phone where pid=?`;
    pool.query(sql1,[pid],(err,result)=>{
      if(err) console.log(err);
      // result是个数组,里面只有一条数据，该数据是个对象
      output.product=result[0];
      // console.log(result);
      var family_id=output.product["family_id"];//["family_id"]是获取family_id属性的值
      var sql2=`select spec,color,pid from phone where family_id=?`;
      pool.query(sql2,[family_id],(err,result)=>{
        if(err) console.log(err);
        // console.log(result);
        output.specColors=result;
        var sql3=`select * from product_pic where pid=?`
        pool.query(sql3,[family_id],(err,result)=>{
          if(err) console.log(err);
          output.pics=result;
          res.send(output);
        // 
        })
      })
    })
  }else{
    res.send(output);
  }
})

module.exports=router;