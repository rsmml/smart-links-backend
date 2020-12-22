class AddColumnMinutesToSmartLink < ActiveRecord::Migration[6.0]
  def change
    add_column :smart_links, :minutes, :integer
  end
end
