class CatRentalRequestsController < ApplicationController
  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def show
    @request = CatRentalRequest.find_by(id: params[:id])

    if @request
      render :show
    else
      render plain: "Could not find request!", status: 404
    end
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)

    if @request.save
      redirect_to cat_rental_request_url(@request)
    else
      render json: @request.errors.full_messages, status: 422
    end
  end

  def edit
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request
      render :edit
    else
      render plain: "Could not find request!", status: 404
    end
  end

  def update
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request.update(request_params)
      redirect_to cat_rental_request_url(@request)
    else
      render plain: "Could not find request!", status: 404
    end
  end

    private

    def request_params
      params.require(:request).permit(:cat_id, :start_date, :end_date, :status)
    end
end
