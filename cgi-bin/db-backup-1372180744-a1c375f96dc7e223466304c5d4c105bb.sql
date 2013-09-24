DROP TABLE auth_group;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO auth_group VALUES("1","Teacher");
INSERT INTO auth_group VALUES("2","Admin");



DROP TABLE auth_group_permissions;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;




DROP TABLE auth_permission;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO auth_permission VALUES("1","Can add permission","1","add_permission");
INSERT INTO auth_permission VALUES("2","Can change permission","1","change_permission");
INSERT INTO auth_permission VALUES("3","Can delete permission","1","delete_permission");
INSERT INTO auth_permission VALUES("4","Can add group","2","add_group");
INSERT INTO auth_permission VALUES("5","Can change group","2","change_group");
INSERT INTO auth_permission VALUES("6","Can delete group","2","delete_group");
INSERT INTO auth_permission VALUES("7","Can add user","3","add_user");
INSERT INTO auth_permission VALUES("8","Can change user","3","change_user");
INSERT INTO auth_permission VALUES("9","Can delete user","3","delete_user");
INSERT INTO auth_permission VALUES("10","Can add content type","4","add_contenttype");
INSERT INTO auth_permission VALUES("11","Can change content type","4","change_contenttype");
INSERT INTO auth_permission VALUES("12","Can delete content type","4","delete_contenttype");
INSERT INTO auth_permission VALUES("13","Can add session","5","add_session");
INSERT INTO auth_permission VALUES("14","Can change session","5","change_session");
INSERT INTO auth_permission VALUES("15","Can delete session","5","delete_session");
INSERT INTO auth_permission VALUES("16","Can add site","6","add_site");
INSERT INTO auth_permission VALUES("17","Can change site","6","change_site");
INSERT INTO auth_permission VALUES("18","Can delete site","6","delete_site");
INSERT INTO auth_permission VALUES("19","Can add log entry","7","add_logentry");
INSERT INTO auth_permission VALUES("20","Can change log entry","7","change_logentry");
INSERT INTO auth_permission VALUES("21","Can delete log entry","7","delete_logentry");
INSERT INTO auth_permission VALUES("22","Can add student","8","add_student");
INSERT INTO auth_permission VALUES("23","Can change student","8","change_student");
INSERT INTO auth_permission VALUES("24","Can delete student","8","delete_student");
INSERT INTO auth_permission VALUES("25","Can add teacher","9","add_teacher");
INSERT INTO auth_permission VALUES("26","Can change teacher","9","change_teacher");
INSERT INTO auth_permission VALUES("27","Can delete teacher","9","delete_teacher");
INSERT INTO auth_permission VALUES("28","Can add class","10","add_class");
INSERT INTO auth_permission VALUES("29","Can change class","10","change_class");
INSERT INTO auth_permission VALUES("30","Can delete class","10","delete_class");
INSERT INTO auth_permission VALUES("31","Can add lesson","11","add_lesson");
INSERT INTO auth_permission VALUES("32","Can change lesson","11","change_lesson");
INSERT INTO auth_permission VALUES("33","Can delete lesson","11","delete_lesson");



DROP TABLE auth_user;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE latin1_general_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `first_name` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `last_name` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(75) COLLATE latin1_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO auth_user VALUES("1","pbkdf2_sha256$10000$TmOCzfSaYy6y$wBZXZ4hGqkd+sLmyZRA5f3hlszXzBeTX7F98BZ70048=","2013-06-24 00:02:55","1","l3370x","","","l3370@gmail.com","1","1","2013-06-23 23:57:45");
INSERT INTO auth_user VALUES("2","pbkdf2_sha256$10000$UHRWosONVco8$yt/MLWkrm7igui7yHDoF9I9TOuIP71nUa4m49jYitOc=","2013-06-25 17:09:19","1","rick","","","","1","1","2013-06-24 00:02:26");
INSERT INTO auth_user VALUES("4","pbkdf2_sha256$10000$E2K75EyG0Ghc$k43Ry23HiP7BQr2Evhs+GMpd8CBd9FG+qvszXRRbLmI=","2013-06-24 22:30:36","0","mark","","","J@test.com","0","1","2013-06-24 00:19:33");
INSERT INTO auth_user VALUES("5","pbkdf2_sha256$10000$qPim7ONnPLSg$c79UfK0K2n3OliRMAOkPD3vimvy+qz8Pd9e9xf+OHYk=","2013-06-24 00:20:55","0","john","","","J2@test.com","0","1","2013-06-24 00:20:55");
INSERT INTO auth_user VALUES("6","pbkdf2_sha256$10000$aQfrzTKI5bXj$tcN/1cpca87+GXL6z/WMVzYltYBg93oFZMEZAkQ2/fQ=","2013-06-25 15:54:12","0","joejoe","","","joe@bluemoonscience.com","0","1","2013-06-25 06:16:03");



