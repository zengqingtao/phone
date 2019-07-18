#在商品列表存一个pid与商品详情表的pid对应,在商品列表的页面使用<router-link :to="`/details/${item.pid}`"></router-link>跳转到
#详情页，并商品对应的pid传过去，然后在服务器通过pid查询该商品表的所有信息，再通过该family_id查询该商品的规格、颜色放到一个数组中保存
#在详情页面中通过选中的规格的pid重新跳转到详情页面<router-link :to="`/details/${spec.pid}`">，数据重新加载过来

#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库huawei，如果存在的话
DROP DATABASE IF EXISTS huawei;
#创建数据库huawei，设置存储的编码
CREATE DATABASE huawei CHARSET=UTF8;
#进入数据库
USE huawei;
#创建手机数据表 phone
CREATE TABLE phone(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  family_id int(11) DEFAULT NULL,
  pname  VARCHAR(32)   DEFAULT NULL,
  series  VARCHAR(128) DEFAULT NULL,
  title VARCHAR(64) DEFAULT NULL,
  spec VARCHAR(64) DEFAULT NULL,
  color VARCHAR(32) DEFAULT NULL,
  price DECIMAL(10,2) DEFAULT NULL
);
INSERT INTO phone VALUES(NULL,'1','华为','P','HUAWEI P30  麒麟980 超感光徕卡三摄 屏内指纹 双景录像 8GB+64GB 全网通版','8GB+64GB 全网通版','亮黑色','5488');
INSERT INTO phone VALUES(NULL,'1','华为','P','HUAWEI P30  麒麟980 超感光徕卡三摄 屏内指纹 双景录像 8GB+128GB 全网通版','8GB+128GB 全网通版','极光色','5988');
INSERT INTO phone VALUES(NULL,'1','华为','P','HUAWEI P30  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+256GB 全网通版','天空致镜','6388');
INSERT INTO phone VALUES(NULL,'1','华为','P','HUAWEI P30  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+512GB 全网通版','珠光贝母','6788');
INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+64GB 全网通版','亮黑色','5488');
INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro 麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+128GB 全网通版','极光色','5988');
INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro 麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+256GB 全网通版','天空致镜','6388');
INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+512GB 全网通版','珠光贝母','6788');

INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+64GB 全网通版','亮黑色','5488');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+128GB 全网通版','极光色','5988');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+256GB 全网通版','天空致镜','6388');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+512GB 全网通版','珠光贝母','6788');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+64GB 全网通版','亮黑色','5488');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+128GB 全网通版','极光色','5988');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+256GB 全网通版','天空致镜','6388');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+512GB 全网通版','珠光贝母','6788');

#创建电脑laptop数据表
CREATE TABLE laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id int(11) DEFAULT NULL,
  series  VARCHAR(128) DEFAULT NULL,
  img VARCHAR(128) DEFAULT NULL,
  title VARCHAR(64) DEFAULT NULL,
  subtitle VARCHAR(64) DEFAULT NULL,
  spec VARCHAR(64) DEFAULT NULL,
  color VARCHAR(32) DEFAULT NULL,
  price DECIMAL(10,2) DEFAULT NULL
);
INSERT INTO laptop VALUES(NULL,'3','笔记本','428_428_1539767835928mp.png','HUAWEI MateBook X ',' 13英寸轻薄笔记本电脑 流光金','I5/4GB/256GB','流光色','5488');
INSERT INTO laptop VALUES(NULL,'3','笔记本','428_428_1539767835928mp.png','HUAWEI MateBook X ',' 13英寸轻薄笔记本电脑 流光金','I5/8GB/256GB','深空灰','6188');
INSERT INTO laptop VALUES(NULL,'3','平板','428_428_1539913537863mp.png','荣耀畅玩平板2 ',' 9.6英寸 WiFi高配版','3GB+32GB','苍穹灰','1049');
INSERT INTO laptop VALUES(NULL,'3','平板','428_428_1539243116157mp.png','荣耀畅玩平板2 ',' 9.6英寸 LTE高配版','2GB+16GB','日晖金','1249');

#创建产品列表(分类)表list_product
DROP TABLE IF EXISTS `list_product`;
CREATE TABLE `list_product` (
  `lid` int(11)  PRIMARY KEY  auto_increment,
  `title` varchar(64) default NULL,
  `pic` varchar(128) default NULL,
  `pid` int(11) default NULL   #这个pid的对应phone的pid
);
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P30','1.png', '1');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P30 Pro','2.png', '2');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P20 Pro', '3.png', '3');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P20', '4.png', '4');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20 Pro', '5.png', '5');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20', '6.png', '6');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20 X', '7.png', '7');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20 RS', '8.png', '8');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 4', '9.png', '9');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 4e', '10.png', '10');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 3i', '11.png', '11');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 3', '12.png', '12');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 9', '13.png', '13');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 9e', '14.png', '14');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 9s', '15.png', '15');
INSERT INTO `list_product` VALUES (NULL, '华为畅享9 Plus', '16.png', '16');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 8e 青春', '17.png', '17');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 MAX', '18.png', '18');
INSERT INTO `list_product` VALUES (NULL, '华为麦芒8', '19.png', '19');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI 麦芒7', '20.png', '20');

#创建产品图片表product_pic
DROP TABLE IF EXISTS `product_pic`;
CREATE TABLE `product_pic`(
  `pid` int(11) default NULL,#对应phone表的pid
  `pic` varchar(128) default NULL
);

INSERT INTO `product_pic` VALUES ('1','428_428_1526955717705mp.jpg');