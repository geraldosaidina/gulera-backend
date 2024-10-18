CREATE TABLE exercise
(
    id          VARCHAR(255) NOT NULL,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    category    SMALLINT     NOT NULL,
    workout_id  VARCHAR(255),
    CONSTRAINT pk_exercise PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_user
(
    user_id    VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    username   VARCHAR(255) NOT NULL,
    password   VARCHAR(255),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (user_id)
);

CREATE TABLE workout
(
    id          VARCHAR(255) NOT NULL,
    title       VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    workout_date        TIMESTAMP WITHOUT TIME ZONE,
    user_id     VARCHAR(255),
    CONSTRAINT pk_workout PRIMARY KEY (id)
);

ALTER TABLE tb_user
    ADD CONSTRAINT uc_user_username UNIQUE (username);

ALTER TABLE exercise
    ADD CONSTRAINT FK_EXERCISE_ON_WORKOUT FOREIGN KEY (workout_id) REFERENCES workout (id);

ALTER TABLE workout
    ADD CONSTRAINT FK_WORKOUT_ON_USER FOREIGN KEY (user_id) REFERENCES tb_user (user_id);