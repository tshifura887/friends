require 'rails_helper'

RSpec.describe 'friends', type: :feature do 

    describe 'get friends' do
    
    end

    describe 'create friend' do
       
        scenario 'when params are valid' do
            friend = Friend.new(first_name: 'Talifhani', last_name: 'Tshifura', email: 'tali@example.com', phone: '0790836007')
            click_link 'New Friend'

            expect(page).to have_content('Add New Friend')

            fill_in 'First Name', with: friend.first_name
            fill_in 'Last Name', with: friend.last_name
            fill_in 'Email', with: friend.email

            click_button 'Create Friend'

            expect(page).to have_content("Friend was successfully created.")
            expect(page).to have_content(friend.first_name)
        end

        scenario 'when params are invlid' do 
            friend = Friend.new(first_name: 'Talifhani', last_name: 'Tshifura', email: 'tali@example.com', phone: '0790836007')

            click_link 'New Friend'

            expect(page).to have_content('Add New Friend')

            fill_in 'First Name', with: ''
            fill_in 'Last Name', with: ''
            fill_in 'Email', with: ''

            click_button 'Create Friend'

            expect(page).to have_content("Email can't be blank")
        end
    end
end