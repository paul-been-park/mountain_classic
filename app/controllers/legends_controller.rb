class LegendsController < ApplicationController
  before_action :set_legend, only: [:show, :edit, :update, :destroy]

  # GET /legends
  def index
    @q = Legend.ransack(params[:q])
    @legends = @q.result(:distinct => true).includes(:user, :first_ascents).page(params[:page]).per(10)
  end

  # GET /legends/1
  def show
    @first_ascent = FirstAscent.new
  end

  # GET /legends/new
  def new
    @legend = Legend.new
  end

  # GET /legends/1/edit
  def edit
  end

  # POST /legends
  def create
    @legend = Legend.new(legend_params)

    if @legend.save
      message = 'Legend was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @legend, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /legends/1
  def update
    if @legend.update(legend_params)
      redirect_to @legend, notice: 'Legend was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /legends/1
  def destroy
    @legend.destroy
    message = "Legend was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to legends_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legend
      @legend = Legend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def legend_params
      params.require(:legend).permit(:name, :photo, :bio, :user_id)
    end
end
