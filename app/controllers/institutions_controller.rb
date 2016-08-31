class InstitutionsController < ApplicationController
	before_action :find_institution, except: [:index, :new, :create]
  def index
  	@institutions = Institution.all
  end

  def show
  end

  def new
  	@institution = Institution.new
  end

  def create
  	@institution = Institution.new(institution_params)
  	if @institution.save
  		redirect_to institution_path(@institution), success: 'School created!'
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @institution.update(institution_params)
  		redirect_to institution_path(@institution), success: 'School updated!'
  	else
  		render :edit
  	end
  end

  def destroy
  	@institution.destroy
  	redirect_to institutions_path, success: 'School removed!'
  end

  private
  	def institution_params
  		params.require(:institution).permit(:name, :discipline, :founded, :accepting_applications)
  	end

  	def find_institution
  		@institution = Institution.find(params[:id])
  	end
end
