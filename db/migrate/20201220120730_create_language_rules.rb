class CreateLanguageRules < ActiveRecord::Migration[6.0]
  def change
    create_table :language_rules do |t|
      t.string :name
      t.string :url
      t.references :smart_link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
