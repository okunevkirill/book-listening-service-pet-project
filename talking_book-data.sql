USE talking_book;
# ====================================================================================================
--
-- Dumping data for table publishers
--
INSERT INTO publishers (publisher_name)
VALUES
    ('Эксмо'),
    ('Вильямс'),
    ('Юрайт'),
    ('КноРус'),
    ('Аванта'),
    ('Азбука'),
    ('Арка'),
    ('Белый Город'),
    ('Вече'),
    ('Дрофа'),
    ('Олма-Пресс'),
    ('РОСМЭН'),
    ('Текст'),
    ('ЭНАС'),
    ('Самиздат');


--
-- Dumping data for table audiobooks
--

INSERT INTO audiobooks (audiobook_id,title_name,release_year,description,cover,audio_quality,body_audio,body_text,audio_size,raiting_age,created_at,updated_at)
VALUES
    (1,'Властелин колец',1971,'{"key1": "value1", "key2": "value2"}','http://lorempixel.com/640/480/','9','185','Id ducimus quisquam qui aspernatur temporibus voluptatibus. Cum voluptatibus quas aut quis ex aspernatur assumenda nihil. Minus maiores expedita qui aut et.',6545,'6+','1985-05-23 16:13:11','1981-05-03 21:45:13'),
    (2,'Гордость и предубеждение',1981,NULL,'http://lorempixel.com/640/480/','9','494','Id totam qui minus facere aut sed repellendus. Aut voluptatibus saepe voluptas vero. Assumenda corporis vel necessitatibus provident reprehenderit et repellendus.',60185,'16+','1974-02-13 17:53:27','2009-04-12 22:52:02'),
    (3,'Автостопом по галактике',2014,NULL,'http://lorempixel.com/640/480/','6','007','Dolore voluptate id esse aliquid unde. Repudiandae est animi sed facere ad tenetur.',91898,'16+','1997-02-08 21:56:55','1985-08-30 18:56:45'),
    (4,'Гарри Поттер и Кубок огня',2001,'{"Квидич": "снитч", "Метла": "Нимбус"}','http://lorempixel.com/640/480/','6','572','Fugiat est commodi nulla dolor ab. Possimus est magni asperiores ipsum libero et. Molestiae itaque eveniet quas non est.',680740,'16+','2013-06-27 05:18:34','2014-10-10 23:46:34'),
    (5,'Убить пересмешника',1985,NULL,'http://lorempixel.com/640/480/','7','302','Dolorem ea consequatur aut impedit labore sed. Beatae sint enim quia maiores unde at. In velit labore repudiandae sint. Ad sint consectetur omnis provident consequatur voluptatem veritatis.',89032,'18+','1980-02-01 23:09:51','2019-06-17 23:08:11'),
    (6,'Винни Пух',1981,NULL,'http://lorempixel.com/640/480/','2','117','Mollitia exercitationem eum magni quia ab iusto sit voluptatum. Inventore architecto recusandae illum assumenda. Fugit dolorem aut odio eligendi qui exercitationem. Similique consequatur enim voluptatem eius et. Maxime qui ipsa nisi culpa quos.',679984,'0+','2008-01-13 01:31:00','1977-02-14 06:23:20'),
    (7,'1984',2019,NULL,'http://lorempixel.com/640/480/','9','308','Sit harum maxime non asperiores. Vitae non accusamus error nulla autem. Rerum cum dolores corporis.',794811,'18+','2002-07-11 18:23:57','1981-07-11 16:38:12'),
    (8,'Лев, колдунья и платяной шкаф',2016,NULL,'http://lorempixel.com/640/480/','9','794','Neque nostrum debitis in at atque. Officia aut id ducimus.',767055811,'12+','2000-04-14 00:10:31','1988-08-15 12:47:26'),
    (9,'Джейн Эйр',1978,'{"key13": "Some_Text", "key14": "value2"}','http://lorempixel.com/640/480/','7','331','Sit porro cupiditate eligendi aut alias aut pariatur sint. Adipisci et omnis autem voluptas. Facilis odit non in iste officiis numquam labore expedita.',62,'16+','1970-05-16 11:49:41','1981-01-12 03:25:22'),
    (10,'Капитал',2007,NULL,'http://lorempixel.com/640/480/','3','675','Eius commodi neque magnam odit. Quas sit ullam facilis reiciendis quo. Tempore quia sapiente maiores excepturi odit distinctio aspernatur.',75923482,'6+','1998-02-24 17:08:59','2021-03-18 09:25:19'),
    (11,'Король Лир',1993,NULL,'http://lorempixel.com/640/480/','4','783','Omnis assumenda labore consequatur facere earum iusto magnam reprehenderit. Repellendus dolorem placeat qui nisi.',72,'12+','1996-01-15 08:23:45','1990-01-29 12:46:28'),
    (12,'Паутина Шарлотты',1997,'{"key3": "value3", "key4": "value4"}','http://lorempixel.com/640/480/','9','355','Quae sint exercitationem voluptatem commodi aut odio veritatis. Suscipit voluptate nam inventore autem optio esse. Iste quam rerum nemo facilis.',3,'18+','1998-06-26 05:19:24','1975-05-17 23:12:39'),
    (13,'Вторая мировая война',2010,NULL,'http://lorempixel.com/640/480/','7','952','Voluptatem ipsa deleniti quo molestiae exercitationem ratione beatae. Unde molestias est odit animi voluptatem et. Natus deserunt eligendi quo debitis. Enim qui recusandae cum.',298819,'12+','1985-11-16 00:51:47','1977-05-10 09:22:24'),
    (14,'Маленький принц',2016,NULL,'http://lorempixel.com/640/480/','2','590','Illo eos tempore voluptatem animi aperiam deleniti laboriosam consequuntur. Velit eligendi ut et est libero quia dolor cumque. Aut quam molestias molestiae enim. Veritatis quas autem cupiditate voluptas facilis tenetur enim. Nisi temporibus et consequuntur commodi neque velit.',4232,'6+','1977-04-19 00:49:49','1999-01-14 09:06:22'),
    (15,'Властелин колец',1980,NULL,'http://lorempixel.com/640/480/','2','749','Perspiciatis sed omnis nobis ratione consequatur omnis nemo. Et et sapiente consectetur porro omnis ut quia. Fugit a excepturi sunt sunt optio. Dolores corporis minima accusantium aliquid natus laboriosam ullam. Ut omnis consequuntur facilis ratione.',7568,'16+','1972-10-31 04:29:57','1993-05-15 11:23:15'),
    (16,'Герой нашего времени',1992,NULL,'http://lorempixel.com/640/480/','7','266','Accusantium maiores fugiat quis quo provident maxime est. Et tenetur placeat fugiat aut repellendus non. Et ab quos perferendis aut architecto.',902,'6+','1983-02-21 18:46:08','2014-05-29 01:05:43'),
    (17,'Идиот',1999,NULL,'http://lorempixel.com/640/480/','6','693','Nisi corporis accusamus voluptas consectetur. Eaque odio facere id ab. Sit molestiae libero ut incidunt. Ut vel qui consequatur quod et.',199621475,'0+','1976-05-25 22:42:55','1989-10-03 02:37:13'),
    (18,'Приключения Тома Сойера. Приключения Гекльберри Финна',1998,NULL,'http://lorempixel.com/640/480/','1','951','Inventore quia porro est sint error. Totam accusantium eligendi laborum. Tempore facilis deserunt sint neque qui officiis. Ut necessitatibus distinctio cumque et et quo et doloremque.',620,'0+','1996-04-12 07:50:40','1992-06-12 13:02:30'),
    (19,'Три мушкетера',1987,NULL,'http://lorempixel.com/640/480/','7','085','Omnis blanditiis est et non tenetur. Deserunt quia dicta corporis sint temporibus. Repudiandae est et fuga ipsa sed qui. Culpa molestias impedit omnis suscipit accusamus quam omnis. Dolore dolorem ducimus perspiciatis quam eius sed mollitia.',1,'6+','2012-04-01 14:28:02','1984-12-21 15:59:13'),
    (20,'Портрет Дориана Грея',2016,NULL,'http://lorempixel.com/640/480/','9','577','Modi et non reiciendis ut. Blanditiis incidunt recusandae non et perferendis deserunt vitae accusantium. Officia nobis autem rem in aut quia dolorem. Qui minima ipsa dolor facere reiciendis. Hic incidunt corrupti sed at impedit quam.',77909,'0+','1985-09-08 07:11:56','2001-10-27 16:36:48');

