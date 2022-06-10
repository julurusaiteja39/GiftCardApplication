class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!,except: [:index, :show]
  #before_action :correct_user, only: %i[index]
  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    #@order = current_user.orders.build

  end

  # GET /orders/1/edit
  # def edit
  # end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    require 'date'
    respond_to do |format|
      if @order.save
        require 'date'
        current_time = DateTime.now
        @cdt = current_time.strftime "%d/%m/%Y"
        @order.update(date:@cdt)
        #puts "Current Date and Time: "+cdt
        # @total = @order.value*0.05
        @fname = @order.firstname + " " + @order.lastname
        # @order.update(commision:@total)
        @order.update(fullname: @fname)
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1 or /orders/1.json
  # def destroy
  #   @order.destroy

  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end
  # def correct_user
  #   @order = current_user.orders.find_by(id: params[:id])
  #   redirect_to orders_path, notice: "Not authorized user " if @order.nil?
  # end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:firstname, :lastname, :value, :commision, :mobile, :address, :user_id)
    end
end
