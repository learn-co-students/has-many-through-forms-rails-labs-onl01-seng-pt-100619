class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute["name"].present?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.post_categories.build(category: category)
  #   end
  # end

  # def unique_commenters
  #     unique_users = User.find(self.comments.pluck(:user_id))
  #     unique_users
  # end



  # post.comments [comment objs]%>
  # post.comments.user [user obj]%>
  # users << post.comments.user [user objs]%>
  # users.uniq [unique users]%>


end
