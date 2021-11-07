class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  def destroy
    raise "You can't delete the only answer of the question" unless question.answers.count > 1

    super
  end

  private

  def answers_amount
    errors.add(:answers_amount, "You can't add more than 4 answers to a question") unless question.answers.count < 4
  end
end
