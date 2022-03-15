class Api::V1::ClimbsController < Api::V1::GraphitiController
  def index
    climbs = ClimbResource.all(params)
    respond_with(climbs)
  end

  def show
    climb = ClimbResource.find(params)
    respond_with(climb)
  end

  def create
    climb = ClimbResource.build(params)

    if climb.save
      render jsonapi: climb, status: 201
    else
      render jsonapi_errors: climb
    end
  end

  def update
    climb = ClimbResource.find(params)

    if climb.update_attributes
      render jsonapi: climb
    else
      render jsonapi_errors: climb
    end
  end

  def destroy
    climb = ClimbResource.find(params)

    if climb.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: climb
    end
  end
end
