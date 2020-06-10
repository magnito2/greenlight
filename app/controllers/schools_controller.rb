class SchoolsController < ApplicationController
  include Pagy::Backend

  before_action :set_school, only: [:show, :edit, :update, :destroy]
  authorize_resource class: false

  # GET /schools
  # GET /schools.json
  def index
    @school = current_user.school
    return redirect_to @school unless current_user.highest_priority_role.name == "super_admin"
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = current_user.school unless current_user.highest_priority_role.name == "super_admin"
    @pagy, @users = pagy(@school.users.without_role(:super_admin))
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, flash: {success: 'School was successfully created.'}}
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, flash: {success: 'School was successfully updated.' } }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, flash: {success: 'School was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find_by!(uid: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name)
    end

    def verify_super_admin
      # Return to root if user is not signed in
      return redirect_to(root_path, flash: {alert: 'Unauthorized' }) unless current_user && current_user.highest_priority_role.name == "super_admin"
    end
end
