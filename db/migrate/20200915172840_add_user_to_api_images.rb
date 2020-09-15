class AddUserToApiImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :api_images, :user, foreign_key: true
  end
end
