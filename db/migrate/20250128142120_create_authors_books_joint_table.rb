class CreateAuthorsBooksJointTable < ActiveRecord::Migration[7.2]
  def change
    create_table :authors_books_joint_tables do |t|
      t.references :author, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
