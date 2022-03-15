class ClimbsController < ApplicationController
  before_action :set_climb, only: [:show, :edit, :update, :destroy]

  # GET /climbs
  def index
    @climbs = Climb.page(params[:page]).per(10)
  end

  # GET /climbs/1
  def show
    @interaction = Interaction.new
    @comment = Comment.new
    @first_ascent = FirstAscent.new
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
      message = 'Climb was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @climb, notice: message
      end
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
    message = "Climb was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to climbs_url, notice: message
    end
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
