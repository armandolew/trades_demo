class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :update, :destroy]

  rescue_from StandardError, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # GET /trades
  def index
    trades = Trade.all
    if params.key? 'user_id'
      user = User.find(params.dig(:user_id))
      trades = user.trades
    end

    if params.key? 'trade_type'
      trades = trades.where('trade_type =?', params[:trade_type])
    end

    render json: trades
  end

  # GET /trades/1
  def show
    render json: @trade
  end

  # POST /trades
  def create
    @trade = Trade.new(trade_params)
    @trade.save!
    render json: @trade, status: :created
  end

  # PATCH/PUT /trades/1
  def update
    protected_against_modification('Update is not allowed')
  end

  # DELETE /trades/1
  def destroy
    protected_against_modification('Deletion is not allowed')
  end

  private
    def set_trade
      @trade = Trade.find(params[:id])
    end

    def trade_params
      params.require(:trade).permit(:trade_type, :symbol, :shares, :price, :timestamp, :user_id)
    end
end
