class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :nome
      t.text :url

      t.timestamps
    end
  end
end
