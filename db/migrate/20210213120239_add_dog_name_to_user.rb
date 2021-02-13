class AddDogNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dog_name, :string
    add_column :users, :breed, :string
    add_column :users, :size, :string
    add_column :users, :description, :text
    add_column :users, :owner_name, :string
  end
end
