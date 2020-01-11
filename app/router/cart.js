// 引入核心模块express
const express=require('express');
// 引入连接池(操作数据库)
const pool=require('../pool.js');
// 设置路由
var router=express.Router();

// 1.添加商品的路由
router.post("/addproduct",(req,res)=>{
   //1:获取当前登录用户凭证(从伴随请求信息的cookie中获取(登录时保存在session中并返回客户端保存的))
   var uid = req.session.uid;
   //2:如果当前用户没有登录 请登录
   if(!uid){
     res.send("3");
     return;
   }
   var obj = req.body;
   obj.uid = uid;
   pool.query("INSERT INTO cart SET ?",[obj],(err,result)=>{
       if(err) throw err;
       if(result.affectedRows === 1){
            res.send("1");
        }else{
            res.send("0");
        }
   })
});
// 2.获取购物车中商品的路由
router.get("/getproduct",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){
    res.send("3");
    return;
  }
  pool.query("select * from cart where uid=?",[uid],(err,result)=>{
    if(err) throw err;
    result.length==0 ? res.send("0") : res.send(result);
  })
});
// 3.删除商品路由
router.get("/del",(req,res)=>{
  var id= req.query.id; 
  var sql = `DELETE FROM cart WHERE id IN (${id})`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send("1");
    };
    if(result.affectedRows==0){
      res.send("0");
    }
  })
})





























// 抛出路由
module.exports=router;