class AddingTeamApiColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :team_api_id, :integer
  end
end
