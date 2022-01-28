class ChangeColumnsAddNotnullOnCustomers < ActiveRecord::Migration[5.2]
  def up

    change_column :customers, :is_deleted, :boolean, null: false
  end
end