class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :goal
      t.date :completion_date
      t.integer :fundraising_goal
      t.string :how
      t.datetime :end_date
      t.integer :amount_raised
      t.references :charity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
