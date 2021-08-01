USE audiobooks;
# ==============================================================================================
# Скрипты наполнения выборки (малый объём данных)
INSERT INTO audiobooks.category_type (category_name)
VALUES  ('Фантастика, фэнтези'),
        ('Приключения'),
        ('Сказки'),
        ('Боевики'),
        ('Детективы, триллеры'),
        ('Научно-популярное'),
        ('Поэзия'),
        ('Обучение'),
        ('Классика'),
        ('Ранобэ');

INSERT INTO audiobooks.categories_book (category_type_id,book_id)
VALUES  (1,1),
        (2,1),
        (1,2),
        (3,2),
        (10,2),
        (6,3),
        (7,4),
        (8,4),
        (5,5),
        (4,6),
        (9,7),
        (2,7),
        (4,8),
        (3,9),
        (2,9),
        (7,9),
        (1,10);

INSERT INTO audiobooks.voice (first_name,second_name, nickname)
VALUES  ('Александр','Хошабаев',NULL),
        ('Игорь','Ященко',NULL),
        ('Дмитрий','Хазанович','Дим Димыч'),
        ('Екатерина','Литвинова',NULL),
        ('Игорь','Князев',NULL),
        ('Алла','Човжик','Химера'),
        ('Александр','Клюквин',NULL);


INSERT INTO audiobooks.authors (first_name,second_name,description)
VALUES  ('Артём','Каменистый','{"key1": "value1", "key2": "value2"}'),
        ('Айзек','Азимов',NULL),
        ('Константин','Муравьев','[1, 2]'),
        ('Борис','Акунин','{"key1": "value1", "key2": "value2"}'),
        ('Стивен','Хокинг',NULL),
        ('Марк','Твен',NULL),
        ('Луи','Буссенар','{"key1": "value1", "key2": "value2"}');


INSERT INTO audiobooks.links_by_book (links)
VALUES  ('{"Дорожка1": "Глава1", "Дорожка2": "Глава1","Дорожка3": "Глава2"}'),
        (NULL),
        ('{"Дорожка1": "Глава1", "Дорожка2": "Глава5","Дорожка3": "Глава10"}'),
        ('{"Дорожка1": "Глава1", "Дорожка2": "Глава3","Дорожка3": "Глава3"}'),
        ('{"Дорожка1": "Глава1", "Дорожка2": "Глава1","Дорожка3": "Глава2"}'),
        (NULL),
        ('{"Дорожка1": "Глава1", "Дорожка2": "Глава3","Дорожка3": "Глава3"}'),
        (NULL),
        ('{"Дорожка1": "Глава1", "Дорожка2": "Глава5","Дорожка3": "Глава10"}'),
        ('{"Дорожка1": "Глава1", "Дорожка2": "Глава5","Дорожка3": "Глава10"}');


INSERT INTO audiobooks.houses (house_name)
VALUES  ('Эксмо'),
        ('Вильямс'),
        ('Юрайт'),
        ('КноРус');


INSERT INTO audiobooks.publishing_houses (house_id,book_id)
VALUES  (NULL,3),
        (1,2),
        (3,5),
        (2,4),
        (1,1),
        (4,9),
        (NULL,8),
        (3,7),
        (2,6),
        (4,10);


INSERT INTO audiobooks.authors_book (author_id,book_id)
VALUES  (1,1),
        (2,1),
        (3,2),
        (4,3),
        (5,4),
        (6,5),
        (7,6),
        (7,7),
        (1,8),
        (3,9),
        (2,10),
        (4,10);


INSERT INTO audiobooks.voice_of_book (voice_id,book_id)
VALUES  (1,1),
        (2,2),
        (3,3),
        (4,4),
        (5,5),
        (6,6),
        (7,7),
        (3,8),
        (2,9),
        (1,10),
        (3,2);

    

