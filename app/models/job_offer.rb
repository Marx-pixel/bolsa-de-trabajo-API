class JobOffer < ApplicationRecord
    belongs_to :company
    has_many :postulations
    has_many :candidates, through: :postulations

    validates :name, :description, presence: true
end
