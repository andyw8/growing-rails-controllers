class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :title, null: false
      t.text :text, null: false
      t.boolean :published, null: false

      t.timestamps null: false
    end
  end
end
