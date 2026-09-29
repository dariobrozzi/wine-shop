class WineriesController < ApplicationController
  before_action :set_winery, only: %i[ show edit update destroy ]

  # GET /wineries or /wineries.json
  def index
    @wineries = Winery.all
  end

  # GET /wineries/1 or /wineries/1.json
  def show
  end

  # GET /wineries/new
  def new
    @departments = Department.includes(:districts).order(:name)
    @winery = Winery.new
  end

  # GET /wineries/1/edit
  def edit
  end

  # POST /wineries or /wineries.json
  def create
    @winery = Winery.new(winery_params)

    respond_to do |format|
      if @winery.save
        format.html { redirect_to @winery, notice: "Winery was successfully created." }
        format.json { render :show, status: :created, location: @winery }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @winery.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /wineries/1 or /wineries/1.json
  def update
    respond_to do |format|
      if @winery.update(winery_params)
        format.html { redirect_to @winery, notice: "Winery was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @winery }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @winery.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /wineries/1 or /wineries/1.json
  def destroy
    @winery.destroy!

    respond_to do |format|
      format.html { redirect_to wineries_path, notice: "Winery was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winery
      @winery = Winery.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def winery_params
      params.expect(winery: [ :name ])
    end
end
