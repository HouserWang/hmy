create table bbs_give_like
(
	id int(50) auto_increment
		primary key,
	topicId int(50) not null comment '帖子id',
	userId int(50) not null comment '用户id',
	likeState tinyint default '1' not null comment '点赞状态：0为取消赞，1为点赞，默认为0',
	constraint bbs_give_like_uk
		unique (topicId, userId)
)
comment '点赞表' engine=InnoDB
;

create table bbs_message
(
	messageId int(10) auto_increment comment '留言id'
		primary key,
	content varchar(5000) not null comment '内容',
	addIp varchar(20) not null comment '标题',
	time datetime not null comment '留言时间'
)
engine=InnoDB charset=utf8
;

create table bbs_model
(
	modelId int(10) auto_increment comment '模块id'
		primary key,
	modelName varchar(20) not null comment '模块名字',
	postsCount int(255) default '0' not null comment '帖子总数',
	modelDate date not null comment '创建日期'
)
engine=InnoDB charset=utf8
;

create table bbs_notice
(
	noticeId int(50) auto_increment
		primary key,
	noticeDate datetime not null,
	notice varchar(200) not null,
	noticeMan varchar(18) not null
)
engine=InnoDB charset=utf8
;

create table bbs_reply
(
	replyId int(50) auto_increment comment '回复id'
		primary key,
	replyContent varchar(5000) not null comment '回复内容',
	topicId int(10) not null comment '回复的帖子id',
	userId int(50) not null comment '回复人',
	replyTime timestamp default CURRENT_TIMESTAMP not null comment '回复日期'
)
engine=InnoDB charset=utf8
;

create table maple.bbs_topic
(
	topicId int(10) auto_increment comment '帖子id'
		primary key,
	title varchar(128) not null comment '标题',
	content varchar(10000) not null comment '内容',
	postDate datetime not null comment '发表日期',
	userId int(50) not null comment '发帖人',
	modelId int(10) not null comment '所在板块id',
	replyCount int(255) default '0' not null comment '回复次数',
	userName varchar(128) null comment '发帖人名字',
	likeCount int default '0' null comment '点赞量'
)
;

create table maple.bbs_user
(
	userId int(50) auto_increment comment '用户id'
		primary key,
	userName varchar(40) not null comment '用户名',
	userPassword varchar(80) not null comment '密码',
	userSex varchar(40) null comment '性别',
	email varchar(100) not null comment 'email',
	regDate date not null comment '注册日期',
	role int(10) default '2' not null comment '角色状态',
	imageAddr varchar(255) default '/images/timg.jpg' null comment '头像',
	postCount int(255) default '0' not null comment '发帖数',
	integral int(255) default '0' not null comment '积分'
)
;



