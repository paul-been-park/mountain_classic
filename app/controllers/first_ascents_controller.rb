class FirstAscentsController < ApplicationController
  before_action :set_first_ascent, only: [:show, :edit, :update, :destroy]

  # GET /first_ascents
  def index
    @first_ascents = FirstAscent.all
  end

  # GET /first_ascents/1
  def show
  end

  # GET /first_ascents/new
  def new
    @first_ascent = FirstAscent.new
  end

  # GET /first_ascents/1/edit
  def edit
  end

  # POST /first_ascents
  def create
    @first_ascent = FirstAscent.new(first_ascent_params)

    if @first_ascent.save
      redirect_to @first_ascent, notice: 'First ascent was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /first_ascents/1
  def update
    if @first_ascent.update(first_ascent_params)
      redirect_to @first_ascent, notice: 'First ascent was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /first_ascents/1
  def destroy
    @first_ascent.destroy
    redirect_to first_ascents_url, notice: 'First ascent was successfully destroyed.'
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
