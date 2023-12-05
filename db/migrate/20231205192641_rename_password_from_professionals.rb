class RenamePasswordFromProfessionals < ActiveRecord::Migration[7.1]
  def change
    rename_column :professionals, :password, :password_digest
  end
end
