class Api::V1::FirstAscentsController < Api::V1::GraphitiController
  def index
    first_ascents = FirstAscentResource.all(params)
    respond_with(first_ascents)
  end

  def show
    first_ascent = FirstAscentResource.find(params)
    respond_with(first_ascent)
  end

  def create
    first_ascent = FirstAscentResource.build(params)

    if first_ascent.save
      render jsonapi: first_ascent, status: 201
    else
      render jsonapi_errors: first_ascent
    end
  end

  def update
    first_ascent = FirstAscentResource.find(params)

    if first_ascent.update_attributes
      render jsonapi: first_ascent
    else
      render jsonapi_errors: first_ascent
    end
  end

  def destroy
    first_ascent = FirstAscentResource.find(params)

    if first_ascent.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: first_ascent
    end
  end
end
