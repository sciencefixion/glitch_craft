class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.string :source_id
      t.string :source

      t.timestamps
    end
  end
end
