class Friend < ApplicationRecord
    belongs_to :user

    validates_presence_of :email, :first_name, :last_name
end
