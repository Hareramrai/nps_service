class Survey < ApplicationRecord
  include AASM

  # validations
  validates :score, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }

  validates :touchpoint, presence: true

  # relations
  belongs_to :respondentable, polymorphic: true
  belongs_to :requesterable, polymorphic: true

  aasm do
    state :pending, initial: true
    state :completed, :expired

    event :complete do
      transitions from: %i[pending completed], to: :completed
    end

    event :expire do
      transitions from: :pending, to: :expired
    end
  end
end
