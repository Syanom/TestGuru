class Rule < ApplicationRecord
  belongs_to :badge

  # If you add any new fields for rules,
  # don't forget to add them in this validation
  validate :one_rule_assigned

  def count_badges_to_assign(user)
    return check_completion(user) unless completion.nil?
    return check_completion_time(user) unless completion_time.nil?
    return check_attempts(user) unless attimpts.nil?
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

  def one_rule_assigned
    available_rules = [attempts, completion_time, completion]
    rules_in_use_counter = 0
    available_rules.each do |rule|
      rules_in_use_counter += 1 unless rule.nil?
    end
    errors.add :base, 'One and only one rule must be assigned' if rules_in_use_counter != 1
  end
end
