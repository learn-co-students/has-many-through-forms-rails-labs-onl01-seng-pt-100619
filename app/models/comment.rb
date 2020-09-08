class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank?}


  def user_attributes(user_attributes)
    user_attributes.values.each do |user_attributes|
      if user_attributes[:username].present?
        user = User.find_or_create_by(user_attributes)
        if !self.user = user
          self.build_user(:username => user[:username])
        end
      end
    end
  end
  # accepts_nested_attributes_for :user

  # def user_attributes=(user_attributes)
  #   self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
  # end

  # accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['title'].blank? }

  
  # def user_attributes=(user_attributes)
  #     user = User.find_or_create_by(user_attribute)
  #     self.user = user
  # end

end
