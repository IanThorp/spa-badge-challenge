class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :votes
      t.string :title

      t.timestamps null: false
    end
  end
end
