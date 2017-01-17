class PriceLevelsController < ApplicationController
  before_action :set_price_levels
  before_action :set_price_level, only: [:show, :edit, :update, :destroy]

  # GET brands/1/price_levels
  def index
    @price_levels = @brand.price_levels
  end

  # GET brands/1/price_levels/1
  def show
  end

  # GET brands/1/price_levels/new
  def new
    @price_level = @brand.price_levels.build
  end

  # GET brands/1/price_levels/1/edit
  def edit
  end

  # POST brands/1/price_levels
  def create
    @price_level = @brand.price_levels.build(price_level_params)

    if @price_level.save
      redirect_to([@price_level.brand, @price_level], notice: 'Price level was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT brands/1/price_levels/1
  def update
    if @price_level.update_attributes(price_level_params)
      redirect_to([@price_level.brand, @price_level], notice: 'Price level was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE brands/1/price_levels/1
  def destroy
    @price_level.destroy

    redirect_to brand_price_levels_url(@brand)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_levels
      @brand = Brand.find(params[:brand_id])
    end

    def set_price_level
      @price_level = @brand.price_levels.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def price_level_params
      params.require(:price_level).permit(:name)
    end
end
