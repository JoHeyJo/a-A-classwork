PRAGMA foreign_keys = ON;

CREATE TABLE users {
    
    id INTEGER PRIMARY KEY,
    fname VARCHAR NOT NULL,
    lname VARCHAR NOT NULL,

}

CREATE TABLE questions {
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    body VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)


}

CREATE TABLE question_follows {
    id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
    
}

CREATE TABLE replies {
    id INTEGER PRIMARY KEY
    body VARCHAR NOT NULL
    question_reference_id INTEGER KEY
    parent_question_reference_id INTEGER KEY
    user_reference_id INTEGER KEY
    

    FOREIGN KEY (question_reference_id) REFERENCES questions(id)
    FOREIGN KEY (parent_question_reference_id) REFERENCES replies(id)
    FOREIGN KEY (user_reference_id) REFERENCES users(id)
}

CREATE TABLE question_likes {
    liked BOOLEAN NOT NULL
    user_reference_id INTEGER NOT NULL
    question_reference_id INTEGER NOT NULL

    FOREIGN KEY (like_reference_id) REFERENCES users(id)
    FOREIGN KEY (question_reference_id) REFERENCES questions(id)
}


