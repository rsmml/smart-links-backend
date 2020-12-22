class ChangeLimitMinutesTableSmartLink < ActiveRecord::Migration[6.0]
  def change
    change_column :smart_links, :minutes, :integer, limit: 8
  end
end
