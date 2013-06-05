class RemovePasswordClomnFromReader < ActiveRecord::Migration
def change
    remove_column :readers, :password, :string
  end
end
