class AddOrderToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_reference :destinations, :order, null: false, foreign_key: true
  end
end
