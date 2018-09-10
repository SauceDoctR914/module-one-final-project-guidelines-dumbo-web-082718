class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.integer :lvl
      t.integer :total_exp
      t.integer :lvl_exp
      t.integer :vit
      t.integer :pwr
      t.integer :mnd
      t.integer :agl
      t.integer :character_id
    end
  end
end
