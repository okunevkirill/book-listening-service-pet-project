
DROP DATABASE IF EXISTS talking_book;
CREATE DATABASE talking_book;
USE talking_book;
# ====================================================================================================
--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers (
    publisher_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(50) UNIQUE NOT NULL,
    INDEX (publisher_name)
) COMMENT 'Список издательств' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `audiobooks`
--

DROP TABLE IF EXISTS audiobooks;
CREATE TABLE audiobooks (
    audiobook_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title_name VARCHAR(255) NOT NULL,   -- Большинство названий книг не превосходят 100 символов, но есть и 771
    release_year YEAR COMMENT 'Год выпуска аудиокниги',
    description JSON,                   -- Описание книги, информация о серии, о мире и т.д. 
    cover BLOB,                         -- Обложка книги (max=65 КБ)
    audio_quality VARCHAR(30),          -- Качество аудиодорожек
    body_audio LONGBLOB NOT NULL,       -- !!! Размер аудиокниги не должен превосходить 4 ГБ
    body_text LONGTEXT,                 -- !!! Размер текста книги не должен превосходить 4 ГБ
    audio_size INT UNSIGNED NOT NULL,   -- Размер файлов аудиокниги
    raiting_age ENUM ('0+', '6+', '12+', '16+', '18+') DEFAULT '0+', 
    created_at DATETIME DEFAULT NOW(),  -- Дата добавления книги
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX (title_name)
) COMMENT 'Аудиокниги' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `audiobooks_publishers`
--

