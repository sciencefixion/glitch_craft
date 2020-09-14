class RemoveColumnSourceIdFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :source_id
  end
end
