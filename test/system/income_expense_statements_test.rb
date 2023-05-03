require "application_system_test_case"

class IncomeExpenseStatementsTest < ApplicationSystemTestCase
  setup do
    @income_expense_statement = income_expense_statements(:one)
  end

  test "visiting the index" do
    visit income_expense_statements_url
    assert_selector "h1", text: "Income Expense Statements"
  end

  test "creating a Income expense statement" do
    visit income_expense_statements_url
    click_on "New Income Expense Statement"

    click_on "Create Income expense statement"

    assert_text "Income expense statement was successfully created"
    click_on "Back"
  end

  test "updating a Income expense statement" do
    visit income_expense_statements_url
    click_on "Edit", match: :first

    click_on "Update Income expense statement"

    assert_text "Income expense statement was successfully updated"
    click_on "Back"
  end

  test "destroying a Income expense statement" do
    visit income_expense_statements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Income expense statement was successfully destroyed"
  end
end
