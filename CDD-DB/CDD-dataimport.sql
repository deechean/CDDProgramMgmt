INSERT INTO cdd.t_user
(name, phone, email, status)
VALUES
('Xu Lan', '+8617434552312', 'lan.xu@hp.com','A'),
('Zhou Haitang', '+8618017605335', 'haitang.zhou@hp.com','A'),
('Chen William','+8617714235910','william.chen@hp.com','A'),
('Xue Jie(Jessie)','+8613643355221','jessie.xue@hp.com','A'),
('Liu Jiajia','+8613566226688','jiajia.liu@hp.com','A'),
('Zhang Liang(Ben)','+8618718865662','liang.zhang@hp.com','A'),
('Cui Leo','+861776677655225','leo.cui@hp.com','A'),
('Wang Lin','+8618618866009','lin.wang@hp.com','A'),
('Chen Ann','+8618817405200','ann.chen@hp.com','I');

INSERT INTO cdd.dic_productline
(name, status)
VALUES('1D','A'),
('8A','A'),
('2B','I'),
('2Q','I'),
('PQ','A');

INSERT INTO cdd.dic_programstatus
(statuscode, name, color )
VALUES('A','Active','#EE493F'),
('C','Completed','#0099A9'),
('I','Archieved','#A6A6A6');

INSERT INTO cdd.t_programinfo
(programname, programowner, introdate, regularsubmitaldate, plcde, status)
VALUES ('AZNP ULT','1','2019-10-01 00:00:00','2019-06-18 00:00:00','1','A'),
('Mogami&Teton','1','2019-06-01 00:00:00','2019-04-12 00:00:00','2','C'),
('Star',3,'2014-10-01 00:00:00','2014-02-10 00:00:00',4,'I'),
('Stella',3,'2014-10-01 00:00:00','2014-02-10 00:00:00',4,'I'),
('Seagull',5,'2017-05-01 00:00:00','2017-01-15 00:00:00',3,'C'),
('Swan',5,'2017-09-01 00:00:00','2017-06-10 00:00:00',4,'C'),
('Clearwater',8,'2019-06-01 00:00:00','2019-04-12 00:00:00',2,'A'),
('Shimento',8,'2019-06-01 00:00:00','2019-04-12 00:00:00',2,'A'),
('Dorado',8,'2017-04-01 00:00:00','2017-01-05 00:00:00',2,'C');

INSERT INTO cdd.t_userwatch
(userid, programid)
VALUES(1,2),
(2,1),
(1,3),
(1,4),
(2,3),
(2,4),
(3,5),
(3,6),
(3,7),
(4,2),
(4,3),
(4,5),
(5,2),
(5,3),
(6,2),
(6,3),
(6,4),
(6,6),
(7,5),
(7,6),
(7,7),
(7,8),
(8,1);

INSERT INTO cdd.dic_fieldtype (`desc`, `status`)
VALUES ('text ','A'),
('list_single ','A'),
('list_multiple ','A'),
('user_single','A'),
('user_multiple','A'),
('long desc ','A');

INSERT INTO cdd.dic_field 
(fieldname, fieldtypeid, category, status)
VALUES('Dev Manager', 4, '', 'A'),
('Loc Manager',4,'','A'),
('FW Platform',2,'','A'),
('Product Category',2,'','A'),
('Other Desc',6, '','A');

INSERT INTO cdd.dic_listvalue
(name, fieldid, status)
VALUES('Phoenix',3,'A'),
('Jedi',3,'A'),
('SOL',3,'A'),
('Dune',3,'A'),
('Mono-SFP',4,'A'),
('Mono-MFP',4,'A'),
('Color-SFP',4,'A'),
('Color-MFP',4,'A'),
('OTHER',5,'A'),
('Marvel',3,'A');

/*1 - Dev Manager
  2 - Loc Manager
  3 - FW Platform (1 - Phoenix, 2 - Jedi, 3 - SOL, 4 - Dune, 10 - Marvel)
  4 - Program Category (5 - Mono-SFP, 6 - Mono-MFP, 7 - Color-SFP, 8 - Color-MFP, 9 - OTHER)
  5 - Other Desc */
INSERT INTO cdd.t_field_value
(`programid`, `fieldid`, `value`)
VALUES(1,1,1),
(1,2,2),
(1,3,1),
(1,4,9),
(1,5,'Aurora, Zenith, Nile, Pyramid'),
(2,1,1),
(2,2,2),
(2,3,1),
(2,4,5),
(2,5,'Mogami'),
(3,1,4),
(3,2,2),
(3,3,10),
(3,4,6),
(3,5,'Star'),
(4,1,4),
(4,2,2),
(4,3,10),
(4,4,8),
(4,5,'Stella'),
(5,1,5),
(5,2,4),
(5,3,10),
(5,4,5),
(5,5,'Seagull'),
(6,1,5),
(6,2,4),
(6,3,10),
(6,4,6),
(6,5,'Swan'),
(7,1,8),
(7,2,4),
(7,3,3),
(7,4,8),
(7,5,'Clearwater'),
(8,1,8),
(8,2,4),
(8,3,3),
(8,4,7),
(8,5,'Shimento'),
(9,1,8),
(9,2,6),
(9,3,1),
(9,4,5),
(9,5,'Dorado');


INSERT INTO dic_teamrole
(`desc`)
VALUES('owner'),('member'); 

INSERT INTO t_teammember 
(projectid, userid,roleid, joinedtime, endtime, status)
VALUES(1,1,1,null,null,'A'),(1,2,2,null,null,'A'),(1,3,2,null,null,'A'),(1,6,2,null,null,'A'),
(2,1,1,null,null,'A'),(2,2,2,null,null,'A'),(2,4,2,null,null,'A'),(2,7,2,null,null,'A'),
(3,3,1,null,null,'A'),(3,1,2,null,null,'A'),(3,7,2,null,null,'A'),
(4,3,1,null,null,'A'),(4,2,2,null,null,'A'),(4,6,2,null,null,'A'),(4,7,2,null,null,'A'),(4,8,2,null,null,'A'),
(5,5,1,null,null,'A'),(5,2,2,null,null,'A'),(5,7,2,null,null,'A'),
(6,5,1,null,null,'A'),(6,7,2,null,null,'A'),
(7,8,1,null,null,'A'),(7,2,2,null,null,'A'),(7,4,2,null,null,'A'),
(8,8,1,null,null,'A'),(8,5,2,null,null,'A'),
(9,8,1,null,null,'A');