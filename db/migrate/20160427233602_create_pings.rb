class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.string :url
      t.string :name

      t.timestamps null: false
    end
  end
end
