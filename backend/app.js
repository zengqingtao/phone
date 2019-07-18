//使用express构建web服务器 
const express = require('express');
const bodyParser = require('body-parser');
const cors=require('cors');
/*引入路由模块*/
const product=require("./routes/product");
const details=require("./routes/details");

var app = express();
var server = app.listen(3000);
// 使用中间件cors设置跨域
app.use(cors({
  origin:"http://127.0.0.1:8080",
  credentials:true,
}));
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
/*使用路由器来管理路由*/
app.use("/product",product);
app.use("/details",details);