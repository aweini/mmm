-- 设置客户端连接服务器端的编码
SET NAMES UTF8;
-- 丢弃数据库 如果存在
DROP DATABASE IF EXISTS shop;
-- 创建数据库，并设置存储编码
CREATE DATABASE shop CHARSET=UTF8;
-- 进入数据库
USE shop;

-- 创建轮播图信息表
CREATE TABLE carousel (
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(512)
);
-- 插入轮播图信息表的数据
INSERT INTO carousel VALUES(null,"image/carousel/carousel_1.jpg");
INSERT INTO carousel VALUES(null,"image/carousel/carousel_2.jpg");
INSERT INTO carousel VALUES(null,"image/carousel/carousel_3.jpg");

-- 创建秒杀图信息表
CREATE TABLE ms (
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(512)
);
-- 插入秒杀图信息表的数据
INSERT INTO ms VALUES(null,"image/miaosha.jpg");

-- 创建showCase的图片表格
CREATE TABLE showcase (
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(512),
    categoryId INT
);
-- 插入showCase的图片表格的数据
INSERT INTO showcase VALUES(NULL,"image/showcase/lianyiqun.jpg",2020);
INSERT INTO showcase VALUES(NULL,"image/showcase/shangyi.jpg",2021);
INSERT INTO showcase VALUES(NULL,"image/showcase/kuzi.jpg",2022);
INSERT INTO showcase VALUES(NULL,"image/showcase/maoshan.jpg",2023);
INSERT INTO showcase VALUES(NULL,"image/showcase/waitao.jpg",2024);
INSERT INTO showcase VALUES(NULL,"image/showcase/yurong.jpg",2025);

-- 衣服详情表
CREATE TABLE clothdetail (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    detailName VARCHAR(128),            
    categoryId   INT,                  
    categoryName VARCHAR(16),          
    minPrice INT,                      
    maxPrice INT,                      
    color VARCHAR(16),                 
    size  VARCHAR(16),                
    totalCount INT,                    
    pic  VARCHAR(128),                 
    carouselPic VARCHAR(512),                 
    detailPic VARCHAR(512),                 
    saleCount INT                    
);
-- 插入2021类衣服详情数据
INSERT INTO clothdetail VALUES(null,"彩葱半高领绞花针织衫",2021,"上衣",499,599,"白色","L",24,"image/shangyi/1.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",40);
INSERT INTO clothdetail VALUES(null,"露肩针织衫",2021,"上衣",498,599,"白色","L",25,"image/shangyi/2.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",45);
INSERT INTO clothdetail VALUES(null,"开衫针织衫",2021,"上衣",497,599,"白色","L",26,"image/shangyi/3.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",50);
INSERT INTO clothdetail VALUES(null,"字母连帽短款卫衣",2021,"上衣",598,699,"白色","L",27,"image/shangyi/4.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",55);
INSERT INTO clothdetail VALUES(null,"基本款打底衫",2021,"上衣",577,699,"白色","L",28,"image/shangyi/5.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",60);
INSERT INTO clothdetail VALUES(null,"圆领亮丝打底衫",2021,"上衣",355,499,"白色","L",29,"image/shangyi/6.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",66);
INSERT INTO clothdetail VALUES(null,"小高领亮丝打底衫",2021,"上衣",433,593,"白色","L",30,"image/shangyi/7.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",90);
INSERT INTO clothdetail VALUES(null,"纯色针织衫",2021,"上衣",666,699,"白色","L",31,"image/shangyi/8.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",95);
INSERT INTO clothdetail VALUES(null,"翻领卫衣",2021,"上衣",777,899,"白色","L",32,"image/shangyi/9.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",97);
INSERT INTO clothdetail VALUES(null,"拉毛高领打底衫",2021,"上衣",456,565,"白色","L",33,"image/shangyi/10.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",98);
INSERT INTO clothdetail VALUES(null,"渐变色针织衫",2021,"上衣",555,599,"白色","L",34,"image/shangyi/11.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",99);
INSERT INTO clothdetail VALUES(null,"打底针织衫",2021,"上衣",564,699,"白色","L",35,"image/shangyi/12.webp","image/c_carousel/1.webp&image/c_carousel/2.webp&image/c_carousel/3.webp&image/c_carousel/4.webp","image/c_detail/1.jpg&image/c_detail/2.jpg&image/c_detail/3.jpg&image/c_detail/4.jpg&image/c_detail/5.jpg&image/c_detail/6.jpg&image/c_detail/7.jpg&image/c_detail/8.jpg",100);

