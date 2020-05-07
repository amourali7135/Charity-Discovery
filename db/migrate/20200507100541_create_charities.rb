class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.integer :aged
      t.string :instagram
      t.string :facebook
      t.string :website
      t.string :city
      t.string :country
      t.integer :income
      t.string :country_focus
      t.integer :size
      t.integer :program_percentage
      t.integer :cost_to_100
      t.boolean :fiveohone
      t.integer :phone
      t.string :email
      t.text :mission
      t.text :goal
      t.integer :age
      t.string :issues
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
