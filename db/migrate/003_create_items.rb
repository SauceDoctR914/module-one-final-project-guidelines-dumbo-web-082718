class CreateItems < ActiveRecord::Migration[5.1]
  create_table :items do |t|
    t.string :name
  end
end
