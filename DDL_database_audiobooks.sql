# Примечания:
#   1. Не использую SERIAL специально, - явное лучше неявного (кроме того
#      это повысит переносимость кода);    
#   2. Первыми привожу структуры таблиц с наименьшим количеством внешних ключей;
#   3. Решил не плодить сушьности с отдельными таблицами под файлы.
# ==============================================================================================
DROP DATABASE IF EXISTS audiobooks;
CREATE DATABASE audiobooks;
USE audiobooks;
# -------------------------------------------------

DROP TABLE IF EXISTS links_by_book;
CREATE TABLE links_by_book (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    links JSON DEFAULT NULL -- Хеш таблица
    
) COMMENT 'Взаимные указатели текстового формата аудио (для переключения)';

DROP TABLE IF EXISTS houses;
CREATE TABLE houses (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    house_name VARCHAR(50) UNIQUE NOT NULL,
    
    INDEX (house_name)
) COMMENT 'Список издательств';

DROP TABLE IF EXISTS publishing_houses;
CREATE TABLE publishing_houses (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    house_id BIGINT UNSIGNED,
    book_id BIGINT UNSIGNED UNIQUE NOT NULL,
    
    INDEX (house_id),
    INDEX (book_id),
    
    FOREIGN KEY (house_id) REFERENCES houses (id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE
) COMMENT 'Издательство выпустившее книгу';

DROP TABLE IF EXISTS category_type;
CREATE TABLE category_type (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Кол-во жанров не более 255
    category_name VARCHAR(50) UNIQUE NOT NULL,
    
    INDEX categories_name_idx (category_name)
) COMMENT 'Категория или жанр к которому относится книга';

DROP TABLE IF EXISTS categories_book;
CREATE TABLE categories_book (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_type_id TINYINT UNSIGNED,
    book_id BIGINT UNSIGNED NOT NULL,
    
    INDEX (book_id),
    
    FOREIGN KEY (category_type_id) REFERENCES category_type (id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE
    
) COMMENT 'Список категорий к которому относится книга';

DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    second_name VARCHAR(50) NOT NULL,
    description JSON DEFAULT NULL, -- TODO Подумать а стоит ли вообще JSON использовать
    
    INDEX author_name_idx (first_name, second_name)
) COMMENT 'Авторы книг';

DROP TABLE IF EXISTS authors_book;
CREATE TABLE authors_book (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    author_id BIGINT UNSIGNED,
    book_id BIGINT UNSIGNED NOT NULL,
    
    INDEX (book_id),
    
    FOREIGN KEY (author_id) REFERENCES authors (id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE
) COMMENT 'Авторы определённой книги';

DROP TABLE IF EXISTS voice;
CREATE TABLE voice (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    nickname VARCHAR(50) UNIQUE,
    
    INDEX voice_of_book_name_idx (first_name, second_name),
    INDEX voice_of_book_nickname (nickname)
) COMMENT 'Перечень чтецов';

DROP TABLE IF EXISTS voice_of_book;
CREATE TABLE voice_of_book (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    voice_id BIGINT UNSIGNED, -- NULL для неизвестных чтецов
    book_id BIGINT UNSIGNED NOT NULL,
    
    INDEX (voice_id),
    INDEX (book_id),
    
    FOREIGN KEY (voice_id) REFERENCES voice (id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE
) COMMENT 'Чтецы аудиокниги';

DROP TABLE IF EXISTS audiobooks;
CREATE TABLE audiobooks (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title_name VARCHAR(255) NOT NULL,   -- Большинство названий книг не превосходят 100 символов, но есть и 771
    author_id BIGINT UNSIGNED,          -- NULL если автор не известен
    voice_of_book_id BIGINT UNSIGNED,   -- NULL если чтец не известен
    release_year YEAR COMMENT 'Год выпуска аудиокниги',
    publishing_house_id BIGINT UNSIGNED,
    description JSON,                   -- Описание книги, информация о серии, о мире и т.д. 
    body_image BLOB,                    -- TODO Размер изображений программно необходимо ужать до max=65 КБ
    audio_quality VARCHAR(30),          -- TODO Если всё аудио будет в mp3 то можно сделать поле списковым (ENUM)
    body_audio LONGBLOB NOT NULL,       -- Размер аудиокниги не должен превосходить 4 ГБ
    body_text LONGTEXT,                 -- Размер текста книги не должен превосходить 4 ГБ
    link_by_book_id BIGINT UNSIGNED,    -- NULL значение предназначено для коротких аудиокниг или у которых нет текстового вида
    audiobook_size INT UNSIGNED NOT NULL, -- Размер файлов аудиокниги
    raiting_age ENUM ('0+', '6+', '12+', '16+', '18+') DEFAULT '0+', 
    category_book_id BIGINT UNSIGNED,
    created_at DATETIME DEFAULT NOW(),  -- Дата добавления книги
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX (title_name),
    INDEX (author_id),
    INDEX (voice_of_book_id),
    INDEX (publishing_house_id),
    INDEX (category_book_id),
    
    FOREIGN KEY (author_id) REFERENCES authors_book (book_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE,
    
    FOREIGN KEY (voice_of_book_id) REFERENCES voice_of_book (book_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE,
    
    FOREIGN KEY (publishing_house_id) REFERENCES publishing_houses (book_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE,
    
    FOREIGN KEY (category_book_id) REFERENCES categories_book (book_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE,
    
    FOREIGN KEY (link_by_book_id) REFERENCES links_by_book (id)
    ON DELETE RESTRICT 
    ON UPDATE CASCADE
) COMMENT 'Аудиокниги (БАЗОВАЯ СУЩНОСТЬ)';


DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) UNIQUE,        -- Имя пользователя на сайте
    login VARCHAR(120) UNIQUE,          -- Может быть или email или телефон
    password_hash VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),  -- Время создания пользователя
    birthday DATE,                      -- По данному полю работаем с возрастным рейтингом
    access ENUM ('administrator', 'moderator', 'regular_user'),
    
    INDEX (nickname)
) COMMENT 'Пользователи сайта (БАЗОВАЯ СУЩНОСТЬ)';

DROP TABLE IF EXISTS books_reviews;
CREATE TABLE books_reviews (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    body TEXT,
    audiobook_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED,
    
    INDEX (audiobook_id),
    
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
        
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
    
) COMMENT 'Рецензии о книгах';


DROP TABLE IF EXISTS users_comments;
CREATE TABLE users_comments (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    body VARCHAR(2200) COMMENT 'Текст комментария (кол-во символов спец. ограничил 2200)',
    created_at DATETIME DEFAULT NOW(),  -- Время создания комментария
    user_id BIGINT UNSIGNED NOT NULL,   -- Тот кто написал комментарий
    -- Следующие 3 поля взаимоисключающие (если в 1 не NULL, то в остальных NULL)
    audiobook_id BIGINT UNSIGNED,       -- Не NULL если комментируем книгу
    user_comment_id BIGINT UNSIGNED,    -- Не NULL если комментируем другой комментарий
    book_review_id BIGINT UNSIGNED,     -- Не NULL если комментируем рецензию
    
        
    INDEX (user_id),
    
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    
    FOREIGN KEY (book_review_id) REFERENCES books_reviews (id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
) COMMENT 'Комментарии пользователя';

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,           -- тот кто ставит лайк
    user_comment_id BIGINT UNSIGNED NOT NULL,   -- комментарий на который ставят лайк
    created_at DATETIME DEFAULT NOW(),          
    flag_like BIT(1) NOT NULL DEFAULT FALSE,
    flag_dislike BIT(1) NOT NULL DEFAULT FALSE,
    
    INDEX (user_id),
    INDEX (user_comment_id),
    
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    
    FOREIGN KEY (user_comment_id) REFERENCES users_comments (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
) COMMENT 'Лайки к комментариям';

DROP TABLE IF EXISTS user_rating;
CREATE TABLE user_rating (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,                    -- тот кто оценивает
    audiobook_id BIGINT UNSIGNED NOT NULL,      -- что оценивают
    plot TINYINT DEFAULT NULL,                  -- Оценка сюжета
    voice_acting TINYINT DEFAULT NULL,          -- Оценка чтеца
    author TINYINT DEFAULT NULL,                -- Оценка автора
    overall TINYINT DEFAULT NULL,               -- Общее впечатление о книги
    
    INDEX (user_id),
    INDEX (audiobook_id),
    
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    
    FOREIGN KEY (audiobook_id) REFERENCES audiobooks (id)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
) COMMENT 'Оценка от пользователя';
# ==============================================================================================
