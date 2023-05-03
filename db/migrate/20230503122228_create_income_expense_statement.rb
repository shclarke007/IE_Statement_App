class CreateIncomeExpenseStatement < ActiveRecord::Migration[6.1]
  def change
    create_table :income_expense_statements do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
