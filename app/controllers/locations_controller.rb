class LocationsController < ApplicationController
  before_action :set_locations
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET brands/1/locations
  def index
    @locations = @brand.locations
  end

  # GET brands/1/locations/1
  def show
  end

  # GET brands/1/locations/new
  def new
    @location = @brand.locations.build
  end

  # GET brands/1/locations/1/edit
  def edit
  end

  # POST brands/1/locations
  def create
    @location = @brand.locations.build(location_params)

    if @location.save
      redirect_to([@location.brand, @location], notice: 'Location was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT brands/1/locations/1
  def update
    if @location.update_attributes(location_params)
      redirect_to([@location.brand, @location], notice: 'Location was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE brands/1/locations/1
  def destroy
    @location.destroy

    redirect_to brand_locations_url(@brand)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locations
      @brand = Brand.find(params[:brand_id])
    end

    def set_location
      @location = @brand.locations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:name)
    end
end
