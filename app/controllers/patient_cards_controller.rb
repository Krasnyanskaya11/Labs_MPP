class PatientCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient_card, only: %i[ show edit update destroy ]

  # GET /patient_cards or /patient_cards.json
  def index

    patient_query=PatientCardsQuery.new
    @patient_cards = patient_query.search(params[:query]).sort(params[:sort_field], params[:sort_direction]).result.paginate(page: params[:page], per_page: 10)
  end

  # GET /patient_cards/1 or /patient_cards/1.json
  def show
    @patient_card = PatientCard.find(params[:id])
  end

  # GET /patient_cards/new
  def new
    @patient_card = PatientCard.new
  end

  # GET /patient_cards/1/edit
  def edit
    @patient_card = PatientCard.find(params[:id])
  end

  # POST /patient_cards or /patient_cards.json
  def create
    @patient_card = PatientCard.new(patient_card_params)


#for laba 5,add doctor to patient_card
 @doctor = Doctor.find(params[:doctor_id])
   @patient = Patient.find(params[:patient_id])
  @patient_card = @doctor.patient_cards.build(patient: @patient)
  @patient_card.description = params[:patient_card][:description]

   @patient_card.doctor = Doctor.find_by(name: params[:doctor_name], surname: params[:doctor_surname])
   @patient_card.doctor = @doctor

#    @patient = Patient.find(params[:patient_id])
#   @doctor = Doctor.find(params[:doctor_id])
#   @patient_card = PatientCard.new(patient_card_params)
#    @patient_card.doctor = @doctor

    respond_to do |format|
      if @patient_card.save
        format.html { redirect_to patient_card_url(@patient_card), notice: "Patient card was successfully created." }
        format.json { render :show, status: :created, location: @patient_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_cards/1 or /patient_cards/1.json
  def update
    respond_to do |format|
      if @patient_card.update(patient_card_params)
        format.html { redirect_to patient_card_url(@patient_card), notice: "Patient card was successfully updated." }
        format.json { render :show, status: :ok, location: @patient_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_cards/1 or /patient_cards/1.json
  def destroy
    @patient_card.destroy

    respond_to do |format|
      format.html { redirect_to patient_cards_url, notice: "Patient card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_card
      @patient_card = PatientCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_card_params
      params.fetch(:patient_card).permit(:diagnosis,:data_st,:clinic_id,:patient_id)
    end
end
