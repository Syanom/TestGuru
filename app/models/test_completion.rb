class TestCompletion < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question
  before_create :set_timer

  SUCCESS_RATIO = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if !completed? && correct_answer?(answer_ids)
    save!
  end

  def completed?
    deadline.nil? ? current_question.nil? : current_question.nil? || DateTime.current >= deadline
  end

  def current_question_number
    self.test.questions.index(current_question) + 1
  end

  def calculate_result
    (correct_questions.to_f / test.questions.count * 100).round(2)
  end

  def successful?
    calculate_result > SUCCESS_RATIO
  end

  def completion_time
    updated_at - created_at
  end

  private

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def set_current_question
    self.current_question = next_question
  end

  def set_timer
    unless test.timer.nil?
      self.deadline = Time.current.round + test.timer.hour * 3600 + test.timer.min * 60 + test.timer.sec
    end
  end
end
