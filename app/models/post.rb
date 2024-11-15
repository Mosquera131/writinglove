class Post < ApplicationRecord
  belongs_to :user
  enum category: { fiction: "fiction", Nofiction: "nofiction", education: "education" }
  has_many :comments, dependent: :destroy

  # validations for the Post model.

  validates :category, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  # Scope to allow the user and admin to find a category
  scope :post_fiction, -> { where(category: Post.categories[:fiction]) }
  scope :post_no_fiction, -> { where(category: Post.categories[:nofiction]) }
  scope :post_education, -> { where(category: Post.categories[:education]) }

  # callbacks for Post
  before_validation :check_content_length

 private
    def check_content_length
        if content.present? && content.length > 250
          Rails.logger.info "you are close to the maximum characters."
          # Aquí puedes realizar cualquier acción, como enviar notificaciones, logs, etc.
        end
    end
end
