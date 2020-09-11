class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :access_token
      t.string :refresh_token
      t.string :uid
      t.string :avatar

      t.timestamps
    end
  end
end