--
-- Dumping data for table `audiobooks_publishers`
--

INSERT INTO audiobooks_publishers (publisher_id, audiobook_id)
VALUES
    (1,16),
    (2,4),
    (5,10),
    (5,12),
    (7,14),
    (7,19),
    (8,20),
    (11,7),
    (11,9),
    (11,18),
    (12,8),
    (12,13),
    (12,15),
    (12,17),
    (13,1),
    (13,5),
    (14,2),
    (14,3),
    (14,11),
    (15,6);

--
-- Dumping data for table `links_by_book`
--

INSERT INTO links_by_book (links,audiobook_id)
VALUES
    ('{"Дорожка1": "Глава1", "Дорожка2": "Глава1","Дорожка3": "Глава2"}',1),
    (NULL,2),
    ('9914283119919',3),
    ('{"Дорожка1": "Глава1", "Дорожка2": "Глава3","Дорожка3": "Глава3"}',5),
    ('1371600955021',6),
    ('7920903792266',7),
    (NULL,8),
    ('6748376148653',9),
    ('{"Дорожка1": "Глава1", "Дорожка2": "Глава1","Дорожка3": "Глава2"}',10),
    ('{"Дорожка1": "Глава1", "Дорожка2": "Глава5","Дорожка3": "Глава10"}',11),
    ('6553362709912',12),
    ('1586662131072',13),
    ('5541367493395',14),
    ('8888353240098',15),
    ('2303541637802',16),
    ('6362997903936',17),
    ('8316632859483',18),
    ('2996126463714',19),
    ('8412847097389',20);

