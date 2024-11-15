class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

# validations for the Comment model
validates :post, presence: true
validates :content, presence: true

# callback
before_save :bekind
private
def bekind
  if content.present? && !content.downcase.include?("por favor sé amable")
    self.content = "#{content.strip}\n\nPor favor, sé amable 😊"
  end
end
end
