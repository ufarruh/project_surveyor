class Question < ApplicationRecord
  belongs_to :survey, inverse_of: :questions
end
