class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :content, null: false
      t.references :guestbook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
