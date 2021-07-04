class Candidate < ApplicationRecord
    has_many :postulations
    has_many :job_offers, through: :postulations

    validates :name, :password, presence: true
    validates :name, uniqueness: true
    validates :password, length: { minimum: 5 }
end
