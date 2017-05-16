class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_column :users, :password_digest, :string
  end
end
