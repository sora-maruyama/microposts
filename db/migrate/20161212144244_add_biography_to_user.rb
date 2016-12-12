class AddBiographyToUser < ActiveRecord::Migration
  def change
    add_column :users, :biography, :string
  end
end
