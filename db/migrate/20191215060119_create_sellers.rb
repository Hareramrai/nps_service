class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.integer :number_of_listing, default: 0
      t.boolean :marked_as_deleted, default: false

      t.index :email, unique: true
      t.timestamps
    end
  end
end
