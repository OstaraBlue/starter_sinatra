class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.sting :name
      t.datetime :birthday
  end
end