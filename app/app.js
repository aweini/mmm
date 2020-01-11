// 引入第三方模块(有的需要 npm install 下载后再引用)
const express = require('express');// 核心模块
const bodyParser = require('body-parser');// 解析前台请求
const cors=require('cors'); // 解决跨域
const mysql=require("mysql");
const session =require("express-session");
const MySQLStore=require('express-mysql-session')(session); //连接mysql主要模块

// 设置session信息需要保存到的数据库的参数
var options = {
  host:'127.0.0.1',
  port:3306,
  user:'root',
  password:'',
  database:'shop'
}
var sessionConnection = mysql.createConnection(options);//建立与前面设置好的数据库之间的联系
var sessionStore = new MySQLStore({ //连接到数据库时的操作(是否创建表格,表格的信息,及在表格中的有效期)
  expiration: 10800000,
  createDatabaseTable: true,  //是否创建表
  schema: {
      tableName: 'session_tab',   //表名
      columnNames: {      //列选项
          session_id: 'session_id',
          expires: 'expires',
          data: 'data'
      }
  }
}, sessionConnection);

// 引入路由
const indexRouter = require("./router/index.js")
const userRouter = require("./router/user.js")
const cartRouter = require("./router/cart.js")
// 创建服务器
let app = express();
// 设置端口号
app.listen(7070,function(){
    console.log("App is Running at Port 7070");
});
// 配置跨域
app.use(cors({
    origin:["http://127.0.0.1:8080","http://localhost:8080"],// 可以访问7070端口资源的两个地址
    credentials:true
  }));
// 配置session
app.use(session({
    secret:"128位字符串",// 安全字符串(加密的条件) 对需要存储的数据进行加密
    resave:false,//请求更新数据
    store: sessionStore,//设置session的存储方式(保存到数据库)
    cookie:("name","value",{maxAge:60*60*1000,secure: false,
      name: "seName",
      resave: false}),
    rolling:true,
    saveUninitialized:true
  }));
// 利用 body-parser 中间件 解析用户的请求主体
app.use(bodyParser.urlencoded({
    extended:false
}));
// 指定静态资源目录
app.use(express.static('./public'));

// 挂载路由
app.use("/index",indexRouter)
app.use("/user",userRouter)
app.use("/cart",cartRouter)