class UserTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_teams do |t|
      t.integer :user_id
      t.integer :team_id
    end
  end
end
