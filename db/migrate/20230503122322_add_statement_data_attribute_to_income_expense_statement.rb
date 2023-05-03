class AddStatementDataAttributeToIncomeExpenseStatement < ActiveRecord::Migration[6.1]
  def change
    add_column :income_expense_statements, :statement_data, :text
  end
end
