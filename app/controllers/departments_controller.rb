class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: %i[ show edit update destroy ]

  # GET /departments or /departments.json
  def index
    departments_query = DepartmentsQuery.new
    @departments = departments_query.search(params[:query]).sort(params[:sort_field], params[:sort_direction]).result.paginate(page: params[:page], per_page: 10)

  end

  # GET /departments/1 or /departments/1.json
  def show
    @departments = Department.find(params[:id])
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
    @departments = Department.find(params[:id])
  end

  # POST /departments or /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to department_url(@department), notice: "Department was successfully created." }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to department_url(@department), notice: "Department was successfully updated." }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url, notice: "Department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:name,:clinic_id)
    end
end
