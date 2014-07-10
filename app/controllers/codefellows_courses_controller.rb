class CodefellowsCoursesController < ApplicationController
  before_action :set_codefellows_course, only: [:show, :edit, :update, :destroy]

  # GET /codefellows_courses
  # GET /codefellows_courses.json
  def index
    @codefellows_courses = CodefellowsCourse.all
  end

  # GET /codefellows_courses/1
  # GET /codefellows_courses/1.json
  def show
  end

  # GET /codefellows_courses/new
  def new
    @codefellows_course = CodefellowsCourse.new
  end

  # GET /codefellows_courses/1/edit
  def edit
  end

  # POST /codefellows_courses
  # POST /codefellows_courses.json
  def create
    @codefellows_course = CodefellowsCourse.new(codefellows_course_params)

    respond_to do |format|
      if @codefellows_course.save
        format.html { redirect_to @codefellows_course, notice: 'Codefellows course was successfully created.' }
        format.json { render :show, status: :created, location: @codefellows_course }
      else
        format.html { render :new }
        format.json { render json: @codefellows_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codefellows_courses/1
  # PATCH/PUT /codefellows_courses/1.json
  def update
    respond_to do |format|
      if @codefellows_course.update(codefellows_course_params)
        format.html { redirect_to @codefellows_course, notice: 'Codefellows course was successfully updated.' }
        format.json { render :show, status: :ok, location: @codefellows_course }
      else
        format.html { render :edit }
        format.json { render json: @codefellows_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codefellows_courses/1
  # DELETE /codefellows_courses/1.json
  def destroy
    @codefellows_course.destroy
    respond_to do |format|
      format.html { redirect_to codefellows_courses_url, notice: 'Codefellows course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codefellows_course
      @codefellows_course = CodefellowsCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codefellows_course_params
      params.require(:codefellows_course).permit(:kind, :stack, :code, :section, :starts_at, :ends_at, :instructor)
    end
end
