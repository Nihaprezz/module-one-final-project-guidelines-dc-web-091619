class CreateStatsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :team_api_id
      t.string  :team_name
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :goals_for
      t.integer :goals_against
      t.integer :standing
    end
  end
end