--
-- Dumping data for table `categories`
--

INSERT INTO categories (category_id,category_name) 
VALUES
    (1,'Фантастика'),
    (2,'Фэнтези'),
    (3,'Приключения'),
    (4,'Сказки'),
    (5,'Боевики'),
    (6,'Детективы'),
    (7,'Научно-популярное'),
    (8,'Поэзия'),
    (9,'Обучение'),
    (10,'Классика'),
    (11,'Ранобэ'),
    (12,'Триллеры');

--
-- Dumping data for table `audiobooks_categories`
--

INSERT INTO audiobooks_categories (category_id,audiobook_id)
VALUES
    (1,1),
    (1,10),
    (1,19),
    (2,2),
    (2,11),
    (2,20),
    (3,3),
    (3,12),
    (4,4),
    (4,13),
    (5,5),
    (5,14),
    (6,6),
    (6,15),
    (7,7),
    (7,16),
    (8,8),
    (8,17),
    (9,9),
    (9,18);

--
-- Dumping data for table `authors`
--

INSERT INTO authors (author_id,first_name,second_name,description)
VALUES
    (1,'Артём','Каменистый','{"key1": "value1", "key2": "value2"}'),
    (2,'Айзек','Азимов',DEFAULT),
    (3,'Константин','Муравьев','42'),
    (4,'Борис','Акунин','{"key1": "value1", "key2": "value2"}'),
    (5,'Стивен','Хокинг',DEFAULT),
    (6,'Марк','Твен',NULL),
    (7,'Луи','Буссенар','{"key1": "value1", "key2": "value2"}'),
    (8,'Стив','Джобс',DEFAULT),
    (9,'Джон','Толкин','13'),
    (10,'Готфрид','Лейбниц','42'),
    (11,'Оскар','Уайльд','{"text": "Красота, настоящая красота, кончается там, где начинает просвечивать ум."}'),
    (12,'Сергей','Есенин','{"text": "Времени нет. Серьезно? Это желания нет, а время есть всегда."}'),
    (13,'Жюль','Верн','{"key1": "value1", "key2": "value2"}');

