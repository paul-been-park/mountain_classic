class Api::V1::MountainsController < Api::V1::GraphitiController
  def index
    mountains = MountainResource.all(params)
    respond_with(mountains)
  end

  def show
    mountain = MountainResource.find(params)
    respond_with(mountain)
  end

  def create
    mountain = MountainResource.build(params)

    if mountain.save
      render jsonapi: mountain, status: :created
    else
      render jsonapi_errors: mountain
    end
  end

  def update
    mountain = MountainResource.find(params)

    if mountain.update_attributes
      render jsonapi: mountain
    else
      render jsonapi_errors: mountain
    end
  end

  def destroy
    mountain = MountainResource.find(params)

    if mountain.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: mountain
    end
  end
end
