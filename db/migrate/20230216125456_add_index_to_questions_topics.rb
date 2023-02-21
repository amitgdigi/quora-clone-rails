class AddIndexToQuestionsTopics < ActiveRecord::Migration[6.1]
  def up
    add_index :question_topics, [:question_id, :topic_id] , unique: true
  end
  def down
    remove_index :question_tpics, name: "index_question_topics_on_question_id_and_topic_id"
  end
end
