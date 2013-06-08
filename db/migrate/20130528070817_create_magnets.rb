class CreateMagnets < ActiveRecord::Migration
  def change
    create_table :magnets do |t|

      t.text :url, :null => false

      t.references :user

      t.timestamps
    end
    add_index :magnets, :user_id
  end
end
