class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :phone, null: false
      t.string :profession
      t.string :email
      t.string :social
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
