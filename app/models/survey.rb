class Survey < ApplicationRecord
  has_many :questions, inverse_of: :survey

  accepts_nested_attributes_for :questions,
                                 reject_if: :all_blank,
                                 allow_destroy: true


  validates :title, presence: true,
                    length: { within: 1..64 }

  validates :description, presence: :true,
                      length: { within: 1..240 }
end
