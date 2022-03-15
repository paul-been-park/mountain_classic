class LegendsController < ApplicationController
  before_action :set_legend, only: %i[show edit update destroy]

  def index
    @q = Legend.ransack(params[:q])
    @legends = @q.result(distinct: true).includes(:user,
                                                  :first_ascents).page(params[:page]).per(10)
  end

  def show
    @first_ascent = FirstAscent.new
  end

  def new
    @legend = Legend.new
  end

  def edit; end

  def create
    @legend = Legend.new(legend_params)

    if @legend.save
      message = "Legend was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @legend, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @legend.update(legend_params)
      redirect_to @legend, notice: "Legend was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @legend.destroy
    message = "Legend was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to legends_url, notice: message
    end
  end

  private

  def set_legend
    @legend = Legend.find(params[:id])
  end

  def legend_params
    params.require(:legend).permit(:name, :photo, :bio, :user_id)
  end
end
