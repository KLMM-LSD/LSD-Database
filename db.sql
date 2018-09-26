DROP DATABASE IF EXISTS lsd;
CREATE DATABASE lsd;

USE lsd;

CREATE TABLE users (
	userid		INT NOT NULL AUTO_INCREMENT,
	usertype	ENUM ("admin", "user", "banned") NOT NULL DEFAULT "user",
	usertimestamp	BIGINT NOT NULL,

	username	VARCHAR (30) NOT NULL UNIQUE,
	userpassword	VARCHAR (30) NOT NULL,
	userabout	VARCHAR (200),

	PRIMARY KEY (userid)
);

CREATE TABLE posts (
	postid		INT NOT NULL AUTO_INCREMENT,
	posttype	ENUM ("reply", "thread") NOT NULL,
	postparentid	INT DEFAULT -1,
	posttimestamp	BIGINT NOT NULL,
	postauthorid	INT NOT NULL,
	postthreadid	INT DEFAULT -1,

	postcontent	VARCHAR (1000) NOT NULL,

	PRIMARY KEY (postid)
);

CREATE TABLE ratings (
	ratingid	INT NOT NULL AUTO_INCREMENT,
	ratingauthorid	INT NOT NULL,
	ratingvalue	INT NOT NULL,
	ratingpostid	INT NOT NULL,

	PRIMARY KEY (ratingid)
);

