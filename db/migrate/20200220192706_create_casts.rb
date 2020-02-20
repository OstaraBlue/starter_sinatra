class CreateCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|
      t.integer :actor_id
      t.integer :movie_id
    end
  end
end
