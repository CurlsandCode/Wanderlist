class AddTimestampToPlaces < ActiveRecord::Migration
  def change
	  change_table :places do |t|
      t.timestamps
	 end
  end
end
