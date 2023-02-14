class AddTopicIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :topic, null: false, foreign_key: true
  end
end
