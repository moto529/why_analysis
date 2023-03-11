class CreateIsWhies < ActiveRecord::Migration[6.1]
  def change
    create_table :is_whies do |t|
      t.string :result, null: false
      t.references :analysis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