--
-- Dumping data for table `audiobooks_authors`
--

INSERT INTO audiobooks_authors (author_id,audiobook_id)
VALUES
    (1,1),
    (2,14),
    (6,2),
    (4,15),
    (5,3),
    (3,16),
    (7,4),
    (8,17),
    (9,1),
    (9,18),
    (10,6),
    (11,19),
    (12,7),
    (13,20),
    (1,8),
    (1,9),
    (3,10),
    (10,11),
    (13,12),
    (13,13);

--
-- Dumping data for table `voices`
--

INSERT INTO voices (voice_id,first_name,second_name,nickname)
VALUES
    (1,'Александр','Хошабаев',NULL),
    (2,'Игорь','Ященко',NULL),
    (3,'Дмитрий','Хазанович','Дим Димыч'),
    (4,'Екатерина','Литвинова',NULL),
    (5,'Игорь','Князев',NULL),
    (6,'Алла','Човжик','Химера'),
    (7,'Александр','Клюквин',NULL),
    (8,'Терри','Пратич','saepe'),
    (9,'Кир','Булычёв',DEFAULT),
    (10,'Ирина','Боярская',NULL),
    (11,'Билл','Гейтс','Wind'),
    (12,'Гарик','Сукачёв',DEFAULT);

--
-- Dumping data for table `audiobooks_voices`
--

INSERT INTO audiobooks_voices (voice_id,audiobook_id)
VALUES
    (1,1),
    (1,13),
    (2,2),
    (2,14),
    (3,3),
    (3,15),
    (4,1),
    (4,16),
    (5,5),
    (5,17),
    (6,6),
    (6,18),
    (7,7),
    (7,19),
    (8,8),
    (8,20),
    (9,9),
    (10,10),
    (11,11),
    (12,12);

--
-- Dumping data for table `users`
--

INSERT INTO users (user_id,nickname,login,password_hash,created_at,birthday,access)
VALUES
    (1,'rerum','sed','8986ff0de9cf91d5ada02ec8e92d2b06bf085845','1991-03-13 15:18:42','1995-04-19','regular_user'),
    (2,'est','nesciunt','3de66d8fb732bc36ce5f7e94d7b2cffc28cce0c1','1983-01-17 17:28:04','2005-08-26','administrator'),
    (3,'optio','delectus','2b8ede10110cbee8231a74a50c358c08636094f0','1984-03-11 11:30:41','1985-08-19','administrator'),
    (4,'accusantium','et','c56e8c65eb723f60a08179ce1f016c91442d9ad2','2012-11-16 10:02:41','1995-06-11','moderator'),
    (5,'vero','at','2120670e2a6f799679ea1d4c55252c3a050384d3','2016-04-10 11:57:12','2002-12-01','regular_user'),
    (6,'unde','occaecati','7712aab35865b13e134f6be0acd9744383e23a21','1996-06-08 04:21:46','2003-09-30','moderator'),
    (7,'perferendis','quidem','945d2a418c072bbe1a79c40045d90961541672b8','1984-01-30 21:54:26','2014-01-18','regular_user'),
    (8,'ut','culpa','434e1c959bd83705aab3a5f4f8329de5423ddac6','1979-11-17 05:28:12','1998-01-08','administrator'),
    (9,'sunt','cupiditate','05b24e7f47b64048d031ff0278d99af63577d70f','2001-12-24 23:28:31','1999-09-18','administrator'),
    (10,'vel','sit','aab5abb8976c352d4de5625a2ca046cb4fe2b509','2010-05-13 13:10:01','1978-12-29','administrator'),
    (11,'minus','qui','ebcf79f19cc71e592cd971d62db0c13ba681b86b','1983-10-04 16:18:14','1976-09-29','moderator'),
    (12,'cumque','error','095ca4366825c4a12b9011c04e367fe11af24830','2012-12-13 05:16:13','2010-09-01','regular_user'),
    (13,'repellat','voluptas','ec86401b2b6067960dc9405b441c5f3f20d5ba21','2010-07-04 09:46:20','2020-01-28','moderator'),
    (14,'ea','id','9b87d2644aeab2b9424f6e3764cc20d1b4c98c97','1973-07-13 04:00:43','2013-08-24','regular_user'),
    (15,'voluptate','autem','9c3c17c9bde9b33c9d4a48e6f65d2a0a20d11ff1','2007-02-08 14:05:58','2003-06-02','administrator'),
    (16,'explicabo','perspiciatis','f4a1895e7611107f472873c7d8927e8b0548368b','1979-07-15 21:01:37','2014-06-27','regular_user'),
    (17,'quas','enim','26e56f8009191f4e61c4a6fca154550265f8bfe0','1972-08-13 00:37:37','1975-11-14','regular_user'),
    (18,'incidunt','temporibus','8fe10ebe40996ffbe6ef087b77cbec08e35a776c','2006-10-04 04:17:39','2019-12-04','moderator');

