	DROP DATABASE updb;
    CREATE DATABASE IF NOT EXISTS updb;
    USE updb;
    CREATE TABLE IF NOT EXISTS USER
(
    USER_ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS POST
(
    POST_ID INT AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT,
    DESCRIPTION TEXT,
    CREATED_AT DATETIME,
    PHOTO_LINK VARCHAR(200) DEFAULT NULL,
    LIKES INT DEFAULT NULL,
    FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID)
);
INSERT INTO USER (USER_ID, NAME)
VALUES
(1, 'RibbitterOfficial'),
(2, 'MaryS'),
(3, 'JohnDoe'),
(4, 'Somebody'),
(5, 'Someone'),
(6, 'Harry'),
(7, 'Ron'),
(8, 'Hermione'),
(9, 'Draco'),
(10, 'mrsNoriss');
INSERT INTO POST (POST_ID, USER_ID, DESCRIPTION, CREATED_AT, PHOTO_LINK, LIKES)
VALUES
(1, 1, 'Ribbit', '2020-03-01 11:30:22', DEFAULT, 150),
(2, 3, 'Hello there', '2020-03-01 11:11:11', 'hipic.jpg', DEFAULT),
(3, 2, 'Sup', '2020-03-01 11:12:00', 'l2', DEFAULT),
(4, 3, 'Nothing new in my life', '2020-03-01 11:13:11', DEFAULT, 3),
(5, 4, 'Did you know cats should not drink milk?', '2020-05-02 12:00:00', 'catpicture.png', 40),
(6, 5, 'Wow no dude', '2020-05-02 12:01:20', DEFAULT, DEFAULT),
(7, 6, 'Chudley Cannons go!!!', '2020-05-05 14:05:05', DEFAULT, 1),
(8, 7, 'Go Chudley Cannons!!!', '2020-05-05 14:05:07', DEFAULT, 1),
(9, 8, 'Guys go study', '2020-05-05 14:10:08', DEFAULT, DEFAULT),
(10, 9, '', '2020-05-05 18:00:07', 'selfie.jpg', 66),
(11, 3, 'Hello, Draco. Nice selfie', '2020-05-05 18:38:12', DEFAULT, DEFAULT),
(12, 3, 'I just had to write smth else today', '2020-05-05 19:53:44', DEFAULT, DEFAULT),
(13, 10, 'MEOW', NOW(), DEFAULT, DEFAULT),
(14, 10, 'MEOW MEOW', NOW(), DEFAULT, DEFAULT),
(15, 10, 'MEOW', NOW(), DEFAULT, DEFAULT),
(16, 10, '', NOW(), 'scarypic.jpg', DEFAULT);



