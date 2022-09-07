require "rails_helper"

RSpec.describe "friends", type: :request do
    before do 
        user = User.create!(email: "user@example.org", password: "very-secret")
        sign_in user
    end

    describe 'create friend' do
        context 'when valid params' do
            it ' creates a friend' do
                get '/friends/new'

                expect(response).to render_template(:new)
            end
        end
    end
end