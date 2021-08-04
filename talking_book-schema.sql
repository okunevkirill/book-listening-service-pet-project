
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
    
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (audiobook_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    
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
-- View structure for view `___`
--



# ====================================================================================================
