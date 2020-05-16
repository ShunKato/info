class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #@q = Product.ransack(params[:q])
    #@products = @q.result(distinct: true).limit(2)

    if params[:q] != nil
      params[:q]['p_name_cont_all'] = params[:q]['p_name_cont_all'].split(/[\p{blank}\s]+/)
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true).order(p_code: 'ASC').limit(100)
    else
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true).order(p_code: 'ASC').limit(100) #検索の結果を受け取る。
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @items = @product.items.build
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:p_code, :p_name, :cust, :supp, :comment, :pic1, :pic2, :pic3)
    end
end
