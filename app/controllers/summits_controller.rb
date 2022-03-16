class SummitsController < ApplicationController
  before_action :set_summit, only: %i[show edit update destroy]

  def index
    @q = Summit.ransack(params[:q])
    @summits = @q.result(distinct: true).includes(:user,
                                                  :climb).page(params[:page]).per(10)
  end

  def show; end

  def new
    @summit = Summit.new
  end

  def edit; end

  def create
    @summit = Summit.new(summit_params)

    if @summit.save
      message = "Summit was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @summit, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @summit.update(summit_params)
      redirect_to @summit, notice: "Summit was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @summit.destroy
    message = "Summit was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to summits_url, notice: message
    end
  end

  private

  def set_summit
    @summit = Summit.find(params[:id])
  end

  def summit_params
    params.require(:summit).permit(:user_id, :climb_id)
  end
end
