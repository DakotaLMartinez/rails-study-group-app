class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :coach
      t.string :name
      t.string :city
      t.string :sport

      t.timestamps
    end
  end
end
