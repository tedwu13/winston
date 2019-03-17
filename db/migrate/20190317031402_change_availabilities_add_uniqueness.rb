class ChangeAvailabilitiesAddUniqueness < ActiveRecord::Migration
  def change
    add_index(:availabilities, [:user_id, :available_at], unique: true)
  end
end
