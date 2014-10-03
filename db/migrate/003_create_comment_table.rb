class CreateCommentTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.references :user
      t.references :topic

      t.timestamps # NELLY's CONVENTION!!!!
    end
  end
end