class CreatePlayers < ActiveRecord::Migration[5.1]
    def change
        create_table :players do |t|
            t.string :name
            t.integer :team_id
        end
    end
end