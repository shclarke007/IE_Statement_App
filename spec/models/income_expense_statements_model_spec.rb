# frozen_string_literal: true

require './spec/rails_helper'

RSpec.describe IncomeExpenseStatement, type: :model, aggregate_failures: true do
  let(:user) { create(:user) }
  let(:statement_data) { [{ income_amount: 100, expense_amount: 50 }, { income_amount: 200, expense_amount: 75 }] }
  let(:income_expense_statement) { create(:income_expense_statement, user: user, statement_data: statement_data) }

  describe '#disposable_income' do
    it 'calculates disposable income correctly' do
      expect(income_expense_statement.disposable_income).to eq(175.0)
    end
  end

  describe '#income_ratio_calculation' do
    it 'calculates income ratio correctly' do
      expect(income_expense_statement.income_ratio_calculation).to eq(41.67)
    end
  end

  describe '#income_ratio' do
    it 'returns the correct income ratio classification' do
      expect(income_expense_statement.income_ratio).to eq('C')
    end
  end
end
