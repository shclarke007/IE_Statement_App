require 'rails_helper'

RSpec.describe IncomeExpenseStatementsController, type: :controller, aggregate_failures: true do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'renders income_expense_statement index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns income_expense_statements' do
        income_expense_statement = create(:income_expense_statement, user: user)
        get :index
        expect(assigns(:income_expense_statements)).to eq([income_expense_statement])
      end
    end

    context 'when user is not logged in' do
      it 'redirects to sign in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'renders in income_expense_statements show template' do
        income_expense_statement = create(:income_expense_statement, user: user)
        get :show, params: { id: income_expense_statement.id }
        expect(response).to render_template(:show)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to sign in page' do
        income_expense_statement = create(:income_expense_statement, user: user)
        get :show, params: { id: income_expense_statement.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'renders income_expense_statements new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to sign in page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
