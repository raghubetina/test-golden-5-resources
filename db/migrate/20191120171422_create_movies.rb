class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.boolean :released
      t.time :a_time
      t.date :a_date
      t.datetime :a_datetime

      t.timestamps
    end
  end
end
