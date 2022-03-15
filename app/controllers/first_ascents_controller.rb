class FirstAscentsController < ApplicationController
  before_action :set_first_ascent, only: %i[show edit update destroy]

  # GET /first_ascents
  def index
    @q = FirstAscent.ransack(params[:q])
    @first_ascents = @q.result(distinct: true).includes(:climb,
                                                        :legend).page(params[:page]).per(10)
  end

  # GET /first_ascents/1
  def show; end

  # GET /first_ascents/new
  def new
    @first_ascent = FirstAscent.new
  end

  # GET /first_ascents/1/edit
  def edit; end

  # POST /first_ascents
  def create
    @first_ascent = FirstAscent.new(first_ascent_params)

    if @first_ascent.save
      message = "FirstAscent was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @first_ascent, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /first_ascents/1
  def update
    if @first_ascent.update(first_ascent_params)
      redirect_to @first_ascent,
                  notice: "First ascent was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /first_ascents/1
  def destroy
    @first_ascent.destroy
    message = "FirstAscent was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to first_ascents_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_first_ascent
    @first_ascent = FirstAscent.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def first_ascent_params
    params.require(:first_ascent).permit(:legend_id, :climb_id)
  end
end
