# frozen_string_literal: true

class IncomeExpenseStatement < ApplicationRecord
  serialize :statement_data, Array
  belongs_to :user

  def disposable_income
    statement = statement_data.is_a?(Array) ? statement_data : JSON.parse(statement_data)
    income_total = 0.0
    expense_total = 0.0
    statement.each do |data|
      income_total += data[:income_amount].to_f
      expense_total += data[:expense_amount].to_f
    end
    (income_total - expense_total).round(2)
  end

  def income_ratio_calculation
    income_total = 0.0
    expense_total = 0.0
    statement_data.each do |data|
      income_total += data[:income_amount].to_f
      expense_total += data[:expense_amount].to_f
    end

    income_total.zero? ? 0.0 : ((expense_total / income_total) * 100).round(2)
  end

  def income_ratio
    case income_ratio_calculation
    when 0..10
      'A'
    when 10..30
      'B'
    when 30..50
      'C'
    else
      'D'
    end
  end
end
