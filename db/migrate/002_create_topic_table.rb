class CreateTopicTable < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :vote, default: 0
      t.references :user

      t.timestamps # NELLY's CONVENTION!!!!
    end
  end
end