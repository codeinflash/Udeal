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
    @textbook = Textbook.new
  end

  # GET /textbooks/1/edit
  def edit
  end

  # POST /textbooks
  # POST /textbooks.json
  def create
    @textbook = Textbook.new(textbook_params)
    @textbook.user_email = current_user.email

    respond_to do |format|
      if @textbook.save
        format.html { redirect_to @textbook, notice: 'Textbook was successfully created.' }
        #format.json { render :show, status: :created, location: @textbook }
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
        format.html { redirect_to @textbook, notice: 'Textbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @textbook }
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
      format.html { redirect_to textbooks_url, notice: 'Textbook was successfully destroyed.' }
      format.json { head :no_content }
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
