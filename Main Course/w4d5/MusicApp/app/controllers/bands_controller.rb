class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors]=[]
      flash.now[:errors] << "Errors have occurred"
      render :new
    end
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to band_url(@band)
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by(id: params[:id])
      render :edit
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band
      @band.destroy
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
