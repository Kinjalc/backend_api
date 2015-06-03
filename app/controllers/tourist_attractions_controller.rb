class TouristAttractionsController <ApplicationController
  before_action :set_city
  def index
    @tourist_attractions = @city.tourist_attractions
    render json: @tourist_attractions
  end

  def create
    @tourist_attraction = @city.tourist_attractions.build(tourist_attraction_params)
    if @tourist_attraction.save
      render json:@tourist_attraction, status: :created, location: tourist_attraction_url
    else
      render json: @tourist_attraction.errors, status: :unprocessable_entity
    end
  end

  def show
    @tourist_attraction = @city.tourist_attractions.find(params[:id])
    render json: @tourist_attraction
  end

  private
   def tourist_attraction_params
    params.require(:tourist_attraction)
      .permit(:name, :description, :category, :latitude, :longitude)
  end

  def set_city
    @city = City.find(params[:city_id])
  end
end
