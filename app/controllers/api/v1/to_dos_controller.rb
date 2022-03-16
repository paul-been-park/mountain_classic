class Api::V1::ToDosController < Api::V1::GraphitiController
  def index
    to_dos = ToDoResource.all(params)
    respond_with(to_dos)
  end

  def show
    to_do = ToDoResource.find(params)
    respond_with(to_do)
  end

  def create
    to_do = ToDoResource.build(params)

    if to_do.save
      render jsonapi: to_do, status: :created
    else
      render jsonapi_errors: to_do
    end
  end

  def update
    to_do = ToDoResource.find(params)

    if to_do.update_attributes
      render jsonapi: to_do
    else
      render jsonapi_errors: to_do
    end
  end

  def destroy
    to_do = ToDoResource.find(params)

    if to_do.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: to_do
    end
  end
end
