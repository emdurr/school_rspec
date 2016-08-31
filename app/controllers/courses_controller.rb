class CoursesController < ApplicationController
	before_action :find_institution
	before_action :find_course, only: [:show, :edit, :update, :destroy]
  def new
  	@course = Course.new
  end

  def create
  	@course = @institution.courses.new(course_params)
  	if @course.save
  		redirect_to institution_course_path(@institution, @course)
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @course.update(course_params)
  		redirect_to institution_course_path(@institution, @course)
  	else
  		render :edit
  	end
  end

  def destroy
  	@course.destroy
  	redirect_to institution_path(@institution)
  end

  private

  	def find_institution
  		@institution = Institution.find(params[:institution_id])
  	end

  	def course_params
  		params.require(:course).permit(:title, :description, :number, :day_of_the_week, :time_of_day ,:institution_id)
  	end

  	def find_course
  		@course = @institution.courses.find(params[:id])
  	end
end
