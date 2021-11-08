class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answers_amount
    errors.add(:answers_amount, "You can't add more than 4 answers to a question") unless question.answers.count < 4
  end
end
