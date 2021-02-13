class CreateVenuetags < ActiveRecord::Migration[6.0]
  def change
    create_table :venuetags do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
