class CreateUserPlaces < ActiveRecord::Migration
  def change
      create_table :user_places do |t|
        t.integer :place_id
        t.integer :user_id
        t.boolean :visited?, default: false
      end
   end
end
