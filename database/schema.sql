CREATE DATABASE IF NOT EXISTS posefit
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE posefit;

DROP TABLE IF EXISTS workout_logs;
DROP TABLE IF EXISTS workout_plan_items;
DROP TABLE IF EXISTS workout_plans;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS users;

-- 1. Bảng người dùng
CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthday DATE,
    height DECIMAL(5,2),
    weight DECIMAL(5,2),
    sex VARCHAR(10),
    CONSTRAINT chk_height CHECK (height > 0),
    CONSTRAINT chk_weight CHECK (weight > 0)
);

-- 2. Bảng danh mục bài tập
CREATE TABLE exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    exer_name VARCHAR(100) NOT NULL,
    environment SET('home', 'gym', 'outdoor'),
    muscle_group VARCHAR(50),
    description TEXT,
    difficulty ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner',
    ai_supported BOOLEAN DEFAULT FALSE
);

-- 3. Bảng kế hoạch tập luyện
CREATE TABLE workout_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100) NOT NULL,
    plan_date DATE NOT NULL,
    user_id INT NOT NULL,
    status ENUM('planned', 'completed') DEFAULT 'planned',
    CONSTRAINT fk_plans_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

-- 4. Bảng chi tiết bài tập trong kế hoạch
CREATE TABLE workout_plan_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT NOT NULL,
    exercise_id INT NOT NULL,
    target_set INT NOT NULL,
    rep_per_set INT NOT NULL,
    CONSTRAINT chk_target_set CHECK (target_set > 0),
    CONSTRAINT chk_rep_per_set CHECK (rep_per_set > 0),
    CONSTRAINT fk_items_plan
        FOREIGN KEY (plan_id) REFERENCES workout_plans(plan_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_items_exercise
        FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
        ON DELETE RESTRICT
);

-- 5. Bảng nhật ký tập luyện & chấm điểm AI (mỗi dòng = 1 set)
CREATE TABLE workout_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    exercise_id INT NOT NULL,
    item_id INT NULL,
    user_id INT NOT NULL,
    performed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    form_score DECIMAL(5,2),
    set_number INT,
    actual_reps INT NOT NULL,
    CONSTRAINT chk_form_score CHECK (form_score BETWEEN 0 AND 100),
    CONSTRAINT chk_set_number CHECK (set_number > 0),
    CONSTRAINT chk_actual_reps CHECK (actual_reps >= 0),
    CONSTRAINT fk_logs_exercise
        FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_logs_item
        FOREIGN KEY (item_id) REFERENCES workout_plan_items(item_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_logs_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);
INSERT INTO exercises (exer_name, environment, muscle_group, description, difficulty, ai_supported)
VALUES
    ('Squat', 'home,gym,outdoor', 'Legs', 'Bài tập gánh đùi cơ bản giúp phát triển cơ đùi và mông.', 'beginner', TRUE),
    ('Bicep Curl', 'home,gym', 'Arms', 'Bài tập gập tay với tạ giúp phát triển cơ tay trước.', 'beginner', TRUE),
    ('Push-up', 'home,gym,outdoor', 'Chest', 'Bài tập chống đẩy giúp tăng cường cơ ngực, vai và tay sau.', 'beginner', TRUE);