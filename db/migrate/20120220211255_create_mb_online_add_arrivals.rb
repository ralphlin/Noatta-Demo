class CreateMbOnlineAddArrivals < ActiveRecord::Migration
  def change
    create_table :mb_online_add_arrivals do |t|
      t.string :status
      t.string :message

      t.timestamps
    end
  end
end
