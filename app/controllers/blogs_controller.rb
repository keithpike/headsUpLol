class BlogsController < ApplicationController
	before_action :check_logged_in
	before_action only: :edit 

	def index
		@blogs = current_user.blogs
		render :index
	end

	def show
		@blog = Blog.find(params[:id])
		@posts = @blog.posts
		render :show
	end

	def new
		@blog = Blog.new
		render :new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.owner_id = current_user.id

		if @blog.save
			redirect_to blog_url(@blog)
		else
			flash.now[:error] = @blog.errors.full_messages
			render :new
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		if @blog.owner == current_user
			@blog.destroy
			redirect_to blogs_url
		else
			flash[:error] = 'Only the owner may delete this blog'
			redirect_to blogs_url
		end
		
	end

	def edit
		@blog = Blog.find(params[:id])
		render :edit
	end

	def update
		@blog = Blog.find(params[:id])
		@blog.update_attributes(blog_params)

		if @blog.save
			redirect_to blog_url(@blog)
		else
			flash.now[:error] = @blog.errors.full_messages
			render :edit
		end

	end

	private

	def blog_params
		params.require(:blog).permit(:title, :url, :description, :avatar_url, :primay)
	end



end
