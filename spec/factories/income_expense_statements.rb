FactoryBot.define do
  factory :income_expense_statement do
    statement_data { [{ income_title: 'income', income_amount: 100, frequency: 'monthly', currency: 'GBP' }, { expense_title: 'income', expense_amount: 50, frequency: 'monthly', currency: 'GBP' }] }
    user { FactoryBot.create(:user) }
  end
end
