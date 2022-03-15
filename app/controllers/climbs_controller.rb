class ClimbsController < ApplicationController
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

  # GET /climbs
  def index
    @climbs = Climb.all
  end

  # GET /climbs/1
  def show
  end

  # GET /climbs/new
  def new
    @climb = Climb.new
  end

  # GET /climbs/1/edit
  def edit
  end

  # POST /climbs
  def create
    @climb = Climb.new(climb_params)

    if @climb.save
      redirect_to @climb, notice: 'Climb was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /climbs/1
  def update
    if @climb.update(climb_params)
      redirect_to @climb, notice: 'Climb was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /climbs/1
  def destroy
    @climb.destroy
    redirect_to climbs_url, notice: 'Climb was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb
      @climb = Climb.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def climb_params
      params.require(:climb).permit(:route_name, :length, :grade, :guide_url, :climb_photo, :mountain_id, :description, :classic)
    end
end
