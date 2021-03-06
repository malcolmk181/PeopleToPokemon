class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /posts or /posts.json
  def index
    @posts = Post.all.sort_by { |p| p.likes }.reverse!
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    self.authorize_edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = User.find_by(id: session[:user_id])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:person_id, :pokemon_id, :pokemon_name, :content)
    end

    def authorize_page
      redirect_to login_path unless session[:user_id]
    end

    def authorize_edit
      redirect_to login_path unless session[:user_id]
      if @post.user.id != session[:user_id]
        flash[:error] = "Must be signed in to correct account to edit post."
        redirect_to post_path(@post)
      end
    end

    def record_not_found
      redirect_to posts_path
    end

end