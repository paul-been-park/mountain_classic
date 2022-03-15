class ClimbsController < ApplicationController
  before_action :set_climb, only: %i[show edit update destroy]

  def index
    @q = Climb.ransack(params[:q])
    @climbs = @q.result(distinct: true).includes(:mountain, :first_ascents,
                                                 :comments, :interactions, :legends, :users_interactions).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@climbs.where.not(location_latitude: nil)) do |climb, marker|
      marker.lat climb.location_latitude
      marker.lng climb.location_longitude
    end
  end

  def show
    @interaction = Interaction.new
    @comment = Comment.new
    @first_ascent = FirstAscent.new
  end

  def new
    @climb = Climb.new
  end

  def edit; end

  def create
    @climb = Climb.new(climb_params)

    if @climb.save
      message = "Climb was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @climb, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @climb.update(climb_params)
      redirect_to @climb, notice: "Climb was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @climb.destroy
    message = "Climb was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to climbs_url, notice: message
    end
  end

  private

  def set_climb
    @climb = Climb.find(params[:id])
  end

  def climb_params
    params.require(:climb).permit(:route_name, :length, :grade, :guide_url,
                                  :climb_photo, :mountain_id, :description, :classic, :location)
  end
end