-- 商品规格信息表
CREATE TABLE clothselect (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    detailName VARCHAR(32),            
    categoryId   INT,                  
    categoryName VARCHAR(16),          
    color VARCHAR(16),                 
    size  VARCHAR(16),                 
    totalCount INT,                    
    pic  VARCHAR(128)              
);

-- 插入商品规格信息表数据
INSERT INTO clothselect VALUES (null,"露肩针织衫",2021,"上衣","白色","M",22,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"露肩针织衫",2021,"上衣","白色","L",55,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"露肩针织衫",2021,"上衣","黑色","M",121,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"露肩针织衫",2021,"上衣","黑色","L",256,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"开衫针织衫",2021,"上衣","白色","M",22,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"开衫针织衫",2021,"上衣","白色","L",55,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"开衫针织衫",2021,"上衣","黑色","M",121,"image/shangyi/test.jpg");
INSERT INTO clothselect VALUES (null,"开衫针织衫",2021,"上衣","黑色","L",256,"image/shangyi/test.jpg");

-- 全部商品列表页表格
CREATE TABLE clothlist (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    detailName VARCHAR(128),            
    categoryId   INT,                  
    categoryName VARCHAR(16),                             
    maxPrice INT,                                                     
    pic  VARCHAR(128), 
    saleCount INT                                  
);

-- 全部插入商品列表页数据
INSERT INTO clothlist VALUES(null,"彩葱半高领绞花针织衫",2021,"上衣",499,"image/shangyi/1.webp",56);
INSERT INTO clothlist VALUES(null,"露肩针织衫",2021,"上衣",498,"image/shangyi/2.webp",33);
INSERT INTO clothlist VALUES(null,"开衫针织衫",2021,"上衣",497,"image/shangyi/3.webp",520);
INSERT INTO clothlist VALUES(null,"字母连帽短款卫衣",2021,"上衣",598,"image/shangyi/4.webp",451);
INSERT INTO clothlist VALUES(null,"基本款打底衫",2021,"上衣",577,"image/shangyi/5.webp",123);
INSERT INTO clothlist VALUES(null,"圆领亮丝打底衫",2021,"上衣",355,"image/shangyi/6.webp",321);
INSERT INTO clothlist VALUES(null,"小高领亮丝打底衫",2021,"上衣",433,"image/shangyi/7.webp",77);
INSERT INTO clothlist VALUES(null,"纯色针织衫",2021,"上衣",666,"image/shangyi/8.webp",431);
INSERT INTO clothlist VALUES(null,"翻领卫衣",2021,"上衣",777,"image/shangyi/9.webp",526);
INSERT INTO clothlist VALUES(null,"拉毛高领打底衫",2021,"上衣",456,"image/shangyi/10.webp",78);
INSERT INTO clothlist VALUES(null,"渐变色针织衫",2021,"上衣",555,"image/shangyi/11.webp",23);
INSERT INTO clothlist VALUES(null,"打底针织衫",2021,"上衣",564,"image/shangyi/12.webp",111);
INSERT INTO clothlist VALUES(null,"长款羽绒服",2025,"羽绒服",888,"image/yurong/1.webp",56);
INSERT INTO clothlist VALUES(null,"米咖撞色茧型羽绒服",2025,"羽绒服",568,"image/yurong/2.webp",77);
INSERT INTO clothlist VALUES(null,"羊羔毛连帽中长棉服",2025,"羽绒服",456,"image/yurong/3.webp",125);
INSERT INTO clothlist VALUES(null,"工装风短款羽绒服",2025,"羽绒服",1888,"image/yurong/4.webp",21);
INSERT INTO clothlist VALUES(null,"连帽带毛球中长羽绒服",2025,"羽绒服",999,"image/yurong/5.webp",23);
INSERT INTO clothlist VALUES(null,"连帽短款面包羽绒服",2025,"羽绒服",1250,"image/yurong/6.webp",46);
INSERT INTO clothlist VALUES(null,"毛领连帽短款羽绒服",2025,"羽绒服",2000,"image/yurong/7.webp",7);
INSERT INTO clothlist VALUES(null,"轻薄连帽羽绒服",2025,"羽绒服",1800,"image/yurong/8.webp",9);
INSERT INTO clothlist VALUES(null,"收腰毛领羽绒服",2025,"羽绒服",1700,"image/yurong/9.webp",33);
INSERT INTO clothlist VALUES(null,"休闲羽绒服",2025,"羽绒服",688,"image/yurong/10.webp",56);
INSERT INTO clothlist VALUES(null,"两面穿连帽外套",2025,"羽绒服",788,"image/yurong/11.webp",56);
INSERT INTO clothlist VALUES(null,"可脱卸风衣羽绒外套",2025,"羽绒服",1358,"image/yurong/12.webp",45);

