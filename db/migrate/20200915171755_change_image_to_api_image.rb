class ChangeImageToApiImage < ActiveRecord::Migration[5.2]
  def change
    rename_table :image, :api_image
  end
end
