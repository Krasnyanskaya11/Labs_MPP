#require_relative '/mnt/d/RubyWorks/hospital1_new/app/controllers/D:/RubyWorks/hospital1_new/app/queries/doctors_query'
class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: %i[ show edit update destroy ]

  # GET /doctors or /doctors.json
  def index

    doctors_query = DoctorsQuery.new
  @doctors = doctors_query.search(params[:query]).sort(params[:sort_field], params[:sort_direction]).result.paginate(page: params[:page], per_page: 10)
  end

  # GET /doctors/1 or /doctors/1.json
  def show
    @doctors = Doctor.find(params[:id])
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
    @doctors = Doctor.find(params[:id])
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully created." }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:name,:surname,:department_id)
    end
end
