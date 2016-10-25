class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id

      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

  end
end
