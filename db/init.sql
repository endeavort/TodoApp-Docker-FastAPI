USE todo_db;

DROP TABLE IF EXISTS taskgroup;
CREATE TABLE taskgroup
(
  group_id SERIAL PRIMARY KEY, -- タスクグループID：連番型、主キー
  title VARCHAR(50), -- タスクグループ名：文字列型（最大50文字）
)

DROP TABLE IF EXISTS task;
CREATE TABLE task
(
  task_id SERIAL PRIMARY KEY, -- タスクID：連番型、主キー
  group_id INT, -- タスクグループID：外部キー
  title VARCHAR(50), -- タスク名：文字列型（最大50文字）
  description TEXT, -- タスク詳細：TEXT型
  due_date DATE, -- タスクの締め切り日：DATE型
  status BOOLEAN DEFAULT FALSE, -- タスクの状態：ブール型、デフォルト値 FALSE
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 作成日時：タイムスタンプ型、デフォルト値 作成時間
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 更新日時：タイムスタンプ型、デフォルト値　更新時間
  FOREIGN KEY (group_id) REFERENCES taskgroup(group_id) -- タスクグループIDを外部キーとして指定
);