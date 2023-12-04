class AddPhoneToProfessionals < ActiveRecord::Migration[7.1]
  def change
    add_column :professionals, :phone, :string
  end
end
