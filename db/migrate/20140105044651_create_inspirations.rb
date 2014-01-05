class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.integer :user_id
      t.string :title, limit: 32
      t.text :contents

      t.timestamps
    end
  end
end
