class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.find_or_create_by(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end



# <%= render 'form', post: Post.new %>
# <%= form_for @post do |f| %>
#     <%= f.label "Title" %>
#     <%= f.text_field :title %>
#     <%= f.label "Content" %>
#     <%= f.text_field :content %>
#     <%= f.collection_check_boxes :category_ids, Category.all, :id, :name %>
#     <%- f.submit %>
#     <% end %>
    
#     <%= link_to post.title, post_path(@post.id) %>