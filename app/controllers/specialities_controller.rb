class SpecialitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_speciality, only: %i[ show edit update destroy ]

  # GET /specialities or /specialities.json
  def index

    speciality_query =SpecialitiesQuery.new
    @specialities=  speciality_query.search(params[:query]).sort(params[:sort_field], params[:sort_direction]).result.paginate(page: params[:page], per_page: 10)
  end




  # GET /specialities/1 or /specialities/1.json
  def show
    @speciality = Speciality.find(params[:id])
  end

  # GET /specialities/new
  def new
    @speciality = Speciality.new
  end

  # GET /specialities/1/edit
  def edit
    @speciality = Speciality.find(params[:id])
  end

  # POST /specialities or /specialities.json
  def create
    @speciality = Speciality.new(speciality_params)

    respond_to do |format|
      if @speciality.save
        format.html { redirect_to speciality_url(@speciality), notice: "Speciality was successfully created." }
        format.json { render :show, status: :created, location: @speciality }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialities/1 or /specialities/1.json
  def update
    respond_to do |format|
      if @speciality.update(speciality_params)
        format.html { redirect_to speciality_url(@speciality), notice: "Speciality was successfully updated." }
        format.json { render :show, status: :ok, location: @speciality }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialities/1 or /specialities/1.json
  def destroy
    @speciality.destroy

    respond_to do |format|
      format.html { redirect_to specialities_url, notice: "Speciality was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def speciality_params
      params.require(:speciality).permit(:name,:doctor_id)
    end
end
