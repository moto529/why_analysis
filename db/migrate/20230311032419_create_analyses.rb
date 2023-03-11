class CreateAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :analyses do |t|
      t.string :target

      t.timestamps
    end
  end
end
