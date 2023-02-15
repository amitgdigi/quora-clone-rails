class RemoveTopicIdFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :questions, :topic, null: false, foreign_key: true
  end
end
