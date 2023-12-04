class CreateProfessionals < ActiveRecord::Migration[7.1]
  def change
    create_table :professionals do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
