class TextbooksController < ApplicationController
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]
  #before_action :set_textbook, only: [:show]
  #before_action :authorize_resource!, except: [:new, :index, :show]
=begin
  def search
    @search = Post.search(:include => [:comments]) do
      keywords(params[:q])
    end
  end
=end
  # GET /textbooks
  # GET /textbooks.json
  def index
    @textbooks = Textbook.all
    @search = Textbook.search do
      fulltext params[:search]
    end
    @textbooks = @search.results
  end

  # GET /textbooks/1
  # GET /textbooks/1.json
  def show
  end

  # GET /textbooks/new
  def new
    #@textbook = Textbook.new
    @textbook = current_user.textbooks.build
  end

  # GET /textbooks/1/edit
  def edit
    if not @textbook.user_email == current_user.email || current_user.email == "codeinflash@gmail.com"
      redirect_to @textbook
    end
  end

  # POST /textbooks
  # POST /textbooks.json
  def create
    #@textbook = Textbook.new(textbook_params)
    @textbook = current_user.textbooks.build(textbook_params)
    @textbook.user_email = current_user.email

    respond_to do |format|
      if @textbook.save
        #format.html { redirect_to @textbook, notice: 'Textbook was successfully created.' }
        format.html { redirect_to @textbook }
        #format.json { render :show, status: :created, location: @textbook }
        flash[:success] = "Textbook was successfully created."
      else
        format.html { render :new }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textbooks/1
  # PATCH/PUT /textbooks/1.json
  def update
    respond_to do |format|
      if @textbook.update(textbook_params)
        #format.html { redirect_to @textbook, notice: 'Textbook was successfully updated.' }
        format.html { redirect_to @textbook }
        format.json { render :show, status: :ok, location: @textbook }
        flash[:success] = "Textbook was successfully updated."
      else
        format.html { render :edit }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textbooks/1
  # DELETE /textbooks/1.json
  def destroy
    @textbook.destroy
    respond_to do |format|
      #format.html { redirect_to textbooks_url, notice: 'Textbook was successfully destroyed.' }
      format.html { redirect_to textbooks_url }
      format.json { head :no_content }
      flash[:alert] = "Textbook was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_textbook
      @textbook = Textbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def textbook_params
      params.require(:textbook).permit(:title, :subject, :price, :offer, :user_email, :description)
    end
end
