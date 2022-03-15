class MountainsController < ApplicationController
  before_action :set_mountain, only: %i[show edit update destroy]

  def index
    @q = Mountain.ransack(params[:q])
    @mountains = @q.result(distinct: true).includes(:region,
                                                    :climbs).page(params[:page]).per(10)
  end

  def show
    @climb = Climb.new
  end

  def new
    @mountain = Mountain.new
  end

  def edit; end

  def create
    @mountain = Mountain.new(mountain_params)

    if @mountain.save
      message = "Mountain was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @mountain, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @mountain.update(mountain_params)
      redirect_to @mountain, notice: "Mountain was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @mountain.destroy
    message = "Mountain was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to mountains_url, notice: message
    end
  end

  private

  def set_mountain
    @mountain = Mountain.find(params[:id])
  end

  def mountain_params
    params.require(:mountain).permit(:region_id, :mountain_name)
  end
end