--
-- Dumping data for table `audiobooks_reviews`
--

INSERT INTO audiobooks_reviews (review_id,body,audiobook_id,user_id)
VALUES
    (1,'Unde tempora non magni. Repudiandae eaque laborum voluptates id. Quia consequuntur nam et.',1,13),
    (2,'Asperiores voluptates et ad sequi ex. Quae dolor aut ratione tempora quasi. Quae corporis odit aspernatur amet qui. Dicta aut nobis beatae nam delectus quo facere voluptatem. Inventore voluptatem natus omnis ut qui est.',1,2),
    (3,'Ab repellendus dolorem recusandae maxime voluptas. Eum omnis laborum rerum beatae. Est sunt dolorem ipsum itaque incidunt officiis tempora.',3,2),
    (4,'Rerum labore distinctio ut nostrum. In et dolore adipisci laboriosam atque aut. Quo qui in architecto a vero. Asperiores est est consequatur laboriosam architecto.',4,8),
    (5,'Necessitatibus facere et cumque corporis quasi magni. Sapiente voluptatem quisquam qui modi ea odit.',1,5),
    (6,'Ipsum eos est alias officia eos. Nesciunt cupiditate similique suscipit deserunt voluptatem. Dolor pariatur sit perspiciatis ipsam aliquid. Ut ipsam qui ipsa quaerat sint non. Magni atque fuga velit et qui.',6,7),
    (7,'Qui ut pariatur blanditiis et. Ullam necessitatibus tempore consequatur sit rerum nihil est sed. Repellendus enim aspernatur sed deleniti vel vel. Non temporibus nobis sed accusamus. Sit voluptatibus ipsum dicta voluptas voluptatem laborum voluptates.',7,7),
    (8,'Ullam animi et omnis a qui illum iste. Labore a quis non autem inventore. Omnis et ipsum aspernatur. Qui magni perspiciatis labore rerum.',8,1);


--
-- Dumping data for table `comments`
--

