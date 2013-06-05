class CreateTableReaders < ActiveRecord::Migration
  def up
    create_table :readers do |t|
      t.string :email
      t.string :password
    end
  end

  def down
    drop_table :readers
  end
end
