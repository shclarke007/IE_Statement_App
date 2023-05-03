require "test_helper"

class IncomeExpenseStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income_expense_statement = income_expense_statements(:one)
  end

  test "should get index" do
    get income_expense_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_income_expense_statement_url
    assert_response :success
  end

  test "should create income_expense_statement" do
    assert_difference('IncomeExpenseStatement.count') do
      post income_expense_statements_url, params: { income_expense_statement: {  } }
    end

    assert_redirected_to income_expense_statement_url(IncomeExpenseStatement.last)
  end

  test "should show income_expense_statement" do
    get income_expense_statement_url(@income_expense_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_expense_statement_url(@income_expense_statement)
    assert_response :success
  end

  test "should update income_expense_statement" do
    patch income_expense_statement_url(@income_expense_statement), params: { income_expense_statement: {  } }
    assert_redirected_to income_expense_statement_url(@income_expense_statement)
  end

  test "should destroy income_expense_statement" do
    assert_difference('IncomeExpenseStatement.count', -1) do
      delete income_expense_statement_url(@income_expense_statement)
    end

    assert_redirected_to income_expense_statements_url
  end
end
