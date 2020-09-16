class ChangeImagesToApiImage < ActiveRecord::Migration[5.2]
  def change
    rename_table :images, :api_images
  end
end
