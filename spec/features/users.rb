require 'rails_helper'

RSpec.describe 'users', type: :feature do 

    describe 'Sign Up' do 
        scenario 'when valid params' do
            visit friends_path
            click_link 'Sign Up'

            expect(page).to have_content('Sign Up')

            fill_in 'Email' ,with: "tali@example.com"
            fill_in 'Password', with: '235689'
            fill_in 'Password Confirmation', with: '235689'

            click_button "Sign up"

            expect(page).to have_content("Welcome! You have signed up successfully.")
        end

        scenario 'when valid params' do
            visit friends_path
            click_link 'Sign Up'

            expect(page).to have_content('Sign Up')

            fill_in 'Email' ,with: ""
            fill_in 'Password', with: ''
            fill_in 'Password Confirmation', with: ''

            click_button "Sign up"

            expect(page).to have_content("Email can't be blank")
        end
    end

    describe 'Sign in' do
        user = User.create(email: 'friends@example.com', password: '235689')

        scenario 'when valid params' do
            visit friends_path
            click_link 'Sign In'

            expect(page).to have_content('Log in')
            expect(page).to have_content('Sign up')

            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password

            click_button "Log in"

            expect(page).to have_content('Signed in successfully.')
        end

        scenario 'when valid params' do
            visit friends_path
            click_link 'Sign In'

            expect(page).to have_content('Log in')
            expect(page).to have_content('Sign up')


            fill_in 'Email', with: ''
            fill_in 'Password', with: ''

            click_button "Log in"

            expect(page).to have_content('Log in')
        end
    end

    describe 'Edit profile' do

        user = User.create(email: 'friends@example.com', password: '235689')

        before do 
            visit friends_path
            click_link 'Sign In'

            expect(page).to have_content('Log in')
            expect(page).to have_content('Sign up')

            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password

            click_button "Log in"

            expect(page).to have_content('Signed in successfully.')
        end

        scenario 'when valid params' do
    
            visit friends_path
            click_link 'Edit Profile'

            fill_in 'Email', with: 'friend@example.com'
            fill_in 'Password', with: '2356891'
            fill_in 'Password Confirmation', with: '2356891'
            fill_in 'Current Password', with: '235689'

            click_button 'Update'

            expect(page).to have_content("Your account has been updated successfully.")
        end

        scenario 'when invalid params' do
    
            visit friends_path
            click_link 'Edit Profile'

            fill_in 'Email', with: ''
            fill_in 'Password', with: ''
            fill_in 'Password Confirmation', with: ''
            fill_in 'Current Password', with: ''

            click_button 'Update'

            expect(page).to have_content("Current password can't be blank")
        end
    end
end