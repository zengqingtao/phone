//使用express构建web服务器 
const express = require('express');
const bodyParser = require('body-parser');
const cors=require('cors');
// 引入express-session模块,添加session功能
const session=require("express-session");
/*引入路由模块*/
const index=require("./routes/index");
const product=require("./routes/product");
const details=require("./routes/details");
const login=require("./routes/login");
const register=require("./routes/register");
const toCart=require("./routes/toCart");
const cart=require("./routes/cart");//两个购物车接口，一个是加入购物车的，一个是购物车的
const delCart=require("./routes/delCart");


var app = express();
var server = app.listen(3000);

// 使用中间件cors设置跨域
app.use(cors({
  origin:"http://127.0.0.1:8080",
  credentials:true,
}));
app.use(session({
  //安全性设置  这里随机输入字符串，系统把其转为随机的128位字符串，目的：即使服务器蹦了，数据也不会泄露
  secret:"128为字符串",
  // 每次请求是否更新数据
  resave:true,
  // 保存初始化数据
  saveUninitialized:true,
}));

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/product",product);
app.use("/details",details);
app.use("/login",login);
app.use("/register",register);
app.use("/toCart",toCart);
app.use("/cart",cart);
app.use("/delCart",delCart);