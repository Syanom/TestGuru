class Rule < ApplicationRecord
  belongs_to :badge

  validate :one_rule_assigned

  def count_badges_to_assign(user)
    return check_completion(user) unless completion.nil?
    return check_completion_time(user) unless completion_time.nil?
    return check_attempts(user) unless attempts.nil?
  end

  private

  def check_completion(user)
    result = Array.new(badge.tests.length, 0)
    i = 0
    badge.tests.each do |test|
      test.test_completions.where(user: user).each do |test_completion|
        result[i] += 1 if test_completion.successful?
      end
      i += 1
    end
    result.min
  end

  def check_completion_time(user)
    result = Array.new(badge.tests.length, 0)
    completion_time_in_sec = completion_time.hour * 3600 + completion_time.min * 60 + completion_time.sec
    i = 0
    badge.tests.each do |test|
      test.test_completions.where(user: user).each do |test_completion|
        result[i] += 1 if test_completion.successful? && test_completion.completion_time <= completion_time_in_sec
      end
      i += 1
    end
    result.min
  end

  def check_attempts(user)
    result = 1
    badge.tests.each do |test|
      failed_attempts = 0
      successful = false
      test_completions = test.test_completions.where(user: user)
      test_completions.each do |test_completion|
        failed_attempts += 1 unless test_completion.successful?
        successful = true if test_completion.successful?
      end
      result = 0 if failed_attempts >= attempts || test_completions.empty? || !successful
    end
    result
  end

  def one_rule_assigned
    available_rules = [attempts, completion_time, completion]
    rules_in_use_counter = 0
    available_rules.each do |rule|
      rules_in_use_counter += 1 unless rule.nil?
    end
    errors.add :base, 'One and only one rule must be assigned.' if rules_in_use_counter != 1
  end
end
