class Realtor < ApplicationRecord
  include Surveyable

  # validations
  validates :first_name, :last_name, :email, :phone, :date_of_birth, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  # relations
end
