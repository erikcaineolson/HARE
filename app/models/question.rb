class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_one :response, dependent: :destroy
  accepts_nested_attributes_for :response
end
