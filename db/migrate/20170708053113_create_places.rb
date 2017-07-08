class CreatePlaces < ActiveRecord::Migration
  def change
      create_table :places do |t|
        t.string  :name
        t.string  :content
        t.integer :user_id
        t.integer :list_id
      end
   end
end
