
class CreateMetapis < ActiveRecord::Migration[5.1]
  def change
    create_table :metapis do |t|
      t.string :sender
      t.date :date
      t.timestamps
    end
  end
end