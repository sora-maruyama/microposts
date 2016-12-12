class AddStateToUser < ActiveRecord::Migration
  def change
    add_column :users, :state, :text
  end
end
