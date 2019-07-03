class RemoveIsExpertFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_expert
  end
end
