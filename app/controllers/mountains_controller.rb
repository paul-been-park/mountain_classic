class MountainsController < ApplicationController
  before_action :set_mountain, only: [:show, :edit, :update, :destroy]

  # GET /mountains
  def index
    @mountains = Mountain.all
  end

  # GET /mountains/1
  def show
  end

  # GET /mountains/new
  def new
    @mountain = Mountain.new
  end

  # GET /mountains/1/edit
  def edit
  end

  # POST /mountains
  def create
    @mountain = Mountain.new(mountain_params)

    if @mountain.save
      redirect_to @mountain, notice: 'Mountain was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mountains/1
  def update
    if @mountain.update(mountain_params)
      redirect_to @mountain, notice: 'Mountain was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mountains/1
  def destroy
    @mountain.destroy
    redirect_to mountains_url, notice: 'Mountain was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mountain
      @mountain = Mountain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mountain_params
      params.require(:mountain).permit(:region_id, :mountain_name)
    end
end
