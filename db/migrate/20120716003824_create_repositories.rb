class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.integer :repository_type_id
      t.integer :project_id
      t.string :url

      t.timestamps
    end

    add_index :repositories, :repository_type_id
    add_index :repositories, :project_id
  end
end
