class PatientClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient_clinic, only: %i[ show edit update destroy ]

  # GET /patient_clinics or /patient_clinics.json
  def index
    @patients = Patient.order(created_at: :desc).page(params[:page]).per_page(10)

     @patient_info = @patients.map do |patient|
       {
         patient: patient,
         patient_name: patient.name,
         patient_surname: patient.surname,
         patient_age: (Date.today - Date.parse(patient.bd)).to_i / 365,
         patient_card: patient.patient_card&.id

       }

     end

    render :index, locals: {  patient_info: @patient_info }

  end


  # GET /patient_clinics/1 or /patient_clinics/1.json
  def show

    @patient = @patient_clinic.patient
    @patient_card = @patient_clinic.patient_card
  end

  # GET /patient_clinics/new
  def new
    @patient_clinic = PatientClinic.new
  end

  # GET /patient_clinics/1/edit
  def edit
  end

  # POST /patient_clinics or /patient_clinics.json
  def create
    @patient_clinic = PatientClinic.new(patient_clinic_params)

    respond_to do |format|
      if @patient_clinic.save
        format.html { redirect_to patient_clinic_url(@patient_clinic), notice: "Patient clinic was successfully created." }
        format.json { render :show, status: :created, location: @patient_clinic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_clinics/1 or /patient_clinics/1.json
  def update
    respond_to do |format|
      if @patient_clinic.update(patient_clinic_params)
        format.html { redirect_to patient_clinic_url(@patient_clinic), notice: "Patient clinic was successfully updated." }
        format.json { render :show, status: :ok, location: @patient_clinic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_clinics/1 or /patient_clinics/1.json
  def destroy
    @patient_clinic.destroy

    respond_to do |format|
      format.html { redirect_to patient_clinics_url, notice: "Patient clinic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_clinic
      @patient_clinic = PatientClinic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_clinic_params
      params.fetch(:patient_clinic).permit(:patient_name,:patient_surname,:patient_age,:patient_card_id)
    end
  end


