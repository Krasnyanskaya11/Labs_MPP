class CatalogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_catalog, only: %i[ show edit update destroy ]

  # GET /catalogs or /catalogs.json
  def index


    clinic_query = ClinicsQuery.new
    @clinics = clinic_query.search(params[:query]).sort(params[:sort_field], params[:sort_direction]).result.paginate(page: params[:page], per_page: 10)

    @clinic_count = @clinics.map do |clinic|
      departments_count = clinic.departments.count
      doctors_count = clinic.doctors.count

      { clinic: clinic, departments_count: departments_count, doctors_count: doctors_count }
    end

    if params[:sort_by] == 'departments'
      @clinic_count = @clinic_count.sort_by { |clinic| clinic[:departments_count] }
    elsif params[:sort_by] == 'doctors'
      @clinic_count = @clinic_count.sort_by { |clinic| -clinic[:doctors_count] }
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /catalogs/1 or /catalogs/1.json
  def show
    @clinics = Clinic.find(params[:id])
  end


  def edit
  end



    # Only allow a list of trusted parameters through.
    def catalog_params
      params.fetch(:catalog).permit(:departments_count,:doctors_count,:clinic)
    end
end
