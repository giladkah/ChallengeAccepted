class OrderTypesController < ApplicationController
  before_action :set_order_types
  before_action :set_order_type, only: [:show, :edit, :update, :destroy]

  # GET brands/1/order_types
  def index
    @order_types = @brand.order_types
  end

  # GET brands/1/order_types/1
  def show
  end

  # GET brands/1/order_types/new
  def new
    @order_type = @brand.order_types.build
  end

  # GET brands/1/order_types/1/edit
  def edit
  end

  # POST brands/1/order_types
  def create
    @order_type = @brand.order_types.build(order_type_params)

    if @order_type.save
      redirect_to([@order_type.brand, @order_type], notice: 'Order type was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT brands/1/order_types/1
  def update
    if @order_type.update_attributes(order_type_params)
      redirect_to([@order_type.brand, @order_type], notice: 'Order type was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE brands/1/order_types/1
  def destroy
    @order_type.destroy

    redirect_to brand_order_types_url(@brand)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_types
      @brand = Brand.find(params[:brand_id])
    end

    def set_order_type
      @order_type = @brand.order_types.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_type_params
      params.require(:order_type).permit(:name)
    end
end
