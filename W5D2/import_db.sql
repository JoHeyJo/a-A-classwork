PRAGMA foreign_keys = ON;

CREATE TABLE users (
    
    id INTEGER PRIMARY KEY,
    fname VARCHAR NOT NULL,
    lname VARCHAR NOT NULL

);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    body VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)


);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
    
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body VARCHAR NOT NULL,
    question_reference_id INTEGER KEY,
    parent_question_reference_id INTEGER KEY,
    user_reference_id INTEGER KEY,
    

    FOREIGN KEY (question_reference_id) REFERENCES questions(id),
    FOREIGN KEY (parent_question_reference_id) REFERENCES replies(id),
    FOREIGN KEY (user_reference_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    like_reference_id INTEGER NOT NULL,
    question_reference_id INTEGER NOT NULL,

    FOREIGN KEY (like_reference_id) REFERENCES users(id),
    FOREIGN KEY (question_reference_id) REFERENCES questions(id)
);

INSERT INTO
users (fname, lname)
VALUES
    ('Jack', 'Tomasik'),
    ('Joannes', 'Figueroa');

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('comment', 'SQL is tiiiiight?', (SELECT id FROM users WHERE fname = 'Jack')),
    ('another_comment', 'I love SQL?', (SELECT id FROM users WHERE fname = 'Joannes'));



