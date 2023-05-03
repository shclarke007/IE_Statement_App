class IncomeExpenseStatement < ApplicationRecord
  serialize :statement_data, Array
  belongs_to :user
end
