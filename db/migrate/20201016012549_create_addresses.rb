class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      
      t.string     :name,           null: false
      t.string     :phone_number,   null: false
      t.string     :time,           null: false
      t.string     :day,            null: false
      t.string     :building,       null: false
      t.references :item_purchase, foreign_key: true
      t.timestamps
    end
  end
end

