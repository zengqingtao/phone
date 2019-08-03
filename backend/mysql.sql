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

INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+64GB 全网通版','亮黑色','5488888');
INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro 麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+128GB 全网通版','极光色','5988');
INSERT INTO phone VALUES(NULL,'2','华为','P','HUAWEI P30 Pro 麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+256GB 全网通版','天空致镜','6388');

INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像','8GB+64GB 全网通版','亮黑色','5488');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+128GB 全网通版','极光色','5988');
INSERT INTO phone VALUES(NULL,'3','荣耀','荣耀','荣耀20  麒麟980 超感光徕卡三摄 屏内指纹 双景录像','8GB+256GB 全网通版','天空致镜','6388');

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

#创建首页数据表index_product
DROP TABLE IF EXISTS `index_product`;



#创建产品列表(分类)表list_product
DROP TABLE IF EXISTS `list_product`;
CREATE TABLE `list_product` (
  `lid` int(11)  PRIMARY KEY  auto_increment,
  `title` varchar(64) default NULL,
  `pic` varchar(128) default NULL,
  `pid` int(11) default NULL   #这个pid的对应phone的pid
);
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P30','1.png', '1');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P30 Pro','2.png', '5');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P20 Pro', '3.png', '8');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI P20', '4.png', '11');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20 Pro', '5.png', '14');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20', '6.png', '17');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20 X', '7.png', '20');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI Mate 20 RS', '8.png', '23');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 4', '9.png', '26');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 4e', '10.png', '29');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 3i', '11.png', '32');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI nova 3', '12.png', '35');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 9', '13.png', '38');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 9e', '14.png', '41');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 9s', '15.png', '44');
INSERT INTO `list_product` VALUES (NULL, '华为畅享9 Plus', '16.png', '47');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 8e 青春', '17.png', '50');
INSERT INTO `list_product` VALUES (NULL, '华为畅享 MAX', '18.png', '53');
INSERT INTO `list_product` VALUES (NULL, '华为麦芒8', '19.png', '56');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI 麦芒7', '20.png', '59');
INSERT INTO `list_product` VALUES (NULL, '荣耀20', '21.png', '62');
INSERT INTO `list_product` VALUES (NULL, '荣耀20i', '22.png', '65');
INSERT INTO `list_product` VALUES (NULL, '荣耀V20', '23.png', '68');
INSERT INTO `list_product` VALUES (NULL, '荣耀Magic2', '24.png', '71');
INSERT INTO `list_product` VALUES (NULL, '荣耀8X', '25.png', '74');
INSERT INTO `list_product` VALUES (NULL, '荣耀10青春版', '26.png', '77');
INSERT INTO `list_product` VALUES (NULL, '荣耀10', '27.png', '80');
INSERT INTO `list_product` VALUES (NULL, '荣耀V10', '28.png', '28');
INSERT INTO `list_product` VALUES (NULL, '荣耀Play', '29.png', '29');
INSERT INTO `list_product` VALUES (NULL, '荣耀Note 10', '30.png', '30');
INSERT INTO `list_product` VALUES (NULL, '荣耀8X Max', '31.png', '31');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩8C', '32.png', '32');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩8A', '33.png', '33');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩7', '34.png', '34');
INSERT INTO `list_product` VALUES (NULL, '荣耀Magic2', '35.png', '35');
INSERT INTO `list_product` VALUES (NULL, '荣耀10', '36.png', '36');
INSERT INTO `list_product` VALUES (NULL, '荣耀8X', '37.png', '37');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook X Pro 2', '38.png', '38');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook 14', '39.png', '39');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook E 201', '40.png', '40');
INSERT INTO `list_product` VALUES (NULL, '荣耀MagicBook 2019 锐龙版', '41.png', '41');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook 13', '42.png', '42');
INSERT INTO `list_product` VALUES (NULL, '荣耀MagicBook', '43.png', '43');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook X', '44.png', '44');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook D', '45.png', '45');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI MateBook E', '46.png', '46');
INSERT INTO `list_product` VALUES (NULL, '华为平板 M5 青春版', '47.png', '47');
INSERT INTO `list_product` VALUES (NULL, '荣耀平板5 8英寸', '48.png', '48');
INSERT INTO `list_product` VALUES (NULL, '荣耀Waterplay 8英寸', '49.png', '49');
INSERT INTO `list_product` VALUES (NULL, '华为平板 M5 青春版 10.1英', '50.png', '50');
INSERT INTO `list_product` VALUES (NULL, '华为畅享平板 10.1英寸', '51.png', '51');
INSERT INTO `list_product` VALUES (NULL, '荣耀平板5 10.1英寸', '52.png', '52');
INSERT INTO `list_product` VALUES (NULL, '华为平板 M5 8.4英寸', '53.png', '53');
INSERT INTO `list_product` VALUES (NULL, '华为平板 M5 10.8英寸', '54.png', '54');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩平板2 9.6英寸', '55.png', '55');
INSERT INTO `list_product` VALUES (NULL, '荣耀Waterplay 10.1英寸', '56.png', '56');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩平板2 7英寸', '57.png', '57');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩平板2 8英寸', '58.png', '58');
INSERT INTO `list_product` VALUES (NULL, '笔记本配件', '59.png', '59');
INSERT INTO `list_product` VALUES (NULL, '华为手环 3', '60.png', '60');
INSERT INTO `list_product` VALUES (NULL, '荣耀手环4 标准版', '61.png', '61');
INSERT INTO `list_product` VALUES (NULL, '华为手环 3 Pro', '62.png', '62');
INSERT INTO `list_product` VALUES (NULL, '华为手环 3e', '63.png', '63');
INSERT INTO `list_product` VALUES (NULL, '荣耀手环4 Running版', '64.png', '64');
INSERT INTO `list_product` VALUES (NULL, '华为手环B3 青春版', '65.png', '65');
INSERT INTO `list_product` VALUES (NULL, '荣耀手环3', '66.png', '66');
INSERT INTO `list_product` VALUES (NULL, '华为手环 B5', '67.png', '67');
INSERT INTO `list_product` VALUES (NULL, '荣耀畅玩手环 A2', '68.png', '68');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI WATCH GT', '69.png', '69');
INSERT INTO `list_product` VALUES (NULL, '荣耀手表梦幻系列', '70.png', '70');
INSERT INTO `list_product` VALUES (NULL, '华为儿童手表 3', '71.png', '71');
INSERT INTO `list_product` VALUES (NULL, '荣耀手表', '72.png', '72');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI WATCH GT', '73.png', '73');
INSERT INTO `list_product` VALUES (NULL, '荣耀小K2', '74.png', '74');
INSERT INTO `list_product` VALUES (NULL, '华为儿童手表 3 Pro', '75.png', '75');
INSERT INTO `list_product` VALUES (NULL, 'PORSCHE DESIGN | HU', '76.png', '76');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI WATCH 2 Pro', '77.png', '77');
INSERT INTO `list_product` VALUES (NULL, 'HUAWEI WATCH 2', '78.png', '78');
INSERT INTO `list_product` VALUES (NULL, '路由器', '79.png', '79');
INSERT INTO `list_product` VALUES (NULL, '子母/分布式路由', '80.png', '80');
INSERT INTO `list_product` VALUES (NULL, '电力猫/wifi放大器', '81.png', '81');
INSERT INTO `list_product` VALUES (NULL, '随行wifi', '82.png', '82');
INSERT INTO `list_product` VALUES (NULL, '电视盒子', '83.png', '83');


#创建产品图片表product_pic
DROP TABLE IF EXISTS `product_pic`;
CREATE TABLE `product_pic`(
  `pid` int(11) default NULL,
  `pic` varchar(128) default NULL
);

INSERT INTO `product_pic` VALUES ('1','428_428_1526955717705mp.jpg');

#购物车表cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid` int(11) NOT NULL PRIMARY KEY auto_increment,
  `uid` int(11) default NULL,
  `pid` int(11) default NULL,
  `count` int(11) default NULL
);

#用户信息表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL PRIMARY KEY auto_increment,
  `uname` varchar(32) default NULL,
  `upwd` varchar(32) default NULL
);
INSERT INTO `user` VALUES ('1','tom123',123456);

