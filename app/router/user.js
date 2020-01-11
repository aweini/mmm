// 引入核心模块express
const express=require('express');
// 引入连接池(操作数据库)
const pool=require('../pool.js');
// 设置路由
var router=express.Router();

// 1.用户登录
router.get("/login",(req,res)=>{
    var uname = req.query.username;
    var upwd = req.query.password;
    pool.query("select * from shopuser where uname = ? and upassword= ?",[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            //将当前登录用户id保存到session对象中作为登录成功凭证
            // 该session信息会伴随响应消息返回到客户端保存到cookie中(cookie中的信息会自动伴随每一次客户端请求来到服务端 Set-Cookie 是响应头中的一部分)
            var uid = result[0].uid;
            var uname = result[0].uname;
            req.session.uid = uid;
            req.session.username = uname;
            console.log(req.session);
            res.send(result);
        }else{
            res.send("0");
        }
    })
});
// 2.用户注册
router.post("/register",(req,res)=>{
    var obj = req.body;
    pool.query("INSERT INTO shopuser SET ?" ,[obj],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows === 1){
            res.send("1");
        }else{
            res.send("0");
        }
    })
});
// 3.退出登录
router.get('/loginOut',function(req,res){
    //注销session
    req.session.destroy(function(err){
        res.send("1");
    });
});















































// 抛出路由
module.exports=router;