DROP TABLE auth_user_groups;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO auth_user_groups VALUES("1","2","1");
INSERT INTO auth_user_groups VALUES("2","2","2");
INSERT INTO auth_user_groups VALUES("3","1","2");



DROP TABLE auth_user_user_permissions;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;




DROP TABLE course_class;

CREATE TABLE `course_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_title` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `calendar_url` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `notes` longtext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO course_class VALUES("1","Forensics","","");
INSERT INTO course_class VALUES("2","8th Grade Science","","Why do I have notes here?????");
INSERT INTO course_class VALUES("3","Life Science","","");
INSERT INTO course_class VALUES("4","Earth Science","","");



DROP TABLE django_admin_log;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE latin1_general_ci,
  `object_repr` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO django_admin_log VALUES("1","2013-06-24 00:02:26","1","3","2","rick","1","");
INSERT INTO django_admin_log VALUES("2","2013-06-24 00:03:56","1","3","3","rick2","1","");
INSERT INTO django_admin_log VALUES("3","2013-06-24 00:05:30","1","2","1","Teacher","1","");
INSERT INTO django_admin_log VALUES("4","2013-06-24 00:05:35","1","2","2","Admin","1","");
INSERT INTO django_admin_log VALUES("5","2013-06-24 00:05:50","1","3","2","rick","2","Changed password, is_staff, is_superuser and groups.");
INSERT INTO django_admin_log VALUES("6","2013-06-24 00:06:01","1","3","1","l3370x","2","Changed password and groups.");



DROP TABLE django_content_type;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `app_label` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `model` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO django_content_type VALUES("1","permission","auth","permission");
INSERT INTO django_content_type VALUES("2","group","auth","group");
INSERT INTO django_content_type VALUES("3","user","auth","user");
INSERT INTO django_content_type VALUES("4","content type","contenttypes","contenttype");
INSERT INTO django_content_type VALUES("5","session","sessions","session");
INSERT INTO django_content_type VALUES("6","site","sites","site");
INSERT INTO django_content_type VALUES("7","log entry","admin","logentry");
INSERT INTO django_content_type VALUES("8","student","student","student");
INSERT INTO django_content_type VALUES("9","teacher","teacher","teacher");
INSERT INTO django_content_type VALUES("10","class","course","class");
INSERT INTO django_content_type VALUES("11","lesson","lesson","lesson");



DROP TABLE django_session;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `session_data` longtext COLLATE latin1_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO django_session VALUES("j7843srtmpfubjg1wgwcdq0w9gdme68b","YzI1M2FiYzlkYjM5OTUxOTQyOGQwYWE1Mzc0Y2EwNDkwY2MzZjA1MDqAAn1xAS4=","2013-07-08 00:01:58");
INSERT INTO django_session VALUES("v3n03cm7bt2bjt9q07tsw0ytuayjik83","YzI1M2FiYzlkYjM5OTUxOTQyOGQwYWE1Mzc0Y2EwNDkwY2MzZjA1MDqAAn1xAS4=","2013-07-08 00:02:45");
INSERT INTO django_session VALUES("2ej5icsu9puzb6a1uyzaq9qgad7hw83h","YzI1M2FiYzlkYjM5OTUxOTQyOGQwYWE1Mzc0Y2EwNDkwY2MzZjA1MDqAAn1xAS4=","2013-07-08 00:57:43");
INSERT INTO django_session VALUES("5d5tf01eofl9y8mz0h0zjv6ahnqafxgr","ZmVlYjlmOGViZWI2ZWE3NDNlZmFlOGNiNjVmNDhhMDRkYTc2ZTkzNTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==","2013-07-09 17:09:19");
INSERT INTO django_session VALUES("e0gzorzl83pzwz0xtxwhdjjoffyf8gfr","MDNjNGJmOTUyZjhlY2ExOTcyM2VjZjM5YmYyZDQyNWM2NDNlOTIyNDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQZ1Lg==","2013-07-09 15:54:12");
INSERT INTO django_session VALUES("hz582rid1kd74ognuualoci3vdclh5sl","MWRhYzhmYjUzOGEyYWY1OTdmNDA4YTUxMTlmMzcwMmU0ZmNlZWVkOTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQR1Lg==","2013-07-08 22:22:00");



DROP TABLE django_site;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO django_site VALUES("1","example.com","example.com");



DROP TABLE lesson_lesson;

