class TheoriesController < ApplicationController
  include TopicsHelper
  before_action :set_theory, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  # GET /theories
  # GET /theories.json
  def index
    topic_ids = []

    # Get topic id for current user
    get_topics.each do |topic| 
      topic_ids << topic.id 
    end

    @theories = Theory.where(topic_id: topic_ids).paginate(:page => params[:page], :per_page => 12)
  end

  # GET /theories/1
  # GET /theories/1.json
  def show
  end

  # GET /theories/new
  def new
    @theory = Theory.new
  end

  # GET /theories/1/edit
  def edit
  end

  # POST /theories
  # POST /theories.json
  def create
    @theory = Theory.new(theory_params)

    respond_to do |format|
      if @theory.save
        format.html { flash[:success] = t(:theory_was_successfully_created); redirect_to @theory}
        format.json { render action: 'show', status: :created, location: @theory }
      else
        format.html { render action: 'new' }
        format.json { render json: @theory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theories/1
  # PATCH/PUT /theories/1.json
  def update
    respond_to do |format|
      if @theory.update(theory_params)
        format.html { flash[:success] = t(:theory_was_successfully_updated); redirect_to @theory}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @theory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theories/1
  # DELETE /theories/1.json
  def destroy
    @theory.destroy
    respond_to do |format|
      format.html { redirect_to theories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theory
      @theory = Theory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theory_params
      params.require(:theory).permit(:topic_id, :name, :theory_text)
    end
end
