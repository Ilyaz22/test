class Question < ApplicationRecord
  has_many :answers, dependent: :destroy #каждый вопрос может иметь много ответов
  # при удалении вопроса, также удалять ответы для него
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end 
end
