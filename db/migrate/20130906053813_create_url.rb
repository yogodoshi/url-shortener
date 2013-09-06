class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shortened
      t.string :original
      t.integer :user_id

      t.timestamps
    end
  end
end
