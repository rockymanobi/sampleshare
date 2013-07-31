class CreateSampleslides < ActiveRecord::Migration
  def change
    create_table :sampleslides do |t|
      t.string :title
      t.string :content, :limit=>8000

      t.timestamps
    end
  end
end
