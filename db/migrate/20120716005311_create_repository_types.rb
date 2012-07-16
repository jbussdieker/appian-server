class CreateRepositoryTypes < ActiveRecord::Migration
  def change
    create_table :repository_types do |t|
      t.string :caption

      t.timestamps
    end
  end
end
