class MenuItemsController < ApplicationController
  before_action :set_menu_items
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  # GET brands/1/menu_items
  def index
    @menu_items = @brand.menu_items
  end

  # GET brands/1/menu_items/1
  def show
  end

  # GET brands/1/menu_items/new
  def new
    @menu_item = @brand.menu_items.build
  end

  # GET brands/1/menu_items/1/edit
  def edit
  end

  # POST brands/1/menu_items
  def create
    @menu_item = @brand.menu_items.build(menu_item_params)

    if @menu_item.save
      redirect_to([@menu_item.brand, @menu_item], notice: 'Menu item was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT brands/1/menu_items/1
  def update
    if @menu_item.update_attributes(menu_item_params)
      redirect_to([@menu_item.brand, @menu_item], notice: 'Menu item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE brands/1/menu_items/1
  def destroy
    @menu_item.destroy

    redirect_to brand_menu_items_url(@brand)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_items
      @brand = Brand.find(params[:brand_id])
    end

    def set_menu_item
      @menu_item = @brand.menu_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_item_params
      params.require(:menu_item).permit(:name, :price)
    end
end
