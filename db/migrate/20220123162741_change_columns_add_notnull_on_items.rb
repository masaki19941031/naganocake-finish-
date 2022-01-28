class ChangeColumnsAddNotnullOnItems < ActiveRecord::Migration[5.2]
  def up
        change_column :items, :is_active, :boolean, null: false
  end
end
