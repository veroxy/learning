INSERT INTO roles VALUES (1, 'admin'),
(2, 'author'),
(3, 'moderator');

INSERT INTO users VALUES (1, 'j_corey', 'James', 'Corey', 'jcorey@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 1),
(2, 'P_J_Farm', 'Philip', 'Farmer', 'philipfarmer@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(3, 'JCronin', 'Justin', 'Cronin', 'jcronin@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 3),
(4, 'franckherb', 'Franck', 'Herbert', 'fherbert@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(5, 'dansimm', 'Dan', 'Simmons', 'dan.simmons@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(6, 'isaacasimov1986', 'Isaac', 'Asimov', 'asimo@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(7, 'pkd4eva', 'Philip Kindred', 'Dick', 'pkdick@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(8, 'true_martian', 'Kim Stanley', 'Robinson', 'ksrobinson@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(9, 'rcwilson', 'Robert Charles', 'Wilson', 'rcwilson@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2),
(10, 'horrormasta', 'Stephen', 'King', 'sking@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'graindesel', 1, 2);

INSERT INTO medias(id, path, extension, user_id) VALUES
(1, '/doc/mondoc', '.doc', 5),
(2, '/img/monimg1', '.jpg', 7),
(3, '/doc/mondoc1', '.doc', 1),
(4, '/img/monimg2', '.jpg', 4),
(5, '/doc/mondoc2', '.doc', 3),
(6, '/img/monimg3', '.jpg', 8),
(7, '/doc/mondoc3', '.doc', 9),
(8, '/img/monimg4', '.jpg', 10);

INSERT INTO articles (id, author_id, title, media_header, content, is_active, date_creation) VALUES
(1, 1, "HTML pour les debutant", 1, "Lorem ipsum dolor sit amet consectetur adipisicing elit.", 1, DATE_SUB(NOW(), INTERVAL 1 MONTH)),
(2, 6, "CSS c'est de la bombe", 2, "Ducimus voluptatum consectetur nesciunt provident sint.", 1, DATE_SUB(NOW(), INTERVAL 2 MONTH)),
(3, 5, "Vive les frameworks", 3, "Eaque suscipit earum voluptates laborum eligendi!", 1, DATE_SUB(NOW(), INTERVAL 3 MONTH)),
(4, 10, "JAVA c'est la vie !", 4, "Sed maiores autem tempore iusto, quam voluptatem vitae ex ullam.", 0, DATE_SUB(NOW(), INTERVAL 4 MONTH)),
(5, 9, "Manger 5 framework laravel par jour", 5, "Ducimus voluptatum consectetur nesciunt provident sint.", 1, DATE_SUB(NOW(), INTERVAL 5 MONTH)),
(6, 2, "Code ta race", 6, "Eaque suscipit earum voluptates laborum eligendi!", 1, DATE_SUB(NOW(), INTERVAL 6 MONTH)),
(7, 6, "PHP c'est relou, mais...", 7, "Ducimus voluptatum consectetur nesciunt provident sint.", 1, DATE_SUB(NOW(), INTERVAL 7 MONTH)),
(8, 7, "Salage ne rime pas avec Crackage", 8, "Eaque suscipit earum voluptates laborum eligendi!", 0, DATE_SUB(NOW(), INTERVAL 7 DAY)),
(9, 6, "SQL", 1, "Lorem ipsum dolor sit amet consectetur adipisicing elit.", 1, DATE_SUB(NOW(), INTERVAL 3 WEEK)),
(10, 8, "", 2, "Eaque suscipit earum voluptates laborum eligendi!", 1, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(11, 3, "", 3, "Ducimus voluptatum consectetur nesciunt provident sint.", 1, NOW()),
(12, 2, "", 4, "Ducimus voluptatum consectetur nesciunt provident sint.", 1, DATE_SUB(NOW(), INTERVAL 10 MONTH));

INSERT INTO courses (id, name) VALUES
(1, 'HTML'),
(2, 'CSS'),
(3, 'GRAPHISME'),
(4, 'JAVASCRIPT'),
(5, 'PHP'),
(6, 'BDD'),
(7, 'RESEAU'),
(8, 'JAVA'),
(9, 'MOBILITE'),
(10, 'FRAMEWORK');

INSERT INTO article_course (id, article_id, course_id)
VALUES (1, 1, 1),
(2, 3, 6),
(3, 3, 7),
(4, 2, 1),
(5, 6, 6),
(6, 7, 8),
(7, 4, 9),
(8, 4, 10),
(9, 5, 2),
(10, 5, 3),
(11, 8, 2),
(12, 11, 10),
(13, 1, 3),
(14, 12, 5),
(15, 10, 10),
(16, 3, 3),
(17, 4, 4),
(18, 2, 2),
(19, 5, 9);

INSERT INTO article_media (id, media_id, article_id)
VALUES (1, 1, 1),
(2, 3, 6),
(3, 3, 7),
(4, 2, 1),
(5, 6, 6),
(6, 7, 8),
(7, 4, 9),
(8, 4, 10),
(9, 5, 2),
(10, 5, 3),
(11, 8, 2),
(12, 1, 10),
(13, 1, 3),
(14, 4, 5),
(15, 6, 10),
(16, 8, 3),
(17, 2, 4),
(18, 2, 2),
(19, 5, 9);