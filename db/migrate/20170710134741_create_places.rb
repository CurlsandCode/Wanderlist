class CreatePlaces < ActiveRecord::Migration
  def change
       create_table :places do |t|
      t.string :name
      t.string :content
      t.integer :list_id
      t.integer :user_id
    end
  end
end