-- 羽绒类2025商品表格
CREATE TABLE clothyurong (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    detailName VARCHAR(128),            
    categoryId   INT,                  
    categoryName VARCHAR(16),                             
    maxPrice INT,                                                     
    pic  VARCHAR(128), 
    saleCount INT                                  
);

-- 插入羽绒类2025商品表格数据
INSERT INTO clothyurong VALUES(null,"长款羽绒服",2025,"羽绒服",888,"image/yurong/1.webp",56);
INSERT INTO clothyurong VALUES(null,"米咖撞色茧型羽绒服",2025,"羽绒服",568,"image/yurong/2.webp",77);
INSERT INTO clothyurong VALUES(null,"羊羔毛连帽中长棉服",2025,"羽绒服",456,"image/yurong/3.webp",125);
INSERT INTO clothyurong VALUES(null,"工装风短款羽绒服",2025,"羽绒服",1888,"image/yurong/4.webp",21);
INSERT INTO clothyurong VALUES(null,"连帽带毛球中长羽绒服",2025,"羽绒服",999,"image/yurong/5.webp",23);
INSERT INTO clothyurong VALUES(null,"连帽短款面包羽绒服",2025,"羽绒服",1250,"image/yurong/6.webp",46);
INSERT INTO clothyurong VALUES(null,"毛领连帽短款羽绒服",2025,"羽绒服",2000,"image/yurong/7.webp",7);
INSERT INTO clothyurong VALUES(null,"轻薄连帽羽绒服",2025,"羽绒服",1800,"image/yurong/8.webp",9);
INSERT INTO clothyurong VALUES(null,"收腰毛领羽绒服",2025,"羽绒服",1700,"image/yurong/9.webp",33);
INSERT INTO clothyurong VALUES(null,"休闲羽绒服",2025,"羽绒服",688,"image/yurong/10.webp",56);
INSERT INTO clothyurong VALUES(null,"两面穿连帽外套",2025,"羽绒服",788,"image/yurong/11.webp",56);
INSERT INTO clothyurong VALUES(null,"可脱卸风衣羽绒外套",2025,"羽绒服",1358,"image/yurong/12.webp",45);

-- 用户信息表
CREATE TABLE shopuser (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upassword VARCHAR(32),
    uphone INT,
    uaddress VARCHAR(64),
    credits INT,
    coupon INT,
    photo VARCHAR(64)
);
-- 插入用户信息数据
INSERT INTO shopuser VALUES(null,"马鹏程","mpc940606","1370208676","中国安徽",5,6,"image/user/tx.png");

-- 购物车列表
CREATE TABLE cart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    detailName VARCHAR(32),
    color VARCHAR(16),
    size VARCHAR(16),
    pic VARCHAR(128),
    count INT,
    price INT,
    uid INT
);