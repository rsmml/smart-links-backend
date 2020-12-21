class DeleteStatusColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :logged_in
  end
end
