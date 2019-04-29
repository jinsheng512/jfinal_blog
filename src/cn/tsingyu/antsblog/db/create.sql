CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL COMMENT '文章分类id,对应category的id',
  `title` varchar(45) DEFAULT NULL COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `createTime` datetime DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `createUserName` varchar(45) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateUserId` int(11) DEFAULT NULL,
  `updateUserName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL COMMENT '用户名',
  `pwd` varchar(100) NOT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '注册邮箱',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `role` int(1) NOT NULL COMMENT '角色',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像，只存储middle大小的，large和small通过字符串替换获得',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objCode` tinyint(4) DEFAULT NULL COMMENT '评论对象编码：1，文章；',
  `objId` int(11) DEFAULT NULL COMMENT '评论对象id',
  `pid` int(11) DEFAULT '0' COMMENT '上级评论id',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createUserId` int(11) DEFAULT NULL COMMENT '创建者id',
  `createUserName` varchar(45) DEFAULT NULL COMMENT '创建者名称',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `updateUserId` int(11) DEFAULT NULL COMMENT '更新者id',
  `updateUserName` varchar(45) DEFAULT NULL COMMENT '更新者名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论表';