INSERT INTO comments (comment_id,body,created_at,user_id,audiobook_id,wrote_user_id,review_id)
VALUES
    (1,'Est dolor odit qui illo. Sit et cum dicta eius et. Sint labore ratione non et porro ut incidunt.','1994-08-15 05:01:23',1,1,NULL,NULL),
    (2,'Omnis dolores voluptate eligendi omnis placeat. Nisi consequatur iure voluptas aut odit nulla. Reprehenderit similique mollitia quis natus id ut. Ut repellat aut soluta nesciunt perferendis fuga non.','1994-06-10 18:41:01',2,1,NULL,NULL),
    (3,'Nam non quia fuga numquam eos error. Sit labore qui eum rem.','1988-12-13 12:36:10',3,3,10,3),
    (4,'Modi sed exercitationem eos consequatur est minima. Dignissimos unde corporis vel neque. Laboriosam corrupti pariatur maiores qui dolorum. Autem autem repudiandae dolorem amet unde qui molestiae.','1970-01-16 02:55:57',2,NULL,1,NULL),
    (5,'Cupiditate velit rerum in ut. Sed ab eveniet quia illo. Sit labore recusandae sint suscipit. Asperiores culpa qui ullam rerum voluptatem.','1977-12-21 11:38:23',1,NULL,NULL,5),
    (6,'In numquam dolore aut repudiandae iste repellat earum. Sed non vero voluptas quia. Eveniet sit molestiae dolorum et.','1988-01-21 20:32:00',6,NULL,NULL,5),
    (7,'Delectus harum voluptatem id quia est maxime. Totam molestiae ipsa laudantium vero et id ut. Quaerat at sit dolorem cupiditate voluptas.','2008-03-25 21:17:21',7,7,NULL,NULL),
    (8,'Esse dolorum saepe similique aut. Dolorum enim qui molestias et aut. Perspiciatis minima ad dignissimos ipsa praesentium.','2006-07-09 21:40:18',8,NULL,NULL,4),
    (9,'Possimus laboriosam quia non quis aliquam quo. Non ipsum reprehenderit qui voluptatem natus aut consequatur repudiandae. Voluptatem ea commodi rem est vel magnam et. Nisi temporibus voluptate reiciendis quo voluptas sed id.','1994-11-18 05:13:48',9,1,NULL,NULL),
    (10,'Voluptatum adipisci voluptatem culpa aut et. Quis id ut repudiandae illo vel aut illo. Voluptate velit autem molestiae. Vero error aliquid illo nesciunt aut laudantium. Accusantium occaecati perferendis cumque molestias omnis explicabo cum officiis.','2003-03-19 02:33:02',10,10,NULL,NULL),
    (11,'Doloribus ducimus mollitia asperiores nulla facilis quia. Sapiente ut et repudiandae aperiam eius. Quibusdam suscipit vel quis officiis. Neque necessitatibus vel officia delectus et occaecati error.','1994-05-20 15:59:22',11,NULL,NULL,1),
    (12,'Consequuntur autem nesciunt officia delectus labore rerum. Qui ullam minima corporis. Velit ratione reiciendis sint qui rerum ut. Aut dolore voluptas aliquid sequi quia.','1973-02-08 03:08:36',12,NULL,NULL,4);

--
-- Dumping data for table `likes`
--

INSERT INTO likes (user_id,comment_id,created_at,flag_like,flag_dislike)
VALUES
    (1,1,'1984-04-11 11:23:26',1,0),
    (2,1,'2019-10-03 15:29:55',1,0),
    (3,2,'1992-06-13 01:21:02',0,1),
    (4,4,'1974-04-29 16:50:42',1,0),
    (5,1,'2008-11-25 06:27:32',0,1),
    (6,2,'1971-04-11 08:51:59',1,0),
    (1,7,'1973-09-04 20:05:29',1,0),
    (8,8,'1973-10-11 12:49:14',1,0),
    (9,9,'1992-11-29 06:34:34',1,0),
    (10,10,'2010-10-09 04:44:31',1,0),
    (3,11,'1973-07-23 09:29:02',1,0),
    (3,12,'1997-03-24 02:49:58',0,1),
    (13,1,'1971-11-20 19:04:00',0,1);

--
-- Dumping data for table `users_rating`
--

INSERT INTO users_rating (user_id,audiobook_id,plot,voice_acting,author,overall)
VALUES
    (1,1,7,10,9,9),
    (2,1,3,2,2,1),
    (3,3,10,9,9,10),
    (4,1,8,8,8,8),
    (5,5,5,6,8,7),
    (6,3,9,10,10,10),
    (7,3,6,8,7,8),
    (8,8,4,4,2,3),
    (9,1,1,1,1,1);
# ====================================================================================================






# ====================================================================================================
