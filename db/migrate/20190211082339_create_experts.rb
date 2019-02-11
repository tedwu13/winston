class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :university

      t.timestamps null: false
    end
  end
end