INSERT INTO audiobooks.audiobooks (
                title_name,
                author_id,
                voice_of_book_id,
                release_year,
                publishing_house_id,
                description,
                body_image,
                audio_quality,
                body_audio,
                body_text,
                link_by_book_id,
                audiobook_size,
                raiting_age,
                category_book_id,
                created_at,
                updated_at
            )
VALUES  (
            'Властелин колец',
            1,
            10,
            1975,7,
            '{"key1": "value1", "key2": "value2"}',
            '/2ac1b69e2d52815ae2768dd7e100d1b7.jpg',
            '480 кбит/c',
            'Sit officiis quisquam architecto praesentium ratione alias natus. Corporis voluptatem in et voluptas delectus. Consectetur cupiditate ipsum odit dolorum. Explicabo in sint beatae non enim non aut.',
            'Explicabo dolore dolor aut minima nesciunt. Qui veritatis inventore rerum. Impedit quam harum officiis et sunt.',
            1,
            5898512,
            '12+',
            5,
            '1987-05-22 13:56:52',
            '1989-04-13 18:08:36'
        ),
        (
            'Гордость и предубеждение',
            2,
            9,
            1984,
            2,
            '{"key3": "value3", "key4": "value4"}',
            '/965ecdf909c079d7d13152b5470922b3.jpg',
            '480 кбит/c',
            'Dolor exercitationem quas est odio sit. Distinctio nam occaecati voluptate. Et eius aut sed at ipsam facilis animi. Suscipit excepturi quia odio nesciunt inventore.',
            'Veritatis illum iste voluptas voluptatem animi sapiente. Ex repellat aut eos itaque.',
            2,
            78621420,
            '12+',
            5,
            '2005-04-09 10:09:19',
            '1999-02-02 20:11:15'
        ),
        (
            'Тёмные начала',
            3,
            8,
            1971,
            8,
            NULL,
            '/aa7f7955b363be5334ac2ebb7fae112f.jpg',
            '160 кбит/c',
            'Et et sunt rerum sint id ut iste. Atque harum alias amet provident nisi quo itaque. Exercitationem possimus eaque assumenda animi mollitia nulla. Provident minus deserunt aut sit maiores maiores quo.',
            'Itaque perferendis mollitia illo veritatis aperiam aut voluptates veritatis. Alias officia cumque occaecati quae soluta praesentium et est. Voluptatem ratione et delectus ad. Delectus temporibus facilis eligendi sint sunt saepe perferendis est.',
            3,
            59820,
            '16+',
            2,
            '2011-05-04 11:22:35',
            '1994-03-02 09:30:46'
        ),
        (
            'Автостопом по галактике',
            4,
            7,
            1991,
            5,
            NULL,
            '/2cd3192e1773f500f9b060e5facfe154.jpg',
            '480 кбит/c',
            'Non excepturi eos sed aut nihil. Ut voluptatem ipsa quod non maxime odio qui. Aut sapiente neque in molestiae ea quaerat dolores.',
            'Reiciendis accusamus explicabo fugit neque autem. Vel officiis quaerat iste ut provident qui velit.',
            4,
            1,
            '18+',
            6,
            '2003-12-29 18:40:55',
            '2017-09-14 07:27:37'
        ),
        (
            'Гарри Поттер и Кубок огня',
            5,
            6,
            2006,
            9,
            '{"key1": "value1", "key2": "value2"}',
            '/81bd1110355e51e80f0d1e41ff7acc2a.jpg',
            '320 кбит/c',
            'Et quis nostrum omnis odit excepturi sint totam. Aut illo eaque omnis voluptatem. Vero sit quo autem sit assumenda esse repellendus.',
            'Nobis vel incidunt possimus voluptas. Nihil ipsam non quis. Eveniet et eos similique ea non officia libero.',
            5,
            5861651,
            '6+',
            4,
            '2001-11-01 18:36:00',
            '1972-02-10 16:04:40'
        ),
        (
            'Убить пересмешника',
            6,
            5,
            1982,
            7,
            '{"key42": "value42", "key42": "value42"}',
            '/bdf8457f80eec089c58a72964d822934.jpg',
            '320 кбит/c',
            'Eum voluptate aspernatur iusto et quo. Rem est aut a distinctio fuga nam. Consequatur blanditiis eius cum voluptatem dignissimos. Sapiente ut quia harum officia architecto.',
            'Voluptatem architecto perspiciatis eligendi ratione qui molestiae deleniti. Aliquid nisi voluptatem dignissimos expedita beatae. Maiores et rem deleniti consequatur aut eos enim. Commodi sunt vel similique ut cum distinctio rerum.',
            6,
            6716,
            '16+',
            4,
            '1977-12-03 04:38:58',
            '2020-03-22 01:32:16'
        ),
        (
            'Винни Пух',
            7,
            4,
            1974,
            8,
            '{"key13": "Some_Text", "key14": "value2"}',
            '/22437a2bfd946b127816333120b9c355.jpg',
            '160 кбит/c',
            'Non voluptatibus optio ut asperiores ea consectetur voluptatem. Non adipisci aspernatur molestiae error a inventore et. Ratione nihil voluptates perspiciatis dolor aut assumenda quia.',
            'Sed eum sint odio deserunt modi. Possimus neque porro voluptatem rem nostrum voluptatem consectetur. Quia quia quod sunt velit eaque. Tempora nam sint consectetur voluptate corrupti voluptas accusantium. Asperiores totam laborum ut.',
            7,
            2367,
            '0+',
            5,
            '2011-06-02 18:57:44',
            '2019-12-29 15:34:12'
        ),
        (
            '1984',
            8,
            3,
            2002,
            8,
            '{"key1": "value1", "key2": "value2"}',
            '/5b4486f22df368894939f6b4c74ec4d7.jpg',
            '160 кбит/c',
            'Suscipit in soluta provident exercitationem enim. Qui harum saepe dolores unde aut ea non.',
            'Dignissimos aperiam ut itaque sit delectus voluptates explicabo. Omnis doloremque quas eos tempora cum nulla nisi. Explicabo voluptatem et eos corrupti. Ullam quia eius quaerat doloribus beatae et.',
            8,
            5091,
            '16+',
            2,
            '2004-08-02 17:28:41',
            '1999-02-14 07:41:09'
        ),
        (
            'Лев, колдунья и платяной шкаф',
            9,
            2,
            2002,
            5,
            NULL,
            '/fc416328fb79272153462472b6fe1379.jpg',
            '320 кбит/c',
            'Est sit non consequatur et culpa repellendus est. Sed in quia sed sed. Soluta pariatur incidunt consequatur minus et ut. Aut ut quos velit consequuntur ab.',
            'Et culpa repellendus officiis blanditiis exercitationem. Cum sequi quasi debitis explicabo quo sed. Consequuntur vitae maiores perferendis dolores repellendus rerum.',
            9,
            496682818,
            '0+',
            5,
            '2004-08-20 20:00:35',
            '1978-03-15 14:38:06'
        ),
        (
            'Джейн Эйр',
            10,
            1,
            1985,
            5,
            '{"key1": "value1", "key2": "value2"}',
            '/dd2c65784af72171a8a3e62f30453f06.jpg',
            '320 кбит/c',
            'Molestias praesentium aut ipsam excepturi dolores nostrum. Repellat rerum eum porro autem et. Dolor dolorem minus odit quasi animi modi. Odio sed ratione ipsam.',
            'Totam quam officiis sed qui necessitatibus. Eligendi ut qui eveniet facere quos soluta fugiat.',
            10,
            67952468,
            '18+',
            4,
            '1984-11-18 12:13:49',
            '1992-02-25 03:56:35'
        );


