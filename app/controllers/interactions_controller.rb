class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  # GET /interactions
  def index
    @interactions = Interaction.all
  end

  # GET /interactions/1
  def show
  end

  # GET /interactions/new
  def new
    @interaction = Interaction.new
  end

  # GET /interactions/1/edit
  def edit
  end

  # POST /interactions
  def create
    @interaction = Interaction.new(interaction_params)

    if @interaction.save
      message = 'Interaction was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @interaction, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /interactions/1
  def update
    if @interaction.update(interaction_params)
      redirect_to @interaction, notice: 'Interaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interactions/1
  def destroy
    @interaction.destroy
    message = "Interaction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to interactions_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interaction_params
      params.require(:interaction).permit(:tick, :summited, :user_id, :climb_id)
    end
end
