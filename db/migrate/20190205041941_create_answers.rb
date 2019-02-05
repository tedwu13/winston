class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user, index: true
      t.integer :question_id
      t.string :answer_text
    end
  end
end
