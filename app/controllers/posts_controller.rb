class PostsController < ApplicationController


	def index
		@posts = current_user.posts
		render :index
	end

	def show
		@post = Post.find(params[:id])
		if @post
			render :show
		else
			flash[:error] = 'Post could not be found'
			redirect_to dashboard_url
		end
	end

	def new
		@post = Post.new
		render :new
	end

	def create
    @markdown = get_markdown_renderer
		@post = Post.new(post_params)
    @post.caption = parse_chat(post_params[:caption]) unless post_params[:caption].nil?
		if @post.save
      render :show, layout: 'layouts/blank'
		else
			flash.now[:error] = @post.errors.full_messages
			render 'dashboards/dashboard'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.owner == current_user
			@post.destroy
			redirect_to posts_url
		else
			flash[:error] = 'Only the owner may delete this blog'
			redirect_to posts_url
		end

	end

	def edit
		@post = Post.find(params[:id])
		render :edit
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)

		if @blog.save
			redirect_to post_url(@post)
		else
			flash.now[:error] = @post.errors.full_messages
			render :edit
		end

	end

	private

	def post_params
		params.require(:post).permit(:title, :media_url, :description, :post_type, :blog_id, :url, :caption)
	end

end
