// 引入核心模块express
const express=require('express');
// 引入连接池(操作数据库)
const pool=require('../pool.js');
// 设置路由
var router=express.Router();
// 1.查询首页轮播及首页商品列表信息(采用(async function(){})与Promise)
router.get("/",(req,res)=>{
    var output={};
    (async function(){
        await Promise.all([
            new Promise((resolve,reject)=>{
                pool.query("select * from carousel",[],(err,result)=>{
                    if (err) throw err;
                    var res="";
                    result.forEach(elem=>{
                      res+=elem.pic+"&"
                    })
                    res=res.slice(0,-1);
                    output.pic=res;
                    resolve();
                })
            }),
            new Promise((resolve,reject)=>{
                pool.query("select * from ms",[],(err,result)=>{
                    if (err) throw err;
                    output.ms= result[0].pic;
                    resolve();
                })
            }),
            new Promise((resolve,reject)=>{
                pool.query("select * from showcase",[],(err,result)=>{
                    if(err) throw err;
                    output.showcase = result;
                    resolve();
                })
            }),
            new Promise((resolve,reject)=>{
                pool.query("select * from clothdetail",[],(err,result)=>{
                    if(err) throw err;
                    output.product = result;
                    resolve();
                })
            })
        ])
        res.send(output)
    })()
});
// 2.条件查询(销量)
router.get("/sortSale",(req,res)=>{
    var CategoryId = req.query.CaId;
    if(CategoryId==="2021"|| !CategoryId){
        pool.query("select * from clothdetail order by saleCount DESC",[],(err,result)=>{
            if(err) throw err;
            res.send(result);
        });
        return;
    };
    if(CategoryId==="2025"){
        pool.query("select * from clothyurong order by saleCount DESC",[],(err,result)=>{
            if(err) throw err;
            res.send(result);
        });
    }

});
// 3.条件查询(价格实际为上新)
router.get("/sortPrice",(req,res)=>{
    var CategoryId = req.query.CaId;
    if(CategoryId==="2021"|| !CategoryId){
        pool.query("select * from clothdetail order by maxPrice DESC",[],(err,result)=>{
            if(err) throw err;
            res.send(result);
        });
        return;
    };
    if(CategoryId==="2025"){
        pool.query("select * from clothyurong order by maxPrice DESC",[],(err,result)=>{
            if(err) throw err;
            res.send(result);
        });
    }

});
// 4.条件查询(推荐)价格由低到高
router.get("/sortRecommend",(req,res)=>{
    var CategoryId = req.query.CaId;
    if(CategoryId==="2021"|| !CategoryId){
        pool.query("select * from clothdetail order by maxPrice ASC",[],(err,result)=>{
            if(err) throw err;
            res.send(result);
            return;
        })
    };
    if(CategoryId==="2025"){
        pool.query("select * from clothyurong order by maxPrice ASC",[],(err,result)=>{
            if(err) throw err;
            res.send(result);
            return;
        })
    }
});
// 5.首页按照CategoryId跳转到指定类型商品列表页
router.get("/toList",(req,res)=>{
    var CategoryId = req.query.CategoryId;
    pool.query("select * from clothlist where CategoryId = ? ",[CategoryId],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})
// 6.首页跳转到全部商品列表页
router.get("/toall",(req,res)=>{
    pool.query("select * from clothlist",[],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});
// 7.全部商品页面排序 价格↑ 升序
router.get("/ascprice",(req,res)=>{
    pool.query("select * from clothlist order by maxPrice ASC",[],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});
// 8.全部商品页面排序 价格↓ 降序
router.get("/descprice",(req,res)=>{
    pool.query("select * from clothlist order by maxPrice DESC",[],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});
// 9.全部商品页面排序 价格↓ 降序
router.get("/descsale",(req,res)=>{
    pool.query("select * from clothlist order by saleCount DESC",[],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});
// 10.商品的规格
router.get("/clothselect",(req,res)=>{
    var detailName = req.query.dName;
    var color = req.query.color;
    var size = req.query.size;
    pool.query("select * from clothselect where detailName=? and color=? and size=?",[detailName,color,size],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})
// 11.商品详情页面
router.get('/detail',(req,res)=>{
    var detailName = req.query.dName;
    pool.query("select * from clothdetail where detailName = ?",[detailName],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})











// 抛出路由
module.exports=router;