INSERT INTO audiobooks.users (nickname,login,password_hash,created_at,birthday,access)
VALUES  ('animi','vkunde@hotmail.com','18670a6715d8c5d289408420335f8fd859eee095','1989-08-06 00:00:00','1991-11-09','regular_user'),
        ('magni','citlalli.eichmann@gmail.com','92ea7381c04d938cf92ffc00472044f2002c30e6','2004-10-20 00:00:00','1976-10-09','administrator'),
        ('quidem','eschmidt@gmail.com','da968039c83dccec567db4ea2d5c8ba2b43e4e87','1975-02-21 00:00:00','1970-08-04','regular_user'),
        ('consectetur','verlie69@yahoo.com','70ac58d41906bf5936a833b973d914423ed6f9b8','1984-01-25 00:00:00','1976-06-09','moderator'),
        ('exercitationem','christiansen.cassidy@hotmail.com','05f4ba3d6a21be187fcc6d9c8468145164176a0f','1985-06-06 00:00:00','1996-10-10','regular_user');


INSERT INTO audiobooks.user_rating (user_id,audiobook_id,plot,voice_acting,author,overall)
VALUES  (3,4,8,7,8,8),
        (2,2,9,10,10,10),
        (3,1,3,8,6,7);

    
INSERT INTO audiobooks.books_reviews (body,audiobook_id,user_id)
VALUES  ('Some text',2,2),
        ('Three Rings for the Elven-kings under the sky, Seven for the Dwarf-lords in their halls of stone,
Nine for Mortal Men doomed to die, One for the Dark Lord on his dark throne,
In the Land of Mordor where the Shadows lie,
One ring to rule them all, one ring to find them,
One ring to bring them all and in the darkness bind them In the Land of Mordor where the. Shadows lie.''',10,5);



INSERT INTO audiobooks.users_comments (body,created_at,user_id,audiobook_id,user_comment_id,book_review_id)
VALUES  (
            'Qui ea vel odit illo. Aut cupiditate quod voluptatibus optio id. Vel et nostrum velit earum aut sint animi. Tenetur et odit perspiciatis nam vero est.',
            '2010-10-13 21:26:44',
            4,
            1,
            NULL,
            NULL
        ),
        (
            'Error mollitia fugit quod fugiat. Rem alias eos dolor laborum incidunt et. Sunt similique voluptatibus maxime laborum officia.',
            '2005-03-30 06:00:07',
            3,
            NULL,
            1,
            NULL
        ),
        (
            'Aut soluta velit et aspernatur voluptatem. Saepe aut iusto vero rem. Sunt pariatur est sit facere quis.',
            '1986-12-25 23:44:02',
            5,
            3,
            NULL,
            NULL
        ),
        (
            'Laboriosam cupiditate recusandae ex unde praesentium suscipit architecto quidem. Facilis magni vel aliquam voluptate ex reprehenderit. Autem dicta ipsa voluptatem accusantium laboriosam consequatur. Quia provident fugiat vel voluptatem minus ab ratione aspernatur.',
            '1991-08-11 21:53:53',
            4,
            NULL,
            NULL,
            1
        ),
        (
            'Tempore explicabo corrupti illo corrupti omnis officia consequatur. Alias dolor sed illo eos magnam. Nobis vel a enim a. Omnis consequatur reprehenderit voluptate et.',
            '1976-07-14 09:22:51',
            1,
            5,
            NULL,
            NULL
        ),
        (
            'Et accusantium est necessitatibus deleniti rerum neque voluptas ut. Odio ut tempora in totam sed. Quia necessitatibus et aliquam non facere sequi.',
            '1974-05-25 03:52:42',
            3,
            6,
            NULL,
            NULL
        );


INSERT INTO audiobooks.likes (user_id,user_comment_id,flag_like,flag_dislike)
VALUES  (1,2,1,0),
        (2,3,0,1);    
# ==============================================================================================
# Скрипты характерных выборок
SELECT * FROM audiobooks.audiobooks;    -- Вся информация об имеющихся аудиокнигах
SELECT * FROM audiobooks.authors;       -- Вся информация о существующих авторах
SELECT * FROM audiobooks.voice;         -- Вся информация о существующих чтецах
SELECT * FROM audiobooks.category_type; -- Вся информация о существующих категориях книг
SELECT * FROM audiobooks.houses;        -- Вся информация о существующих издательствах
SELECT * FROM audiobooks.users;         -- Вся информация о существующих пользователях
# ------------------------------------------------------------

SELECT *
  FROM audiobooks.audiobooks
 WHERE title_name LIKE '%ос%'
ORDER BY updated_at DESC;     -- Поиск всей информации о книге по шаблону и вывод в обратном порядке обновления записи

# ------------------------------------------------------------
SET @test_id = 10; -- Переменная соответствующая id аудиокниги
# ------------------------------------------------------------
-- Для уточнения и проверки
SELECT *
  FROM audiobooks.audiobooks
 WHERE id=@test_id;                        


# Вывод в алфавитном порядке авторов определённой книги
 
-- Через вложенные запросы
SELECT first_name, second_name 
FROM audiobooks.authors
WHERE id IN (
    -- Выборка автора книги
    SELECT author_id
    FROM audiobooks.authors_book
    WHERE book_id=(
        -- Указание на авторов книги
        SELECT author_id
        FROM audiobooks.audiobooks
        WHERE id=@test_id
    )
ORDER BY second_name 
);

-- Через JOIN
SELECT DISTINCT 
    aus.first_name,
    aus.second_name
FROM
    audiobooks.authors AS aus
JOIN
    audiobooks.authors_book ab
JOIN
    audiobooks.audiobooks a
ON 
    a.id = @test_id AND ab.book_id = a.author_id AND aus.id = ab.author_id
ORDER BY aus.second_name;

# ------------------------------------------------------------
# Вывод в алфавитном порядке чтецов определённой книги

-- Через JOIN
SELECT DISTINCT 
    v.first_name,
    v.second_name,
    v.nickname 
FROM
    audiobooks.voice AS v
JOIN
    audiobooks.voice_of_book vob
JOIN
    audiobooks.audiobooks a
ON
    a.id = @test_id AND vob.book_id =a.voice_of_book_id AND v.id = vob.voice_id 
ORDER BY v.second_name;

# ------------------------------------------------------------
# Вывод издательства определённой книги (пользуюсь тем что для 1 книги 1 издательство)
-- Через вложенные запросы
SELECT h.house_name 
FROM audiobooks.houses AS h
WHERE h.id = (
    SELECT ph.house_id 
    FROM audiobooks.publishing_houses AS ph 
    WHERE ph.book_id = (
        SELECT a.publishing_house_id 
        FROM audiobooks.audiobooks AS a
        WHERE a.id = @test_id
    )
);

-- Через JOIN
SELECT
    h.house_name
FROM
    audiobooks.houses AS h
JOIN
    audiobooks.publishing_houses AS ph
JOIN
    audiobooks.audiobooks AS a
ON
    a.id = @test_id AND ph.book_id = a.publishing_house_id AND h.id = ph.house_id;
# ------------------------------------------------------------
# Вывод указателей для определённой книги (пользуюсь тем что для 1 книги 1 указатели)
-- Через вложенные запросы
SELECT links 
FROM audiobooks.links_by_book AS lbb 
WHERE id = (
    SELECT id 
    FROM audiobooks.audiobooks
    WHERE id=@test_id
);

-- Через JOIN
SELECT
    lbb.links 
FROM
    audiobooks.links_by_book AS lbb
JOIN
    audiobooks.audiobooks AS a 
ON
    a.id = @test_id AND lbb.id = a.link_by_book_id;
# ------------------------------------------------------------
# Вывод в алфавитном порядке жанров к которым относится определённая книга
SELECT
    ct.category_name
FROM
    audiobooks.category_type AS ct 
JOIN
    audiobooks.categories_book AS cb 
JOIN
    audiobooks.audiobooks AS a 
ON
    a.id = @test_id AND cb.book_id =a.category_book_id AND ct.id =cb.category_type_id
ORDER BY
    ct.category_name;
# ==============================================================================================











