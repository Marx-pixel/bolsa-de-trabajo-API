class Company < ApplicationRecord
    has_many :job_offers

    validates :name, :password, presence: true
    validates :name, uniqueness: true
    validates :password, length: { minimum: 5 }
end
