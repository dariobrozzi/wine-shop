class DistrictsController < ApplicationController
  before_action :set_district, only: %i[ show edit update destroy ]

  # GET /districts or /districts.json
  def index
    @districts = District.all
  end

  # GET /districts/1 or /districts/1.json
  def show
  end

  # GET /districts/new
  def new
    @district = District.new
  end

  # GET /districts/1/edit
  def edit
  end

  # POST /districts or /districts.json
  def create
    @district = District.new(district_params)

    respond_to do |format|
      if @district.save
        format.html { redirect_to @district, notice: "District was successfully created." }
        format.json { render :show, status: :created, location: @district }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @district.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /districts/1 or /districts/1.json
  def update
    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to @district, notice: "District was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @district }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @district.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /districts/1 or /districts/1.json
  def destroy
    @district.destroy!

    respond_to do |format|
      format.html { redirect_to districts_path, notice: "District was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def district_params
      params.expect(district: [ :name ])
    end
end
