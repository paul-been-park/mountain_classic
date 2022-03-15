class RegionsController < ApplicationController
  before_action :set_region, only: %i[show edit update destroy]

  # GET /regions
  def index
    @q = Region.ransack(params[:q])
    @regions = @q.result(distinct: true).includes(:mountains).page(params[:page]).per(10)
  end

  # GET /regions/1
  def show
    @mountain = Mountain.new
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit; end

  # POST /regions
  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to @region, notice: "Region was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /regions/1
  def update
    if @region.update(region_params)
      redirect_to @region, notice: "Region was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
    redirect_to regions_url, notice: "Region was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_region
    @region = Region.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def region_params
    params.require(:region).permit(:region_name)
  end
end
