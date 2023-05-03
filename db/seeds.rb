# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.where(email: 'tester@example.com').first_or_initialize(email: 'tester@example.com', password: 'pazzw0rd', password_confirmation: 'pazzw0rd')
5.times do
  # Generate statement data
  statement_data = []
  10.times do
    statement_data << {
      income_title: Faker::Lorem.word,
      income_amount: Faker::Number.decimal(l_digits: 4),
      expense_title: Faker::Lorem.word,
      expense_amount: Faker::Number.decimal(l_digits: 4),
      currency: Faker::Currency.code,
      frequency: %w[monthly yearly].sample
    }
  end

  # Create the income expense statement
  IncomeExpenseStatement.create!(
    user_id: user.id,
    statement_data: statement_data
  )
end
