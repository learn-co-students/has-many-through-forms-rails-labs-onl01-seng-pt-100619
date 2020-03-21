class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }

  def comment_attributes=(comment_user_attributes)
    comment_user_attributes.values.each do |user_attributes_username|
      comment = Comment.find_or_create_by(user_attributes_username)
        self.comments << comment
    end
  end

end