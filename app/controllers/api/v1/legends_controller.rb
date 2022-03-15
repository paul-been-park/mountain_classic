class Api::V1::LegendsController < Api::V1::GraphitiController
  def index
    legends = LegendResource.all(params)
    respond_with(legends)
  end

  def show
    legend = LegendResource.find(params)
    respond_with(legend)
  end

  def create
    legend = LegendResource.build(params)

    if legend.save
      render jsonapi: legend, status: :created
    else
      render jsonapi_errors: legend
    end
  end

  def update
    legend = LegendResource.find(params)

    if legend.update_attributes
      render jsonapi: legend
    else
      render jsonapi_errors: legend
    end
  end

  def destroy
    legend = LegendResource.find(params)

    if legend.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: legend
    end
  end
end
