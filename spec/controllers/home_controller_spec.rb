# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/InstanceVariable, RSpec/NestedGroups, RSpec/NamedSubject
RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'when not signed in' do
      it 'does not show odds' do
        get :index
        expect(assigns(:odd_percentage)).to be_nil
      end
    end

    context 'when signed in' do
      before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        user = FactoryBot.create(:user)
        sign_in user
      end

      context 'when there are no other users' do
        it 'shows 100% odds' do
          get :index
          expect(assigns(:odd_percentage)).to eq 100
        end
      end

      context 'when there are 1 other user with same raffle' do
        before do
          create(:user, raffle: subject.current_user.raffle)
          # following users won't be taken into account while calculating odds
          create(:user)
          create(:user)
        end

        it 'shows 50% odds' do
          get :index
          expect(assigns(:odd_percentage)).to eq 50
        end
      end
    end
  end
end
# rubocop:enable RSpec/InstanceVariable, RSpec/NestedGroups, RSpec/NamedSubject
