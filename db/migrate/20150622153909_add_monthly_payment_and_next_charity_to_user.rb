class AddMonthlyPaymentAndNextCharityToUser < ActiveRecord::Migration
  def change
    add_column :users, :monthly_payment, :float
    add_column :users, :next_donation, :integer
  end
end