CREATE TABLE `lesson_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `htmlStuff` longtext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO lesson_lesson VALUES("1","First Lesson","2013-06-26","<p><iframe src=\"http://www.youtube.com/embed/s0PzrJM_IO0\" width=\"425\" height=\"350\"></iframe></p>\n<p>Science Bob!</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>More Text</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Something else.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Blah blah blah.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Working</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>scrolling.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>This is a big html file.</p>");
INSERT INTO lesson_lesson VALUES("2","The Moon","2013-06-24","");
INSERT INTO lesson_lesson VALUES("3","Scientist & Engineers / Designers","2013-01-01","<p><strong>Scientists versus Engineers and Designers</strong></p>\n<ul>\n<li>Scientists seek understanding about the natural world - they focus on ideas, hypotheses, theories and conducting experiments.<br /><br /></li>\n<li>Engineers and designers use science to find solutions to real world problems - they focus on designing and building things that solve real problems.</li>\n</ul>");
INSERT INTO lesson_lesson VALUES("4","Open & Closed Systems","2013-01-01","<p><strong>Systems - Open Systems &amp; Closed Systems</strong></p>\n<ul>\n<li>Everything is part of a \"System\" - examples of systems are a person, a garden, a planet or a school.<br /><br /></li>\n<li>The output of one system can become the input of another system. The output of a cow can become the input of a garden...<br /><br /></li>\n<li>In an Open System matter can flow into and out of the system. A person is an Open System. A garden is an Open System.<br /><br /></li>\n<li>The ocean is an Open System. A car is an Open System.<br /><br /></li>\n<li>In a Closed System matter can NOT flow into and out of the system. A rock is a Closed System.<br /><br /></li>\n<li>Matter may circulate (move around) in a closed system, but it may not enter or leave.</li>\n<li>Energy can flow into and out of BOTH Open and Closed Systems.&nbsp;<br /><br /></li>\n<li>Energy is the ONLY thing that can go in and out of a Closed System.&nbsp;<br /><br /></li>\n<li>A rock is a Closed System but it can get energy (heat) from the sun and then lose that energy</li>\n</ul>");
INSERT INTO lesson_lesson VALUES("5","Scientific Investigation","2013-01-01","<p><strong>Investigative Question - </strong>the question that you want to answer.</p>\n<p>&nbsp;</p>\n<p>&nbsp;<strong>Know the Parts of an Experiment!</strong></p>\n<ul>\n<li>&nbsp;&nbsp;&nbsp; Create a <strong>Hypothesis</strong> - predict what will happen</li>\n<li>&nbsp;&nbsp;&nbsp; Identify at least one <strong>Control Variable</strong> - the things you keep the same</li>\n<li>&nbsp;&nbsp;&nbsp; Pick ONE <strong>Manipulated (independent) Variable</strong> - the thing you change</li>\n<li>&nbsp;&nbsp;&nbsp; Identify ONE <strong>Responding (dependent) Variable</strong> - the thing you measure</li>\n<li><strong>&nbsp;&nbsp;&nbsp; Procedures</strong> - list all the steps in <strong>numbered order - step 1, step 2, step 3, etc.</strong></li>\n<li>&nbsp;&nbsp;&nbsp; Do <strong>Multiple Trials - </strong>at least three</li>\n<li><strong>&nbsp;&nbsp;&nbsp; Collect Data</strong> - Analyze the Data</li>\n<li><strong>&nbsp;&nbsp;&nbsp; Report your Results</strong></li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>Know the Types of Variables!</strong></p>\n<ul>\n<li><strong>&nbsp;&nbsp;&nbsp; Responding</strong> &ndash; the thing you measure</li>\n<li><strong>&nbsp;&nbsp;&nbsp; Control </strong>&ndash; the things that stay the same</li>\n<li><strong>&nbsp;&nbsp;&nbsp; Manipulated</strong>&nbsp; &ndash; the ONE thing you change</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>Know how to write a Conclusion!</strong></p>\n<ul>\n<li>Answer the Investigative Question</li>\n<li>State if your Hypothesis was correct or incorrect</li>\n<li>Use Data (numbers) to explain exactly what happened</li>\n<li>Re-summarize your results in a concluding sentence</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>Know the Common Types of Data Evaluation!</strong></p>\n<ul>\n<li><strong>Median</strong> &ndash; the middle number</li>\n<li><strong>Mean</strong> &ndash; the average number</li>\n<li><strong>Mode</strong> &ndash; the most common number reported</li>\n</ul>");
INSERT INTO lesson_lesson VALUES("6","Matter","2013-01-01","<p><strong>Matter </strong></p>\n<p>&nbsp;</p>\n<p><strong>Atoms</strong> - all <em>matter</em> is made of <em>atoms</em>.&nbsp; Atoms are the basic &ldquo;building block&rdquo; of the universe.</p>\n<p>&nbsp;</p>\n<p><strong>Elements</strong><em> are matter</em> made of only one type of <em>atom</em>.&nbsp; Oxygen is an element.&nbsp; Carbon is an element.&nbsp; Anything listed on the Periodic chart is an Element.</p>\n<p>&nbsp;</p>\n<p><strong>Mixtures</strong> are combinations of substances that DO NOT chemically combine.&nbsp; Mud is a mixture of dirt and water.&nbsp; A jar of different types of rocks is a mixture.&nbsp; Mixtures can be separated.</p>\n<p>&nbsp;</p>\n<p><strong>Compounds </strong>are substances that are chemically bound together in well-defined <em>molecules</em> and have different physical and <em>chemical properties</em> from the reacting substances. Salt is a compound - NACl.&nbsp; The Sodium and Chloride chemically combine to form something new and different.</p>\n<p>&nbsp;</p>\n<p><strong>Solids, Liquids, and Gases</strong> differ in the <em>motion</em> of individual particles.</p>\n<ul>\n<li>In <strong><em>solids</em></strong>, particles are packed in a nearly rigid structure - vibrate in place</li>\n<li>in <strong><em>liquids</em></strong>, particles move around one another - vibrate rapidly and move around but stay close to one another</li>\n<li>in <strong><em>gases</em></strong>, particles move almost independently - vibrate VERY fast and space out as far as possible from one another</li>\n</ul>\n<p>&nbsp;</p>\n<p>All substances have <strong>characteristic intrinsic properties</strong> such as <strong>density, solubility, boiling point, and melting point</strong>. These \"built in\" properties never change!&nbsp; For example: Water <strong>always</strong> boils at 100 degrees Celsius. Gold <strong>always</strong> melts at 1064 degrees Celsius.&nbsp; The density of lead is <strong>always</strong> 11.34 grams / centimeter cubed.</p>\n<p>&nbsp;</p>\n<p><strong>Physical and Chemical Changes</strong></p>\n<p>Physical Changes: glass breaking, water boiling, melting a piece of metal</p>\n<p>Chemical Changes: vinegar and baking soda react to produce a gas, iron rusting, baking a cake, lighting a match</p>");
INSERT INTO lesson_lesson VALUES("7","Speed Distance Time","2013-01-01","<p><strong>Speed, Distance &amp; Time - Know the DST Triangle!&nbsp; </strong></p>\n<p><strong>&nbsp;<img src=\"c:/@KPMS/carat/DST\" alt=\"\" /></strong></p>\n<p>Cover the corner you want to know with your finger&hellip; the formula is the remaining letters.</p>\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>\n<ul>\n<li>Distance = Speed * Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Speed = Distance/Time&nbsp;&nbsp;&nbsp;&nbsp; Time = Distance/Speed</li>\n<li><em>Average speed</em> is defined as the distance traveled in a given period of time.</li>\n<li>A toy car goes 20 meters in 5 seconds - What is the average speed?&nbsp; Answer = 20 meters/5 sec. = 4 meters per sec.&nbsp;</li>\n<li>A boy runs 10 miles in 2 hours - What is the average speed?&nbsp; Answer = 10 miles/2 hours = 5 mph.</li>\n<li>A girl runs 14 miles at 7 mph &ndash; How long did she run?&nbsp; Answer = 14 miles/7 mph = 2 hours.</li>\n<li>A car goes 50 mph for 3 hours - What is the distance traveled?&nbsp; Answer = 50 mph * 3 hours = 150 miles&nbsp;</li>\n</ul>");



DROP TABLE lesson_lesson_classes;

CREATE TABLE `lesson_lesson_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_id` (`lesson_id`,`class_id`),
  KEY `lesson_lesson_classes_37003e55` (`lesson_id`),
  KEY `lesson_lesson_classes_39812925` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO lesson_lesson_classes VALUES("1","1","1");
INSERT INTO lesson_lesson_classes VALUES("2","2","1");
INSERT INTO lesson_lesson_classes VALUES("3","3","2");
INSERT INTO lesson_lesson_classes VALUES("4","4","2");
INSERT INTO lesson_lesson_classes VALUES("5","5","2");
INSERT INTO lesson_lesson_classes VALUES("6","6","2");
INSERT INTO lesson_lesson_classes VALUES("7","7","2");



DROP TABLE student_student;

CREATE TABLE `student_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(75) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_student_6340c63c` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO student_student VALUES("1","4","Markus","Test","J@test.com");
INSERT INTO student_student VALUES("2","5","John","Test","J2@test.com");
INSERT INTO student_student VALUES("3","6","Joe","Johnson","joe@bluemoonscience.com");



DROP TABLE student_student_classes;

CREATE TABLE `student_student_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`class_id`),
  KEY `student_student_classes_94741166` (`student_id`),
  KEY `student_student_classes_39812925` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO student_student_classes VALUES("3","1","2");
INSERT INTO student_student_classes VALUES("2","3","2");
INSERT INTO student_student_classes VALUES("4","2","2");



DROP TABLE teacher_teacher;

CREATE TABLE `teacher_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(75) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_teacher_6340c63c` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO teacher_teacher VALUES("1","2","Richard","Miller","rick@calmriver.com");



