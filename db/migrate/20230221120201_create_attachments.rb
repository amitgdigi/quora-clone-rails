class CreateAttachments < ActiveRecord::Migration[6.1]
    def change
      create_table :attachments do |t|
        t.references :answer, null: false, foreign_key: true
        t.string :attachment
  
        t.timestamps
      end
    end
end
  