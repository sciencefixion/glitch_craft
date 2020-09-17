class AddKeyToApiImage < ActiveRecord::Migration[5.2]
  def change
    add_column :api_images, :key, :string
  end
end
