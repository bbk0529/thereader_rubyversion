class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :sender
      t.string :subject
      t.text :text
      t.date :date
      t.integer :wordcount
      t.string :language
      t.timestamps
    end
  end
end
