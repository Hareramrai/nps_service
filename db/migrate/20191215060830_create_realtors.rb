class CreateRealtors < ActiveRecord::Migration[6.0]
  def change
    create_table :realtors, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.float :ratings, default: 0.0
      t.integer :number_of_deals_completed, default: 0
      t.integer :number_of_deals_taken, default: 0
      t.boolean :marked_as_deleted, default: false

      t.index :email, unique: true
      t.timestamps
    end
  end
end
