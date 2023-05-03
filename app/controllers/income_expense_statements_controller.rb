# frozen_string_literal: true

class IncomeExpenseStatementsController < ApplicationController
  before_action :set_income_expense_statement, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    @income_expense_statements = current_user.income_expense_statements.order(created_at: :desc)
    @statements_by_date = current_user.income_expense_statements.group_by { |statement| statement.created_at.to_date }
  end

  def show; end

  def new
    @income_expense_statement = IncomeExpenseStatement.new
  end

  def create
    income_expense_statement_params = parse_statement_input
    
    @income_expense_statement = IncomeExpenseStatement.new(income_expense_statement_params)
    if @income_expense_statement.save
      redirect_to income_expense_statements_url, notice: 'Income and expense statement was successfully added!'
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @income_expense_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    uploaded_file = params[:file]
    unless uploaded_file.content_type == 'text/csv'
      return redirect_to income_expense_statements_url,
                         notice: 'Only CSV file types allowed'
    end

    CsvUploadStatementService.new.call(file: uploaded_file, current_user: current_user)
    redirect_to income_expense_statements_url, notice: 'Statement uploaded successfully!'
  end

  def destroy
    @income_expense_statement.destroy

    respond_to do |format|
      format.html do
        redirect_to income_expense_statements_url, notice: 'Income expense statement was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_income_expense_statement
    @income_expense_statement = IncomeExpenseStatement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def income_expense_statement_params
    params.require(:income_expense_statement).permit(:statement_data)
  end

  def parse_statement_input
    if params[:income_expense_statement][:statement_data].is_a?(String)
      statement_input = JSON.parse(params[:income_expense_statement][:statement_data])
    end

    { statement_data: statement_input, user_id: current_user.id }
  end
end
