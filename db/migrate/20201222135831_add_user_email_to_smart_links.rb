class AddUserEmailToSmartLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :smart_links, :user_email, :string
  end
end
