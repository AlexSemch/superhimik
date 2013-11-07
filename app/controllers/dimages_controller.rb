class DimagesController < ApplicationController
  before_action :signed_in_user
  before_action :set_dimage, only: [:show, :edit, :update, :destroy]

  # GET /dimages
  # GET /dimages.json
  def index
    @dimages = Dimage.all
  end

  # GET /dimages/1
  # GET /dimages/1.json
  def show
  end

  # GET /dimages/new
  def new
    @dimage = Dimage.new
  end

  # GET /dimages/1/edit
  def edit
  end

  # POST /dimages
  # POST /dimages.json
  def create
    @dimage = Dimage.new(dimage_params)

    respond_to do |format|
      if @dimage.save
        flash[:success] = I18n.t(:dimage_suc_cr)
        format.html { redirect_to @dimage } #, flash[:success] = I18n.t(:dimage_suc_cr)
        format.json { render action: 'show', status: :created, location: @dimage }
      else
        format.html { render action: 'new' }
        format.json { render json: @dimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dimages/1
  # PATCH/PUT /dimages/1.json
  def update
    respond_to do |format|
      if @dimage.update(dimage_params)
        flash[:success] = t(:dimage_suc_up)
        format.html { redirect_to @dimage }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dimages/1
  # DELETE /dimages/1.json
  def destroy
    @dimage.destroy
    respond_to do |format|
      flash[:success] = t(:dimage_suc_de)
      format.html { redirect_to dimages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dimage
      @dimage = Dimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dimage_params
      params.require(:dimage).permit(:fotka, :flag, :descr)
    end
end