DROP TABLE IF EXISTS audiobooks_publishers;
CREATE TABLE audiobooks_publishers (
    publisher_id BIGINT UNSIGNED NOT NULL,
    audiobook_id BIGINT UNSIGNED UNIQUE NOT NULL,
    PRIMARY KEY (publisher_id,audiobook_id),
    KEY (audiobook_id),
    
    CONSTRAINT fk_audiobooks_publishers_publishers
    FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT fk_audiobooks_publishers_audiobooks
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Издательство выпустившее книгу' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `links_by_book`
--

DROP TABLE IF EXISTS links_by_book;
CREATE TABLE links_by_book (
    links JSON DEFAULT NULL, -- Хеш таблица
    audiobook_id BIGINT UNSIGNED UNIQUE NOT NULL,
    KEY (audiobook_id),
    
    CONSTRAINT fk_links_audiobooks
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Указатели между форматом аудио и текстом книги' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- !!! Количество жанров не более 255
    category_name VARCHAR(50) UNIQUE NOT NULL,
    
    INDEX category_name_idx (category_name)
) COMMENT 'Жанр к которому относится книга' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `audiobooks_categories`
--

DROP TABLE IF EXISTS audiobooks_categories;
CREATE TABLE audiobooks_categories (
    category_id TINYINT UNSIGNED NOT NULL,
    audiobook_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (category_id,audiobook_id),
    KEY (audiobook_id),
    
    CONSTRAINT fk_audiobooks_categories_categories
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT fk_audiobooks_categories_audiobooks
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Категории к которым относится книга' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
    author_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    second_name VARCHAR(50) NOT NULL,
    description JSON DEFAULT NULL,      -- Дополнительные сведения о наградах и т.д
    
    INDEX author_name_idx (first_name, second_name)
) COMMENT 'Авторы книг' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `audiobooks_authors`
--

DROP TABLE IF EXISTS audiobooks_authors;
CREATE TABLE audiobooks_authors (
    author_id BIGINT UNSIGNED NOT NULL,
    audiobook_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (author_id,audiobook_id),
    KEY (audiobook_id),
    
    CONSTRAINT fk_audiobooks_authors_authors
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT fk_audiobooks_authors_audiobooks
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Авторы определённой книги' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `voices`
--

DROP TABLE IF EXISTS voices;
CREATE TABLE voices (
    voice_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    nickname VARCHAR(50) UNIQUE DEFAULT NULL,
    
    INDEX voice_name_idx (first_name, second_name),
    INDEX voice_nickname (nickname)
) COMMENT 'Чтецы аудиокниг' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `audiobooks_voices`
--

DROP TABLE IF EXISTS audiobooks_voices;
CREATE TABLE audiobooks_voices (
    voice_id BIGINT UNSIGNED NOT NULL,
    audiobook_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (voice_id,audiobook_id),
    KEY (audiobook_id),
    
    
    CONSTRAINT fk_audiobooks_voices_voices
    FOREIGN KEY (voice_id) REFERENCES voices (voice_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT fk_audiobooks_voices_audiobooks
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Чтецы определённой аудиокниги' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) UNIQUE,        -- Имя пользователя на сайте
    login VARCHAR(120) UNIQUE,          -- Может быть или email или телефон
    password_hash VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),  -- Время создания пользователя
    birthday DATE,                      -- По данному полю работаем с возрастным рейтингом
    access ENUM ('administrator', 'moderator', 'regular_user'),
    
    INDEX user_name_idx (nickname)
) COMMENT 'Пользователи сайта' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `audiobooks_reviews`
--

DROP TABLE IF EXISTS audiobooks_reviews;
CREATE TABLE audiobooks_reviews (
    review_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    body TEXT,
    audiobook_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED,
    INDEX (audiobook_id),
    INDEX (user_id),
    
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
        
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE SET NULL ON UPDATE CASCADE
    
) COMMENT 'Рецензии на книги' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    comment_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    body VARCHAR(2200) COMMENT 'Текст комментария', -- количество символов ограничил 2200 специально
    created_at DATETIME DEFAULT NOW(),  -- Время создания комментария
    user_id BIGINT UNSIGNED NOT NULL,   -- Тот кто написал комментарий
    -- Следующие 3 поля взаимоисключающие (если в 1 не NULL, то в остальных NULL)
    audiobook_id BIGINT UNSIGNED,       -- Не NULL если комментируем книгу
    wrote_user_id BIGINT UNSIGNED,      -- Не NULL если комментируем другой комментарий
    review_id BIGINT UNSIGNED,          -- Не NULL если комментируем рецензию
    INDEX (user_id),
    
    CONSTRAINT fk_comments_users
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    
    CONSTRAINT fk_comments_audiobooks
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    
    CONSTRAINT fk_comments_audiobooks_reviews
    FOREIGN KEY (review_id) REFERENCES audiobooks_reviews (review_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT 'Комментарии пользователя' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
    user_id BIGINT UNSIGNED NOT NULL,       -- тот кто ставит лайк
    comment_id BIGINT UNSIGNED NOT NULL,    -- комментарий на который ставят лайк
    created_at DATETIME DEFAULT NOW(),          
    flag_like BIT(1) NOT NULL DEFAULT FALSE,
    flag_dislike BIT(1) NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id,comment_id),
    KEY (user_id),

    CONSTRAINT fk_likes_users
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT fk_likes_comments
    FOREIGN KEY (comment_id) REFERENCES comments (comment_id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) COMMENT 'Лайки к комментариям' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `users_rating`
--

DROP TABLE IF EXISTS users_rating;
CREATE TABLE users_rating (
    user_id BIGINT UNSIGNED NOT NULL,           -- тот кто оценивает
    audiobook_id BIGINT UNSIGNED NOT NULL,      -- что оценивают
    plot TINYINT DEFAULT NULL,                  -- Оценка сюжета
    voice_acting TINYINT DEFAULT NULL,          -- Оценка чтецов книги
    author TINYINT DEFAULT NULL,                -- Оценка авторов книги
    overall TINYINT DEFAULT NULL,               -- Общее впечатление о книги
    CHECK (
            plot>=1 AND plot<=10 AND
            voice_acting>=1 AND voice_acting<=10 AND
            author>=1 AND author<=10 AND
            overall>=1 AND overall<=10
          ),    -- Можно установить оценку 0 для необезательного заполнения всех полей
    PRIMARY KEY (user_id,audiobook_id),
    KEY (audiobook_id),
    KEY (user_id),
    
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
) COMMENT 'Оценка от пользователя' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
# ====================================================================================================
--
-- View structure for view `audiobooks_list`
--

CREATE OR REPLACE VIEW audiobooks_list
AS
SELECT
    audiobooks.audiobook_id AS `audiobook_id`,
    audiobooks.title_name AS `title_name`,
    audiobooks.release_year AS `release_year`,
    audiobooks.description AS `description`,
    audiobooks.cover AS `cover`,
    audiobooks.audio_size AS `audio_size`,
    audiobooks.created_at AS `created_at`,
    GROUP_CONCAT(DISTINCT CONCAT(categories.category_name ) SEPARATOR ', ') AS `categories`,
    GROUP_CONCAT(DISTINCT CONCAT(authors.first_name, _utf8mb4' ', authors.second_name) SEPARATOR ', ') AS `authors`,
    GROUP_CONCAT(DISTINCT CONCAT(voices.first_name, _utf8mb4' ', voices.second_name) SEPARATOR ', ') AS `voices`
    
FROM audiobooks     
LEFT JOIN audiobooks_authors ON audiobooks.audiobook_id = audiobooks_authors.audiobook_id 
JOIN authors ON audiobooks_authors.author_id = authors.author_id
LEFT JOIN audiobooks_voices ON audiobooks.audiobook_id = audiobooks_voices.audiobook_id 
JOIN voices ON audiobooks_voices.voice_id = voices.voice_id
LEFT JOIN audiobooks_categories ON audiobooks.audiobook_id = audiobooks_categories.audiobook_id 
JOIN categories ON audiobooks_categories.category_id = categories.category_id 
GROUP BY audiobooks.audiobook_id;


--
-- View structure for view `authors_list`
--

CREATE OR REPLACE VIEW authors_list
AS
SELECT
    authors.author_id AS `author_id`,
    authors.first_name AS `first_name`,
    authors.second_name AS `second_name`,
    authors.description AS `description`,
    GROUP_CONCAT(DISTINCT CONCAT(audiobooks.title_name) SEPARATOR ', ') AS `audiobooks`
    
FROM authors     
LEFT JOIN audiobooks_authors ON authors.author_id = audiobooks_authors.author_id 
JOIN audiobooks ON audiobooks_authors.audiobook_id = audiobooks.audiobook_id 
GROUP BY authors.author_id;

--
-- View structure for view `rating_list`
--

CREATE OR REPLACE ALGORITHM=MERGE VIEW rating_list
AS
SELECT
    abooks.audiobook_id AS `audiobook_id`,
    abooks.title_name AS `title_name`,
    AVG(ur.plot) AS `plot`,
    AVG(ur.voice_acting) AS `voice_acting`,
    AVG(ur.author) AS `author`,
    AVG(ur.overall) AS `overall`
FROM users_rating AS ur
LEFT JOIN audiobooks AS abooks ON ur.audiobook_id = abooks.audiobook_id 
GROUP BY abooks.audiobook_id
ORDER BY abooks.title_name;
# ====================================================================================================

--
-- Triggers to monitor changes in users
--

DELIMITER $$
DROP TRIGGER IF EXISTS upd_users $$
CREATE TRIGGER upd_users BEFORE UPDATE ON `users`
FOR EACH ROW BEGIN
    IF NEW.birthday >= CURRENT_DATE() THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Обновление отменено. Указанная дата рождения больше текущей даты';
    END IF;
END $$

DROP TRIGGER IF EXISTS ins_users $$
CREATE TRIGGER ins_users BEFORE INSERT ON `users`
FOR EACH ROW BEGIN
    IF NEW.birthday >= CURRENT_DATE() THEN
        SET NEW.birthday = CURRENT_DATE();
    END IF;
END $$
DELIMITER ;

--
-- Triggers to monitor changes in comments
--

DELIMITER $$
DROP TRIGGER IF EXISTS upd_comments $$
CREATE TRIGGER upd_comments BEFORE UPDATE ON `comments`
FOR EACH ROW BEGIN
    IF NEW.audiobook_id IS NOT NULL THEN
        IF NEW.wrote_user_id IS NOT NULL OR NEW.review_id IS NOT NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Обновление отменено. Поля `audiobook_id`, `wrote_user_id` и `review_id` взаимоисключающие';
        END IF;
    ELSEIF NEW.wrote_user_id IS NOT NULL AND NEW.review_id IS NOT NULL THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Обновление отменено. Поля `audiobook_id`, `wrote_user_id` и `review_id` взаимоисключающие';
    END IF;
END $$

DROP TRIGGER IF EXISTS ins_comments $$
CREATE TRIGGER ins_comments BEFORE INSERT ON `comments`
FOR EACH ROW BEGIN
    IF NEW.audiobook_id IS NOT NULL THEN
        IF NEW.wrote_user_id IS NOT NULL OR NEW.review_id IS NOT NULL THEN
            SET NEW.audiobook_id = NULL;
            SET NEW.wrote_user_id = NULL;
            SET NEW.review_id = NULL;
        END IF;
    ELSEIF NEW.wrote_user_id IS NOT NULL AND NEW.review_id IS NOT NULL THEN 
        SET NEW.audiobook_id = NULL;
        SET NEW.wrote_user_id = NULL;
        SET NEW.review_id = NULL;
    END IF;
END $$
DELIMITER ;
# ====================================================================================================

--
-- Procedure structure for procedure `random_book_cover`
--

DELIMITER $$
DROP PROCEDURE IF EXISTS random_book_cover $$
CREATE PROCEDURE random_book_cover (
    IN category_id TINYINT UNSIGNED,
    IN number_of_books TINYINT UNSIGNED
)
NOT DETERMINISTIC
READS SQL DATA
COMMENT 'Предоставление заданного количество обложек книг указанного жанра'
BEGIN
    SELECT
        audiobooks.audiobook_id,
        audiobooks.title_name,
        audiobooks.cover 
    FROM audiobooks
    JOIN audiobooks_categories ON audiobooks.audiobook_id = audiobooks_categories.audiobook_id 
    JOIN categories ON audiobooks_categories.category_id = category_id
    GROUP BY audiobooks.audiobook_id
    ORDER BY RAND()
    LIMIT number_of_books;
END $$
DELIMITER ;
# ====================================================================================================
