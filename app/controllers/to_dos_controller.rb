class ToDosController < ApplicationController
  before_action :set_to_do, only: %i[show edit update destroy]

  def index
    @q = ToDo.ransack(params[:q])
    @to_dos = @q.result(distinct: true).includes(:user,
                                                 :climb).page(params[:page]).per(10)
  end

  def show; end

  def new
    @to_do = ToDo.new
  end

  def edit; end

  def create
    @to_do = ToDo.new(to_do_params)

    if @to_do.save
      message = "ToDo was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @to_do, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @to_do.update(to_do_params)
      redirect_to @to_do, notice: "To do was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @to_do.destroy
    message = "ToDo was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to to_dos_url, notice: message
    end
  end

  private

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:user_id, :climb_id)
  end
end
