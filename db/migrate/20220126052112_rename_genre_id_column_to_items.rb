class RenameGenreIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :genre_id_id, :genre_id
  end
end
