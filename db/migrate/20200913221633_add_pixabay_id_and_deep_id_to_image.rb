class AddPixabayIdAndDeepIdToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :pixabay_id, :string
    add_column :images, :deep_id, :string
  end
end
