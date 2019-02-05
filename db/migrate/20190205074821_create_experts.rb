class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :university

      t.timestamps null: false
    end
  end
end
