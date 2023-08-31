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

-- 初期追加
INSERT INTO taskgroup (title) VALUES
  ('毎日やること'),
  ('仕事関連'),
  ('買い物リスト');

  INSERT INTO task (group_id, title, description, due_date)
VALUES
  (1, 'ランニング', '毎朝30分のランニング', '2023-09-01'),
  (1, '英語の勉強', 'デイリーコンバーションの練習', '2023-09-05'),
  (2, 'プロジェクトAの進捗報告', '月末までに報告書作成', '2023-08-31'),
  (2, 'クライアントBとの打ち合わせ', '新しい要件の確認', '2023-09-10'),
  (3, '牛乳を買う', '2本', '2023-09-02'),
  (3, '野菜を買う', 'トマト、キュウリ、ピーマン', '2023-09-03');