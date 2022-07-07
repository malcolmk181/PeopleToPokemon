class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    authorize_page
    @post = Post.find(params[:id])
    puts @post.id
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(@comment.post_id)
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = User.find(session[:user_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@comment.post), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :content, :vote)
    end

    def authorize_page
      redirect_to login_path unless session[:user_id]
    end

    
end
