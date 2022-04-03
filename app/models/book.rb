class Book < ApplicationRecord
  validates :title, :body, :author, presence: true
  validates :title, uniqueness: true

  scope :week, -> { where('created_at > ?', Time.now - (7 * 1.day)) }

  before_validation :set_empty_body

  private

  def set_empty_body
    self.body ||= 'No description'
  end
end
