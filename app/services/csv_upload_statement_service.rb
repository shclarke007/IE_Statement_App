# frozen_string_literal: true

require 'csv'

class CsvUploadStatementService
  def call(file:, current_user:)
    csv_upload = file.read
    statement_data = []
    CSV.parse(csv_upload, headers: true, col_sep: ',') do |row|
      statement_data << {
        income_title: row['Income'],
        income_amount: row['Income Amount'] || 0.0,
        expense_title: row['Expenditure'],
        expense_amount: row['Expenditure Amount'] || 0.0,
        currency: row['Currency'],
        frequency: row['Frequency']
      }
    end
    income_expense_statement = IncomeExpenseStatement.new(
      user_id: current_user.id,
      statement_data: statement_data
    )

    income_expense_statement.save!
    income_expense_statement
  end
end
