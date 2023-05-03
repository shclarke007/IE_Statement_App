# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CsvUploadStatementService do
  let(:user) { create(:user) }
  let(:file) { fixture_file_upload('statement.csv', 'text/csv') }

  describe '#call' do
    subject(:statement) { described_class.new.call(file: file, current_user: user) }

    it 'creates a new income expense statement' do
      expect { statement }.to change(IncomeExpenseStatement, :count).by(1)
    end

    it 'associates the statement with the correct user' do
      expect(statement.user).to eq(user)
    end

    it 'parses the CSV file and creates the correct statement data' do
      expect(statement.statement_data).to match_array([
        {
          income_title: 'Salary',
          income_amount: '5000',
          expense_title: 'Rent',
          expense_amount: '1500',
          currency: 'GBP',
          frequency: 'Monthly'
        }
      ])
    end
  end
end
