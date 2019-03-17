class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :user, index: true
      t.datetime :available_at
    end
  end
end
