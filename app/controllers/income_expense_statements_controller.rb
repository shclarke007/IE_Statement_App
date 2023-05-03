class IncomeExpenseStatementsController < ApplicationController
  before_action :set_income_expense_statement, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /income_expense_statements or /income_expense_statements.json
  def index
    @income_expense_statements = IncomeExpenseStatement.all
  end

  # GET /income_expense_statements/1 or /income_expense_statements/1.json
  def show
  end

  # GET /income_expense_statements/new
  def new
    @income_expense_statement = IncomeExpenseStatement.new
  end

  # GET /income_expense_statements/1/edit
  def edit
  end

  # POST /income_expense_statements or /income_expense_statements.json
  def create
    @income_expense_statement = IncomeExpenseStatement.new(income_expense_statement_params)

    respond_to do |format|
      if @income_expense_statement.save
        format.html { redirect_to income_expense_statement_url(@income_expense_statement), notice: "Income expense statement was successfully created." }
        format.json { render :show, status: :created, location: @income_expense_statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @income_expense_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_expense_statements/1 or /income_expense_statements/1.json
  def update
    respond_to do |format|
      if @income_expense_statement.update(income_expense_statement_params)
        format.html { redirect_to income_expense_statement_url(@income_expense_statement), notice: "Income expense statement was successfully updated." }
        format.json { render :show, status: :ok, location: @income_expense_statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @income_expense_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_expense_statements/1 or /income_expense_statements/1.json
  def destroy
    @income_expense_statement.destroy

    respond_to do |format|
      format.html { redirect_to income_expense_statements_url, notice: "Income expense statement was successfully destroyed." }
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
      params.fetch(:income_expense_statement, {})
    end
end
