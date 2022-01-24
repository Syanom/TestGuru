class Rule < ApplicationRecord
  belongs_to :badge

  # If you add any new fields for rules,
  # don't forget to add them in this validation
  validate :one_rule_assigned

  def assign_badge?(user)
    if !completion.nil?
      check_completion(user)
    elsif !completion_time.nil?
      check_completion_time(user)
    elsif !attempts.nil?
      check_attempts(user)
    else
      errors.add :base, 'Badge rule is invalid'
    end
  end

  private

  def check_completion(user)
    return false if test.test_completions.where(user: user).empty?

    if test.test_completions.where(user: user).any? { |test_completion| test_completion.successful? == true }
      true
    else
      false
    end
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
