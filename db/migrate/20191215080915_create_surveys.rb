class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.float :score
      t.string :touchpoint
      t.references :respondentable, type: :uuid, polymorphic: true, null: false
      t.references :requesterable, type: :uuid, polymorphic: true, null: false
      t.string :aasm_state
      t.boolean :marked_as_deleted, default: false

      t.timestamps
    end
  end
end
