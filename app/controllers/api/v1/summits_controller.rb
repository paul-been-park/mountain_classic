class Api::V1::SummitsController < Api::V1::GraphitiController
  def index
    summits = SummitResource.all(params)
    respond_with(summits)
  end

  def show
    summit = SummitResource.find(params)
    respond_with(summit)
  end

  def create
    summit = SummitResource.build(params)

    if summit.save
      render jsonapi: summit, status: :created
    else
      render jsonapi_errors: summit
    end
  end

  def update
    summit = SummitResource.find(params)

    if summit.update_attributes
      render jsonapi: summit
    else
      render jsonapi_errors: summit
    end
  end

  def destroy
    summit = SummitResource.find(params)

    if summit.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: summit
    end
  end
end
