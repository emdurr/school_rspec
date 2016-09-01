require 'rails_helper'

RSpec.describe CoursesController, type: :controller do  
    describe "GET #new" do
      before(:each) do
        @institution = FactoryGirl.create(:institution)
        get :new, institution_id: @institution.id
      end 

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end 

      it "sets the course instance variable" do
        expect(assigns(:course)).to_not eq(nil)
      end 

      it 'renders the new template' do
        expect(response).to render_template(:new)
        expect(assigns(:course).class).to eq(Course)
      end
    end 

    describe "GET #show" do
      before(:each) do
        @institution = FactoryGirl.create(:institution)
        @course = FactoryGirl.create(:course, institution_id:@institution.id)
        get :show, institution_id: @institution.id, id: @course.id
      end 

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end 

      it 'sets the course instance variable' do
        expect(assigns(:course)).to eq(@course)
      end 

      it 'renders the show template' do
        expect(assigns(:course).class).to eq(Course)
      end
    end 

    describe "GET #edit" do
      before(:each) do
        @institution = FactoryGirl.create(:institution)
        @course = FactoryGirl.create(:course, institution_id:@institution.id)
        get :edit, { institution_id: @institution.id, id: @course.id }
      end 

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end 

      it "sets the course instance variable" do
        expect(assigns(:course)).to eq(@course)
      end 

      it "renders the edit template" do
        expect(response).to render_template(:edit)
      end
    end 

    describe "POST #create" do
      before(:each) do
        @institution = FactoryGirl.create(:institution)
        @course_params = {title: 'ruby on rails', description: 'A course about ruby', number: '2100', day_of_the_week: 'M, T, W, Th, F', time_of_day: '9:30 - 5:30', institution_id: @institution.id}
        post :create, { institution_id: @institution.id, course: @course_params }
      end
      it "successfully creates a course" do
        expect(Course.count).to eq(1)
        expect(Course.first.title).to eq(@course_params[:title])
      end 

      it 'redirects to the institution path upon successful creation' do
        expect(response).to redirect_to institution_course_path(@institution, Course.first.id)
      end
    end 

    describe "POST #create" do
      it 'renders the new template upon unsuccessful create' do
        @institution = FactoryGirl.create(:institution)
        course_params = {title: '', description: 'A course about ruby', number: '2100', day_of_the_week: 'M, T, W, Th, F', time_of_day: '9:30 - 5:30', institution_id: @institution.id}
        post :create, { institution_id: @institution.id, course: course_params }
        expect(Course.count).to eq(0)
        expect(response).to render_template(:new, :institution_id => @institution.id)
      end
    end 

    describe "PUT #update" do
      before(:each) do
        @institution = FactoryGirl.create(:institution)
        @course = FactoryGirl.create(:course, institution_id:@institution.id)
      end
      it "successfully updates an course" do
        course_params = {title: 'ruby on the rails'}
        put :update, { institution_id: @institution.id, id: @course.id, course: course_params }
        expect(@course.reload.title).to eq('ruby on the rails')
      end 

      it 'renders the edit template upon unsuccessful update' do
        course_params = {title: ''}
        put :update, { institution_id: @institution.id, id: @course.id, course: course_params }
        expect(response).to render_template(:edit)
      end 

      it 'redirects to institution path upon successful update' do
        course_params = {title: 'ruby on the rails'}
        put :update, { institution_id: @institution.id, id: @course.id, course: course_params }
        expect(response).to redirect_to institution_course_path(@institution, @course)
      end
    end 

    describe "DELETE #destroy" do
      before(:each) do
        @institution = FactoryGirl.create(:institution)
        @course = FactoryGirl.create(:course, institution_id:@institution.id)
        expect(Course.count).to eq(1)
        delete :destroy, { institution_id: @institution.id, id: @course.id }
      end
      it 'successfully deletes an course' do
        expect(Institution.count).to eq(1)
        expect(Course.count).to eq(0)
      end 

      it 'redirects to the institution path upon successful delete' do
        expect(response).to redirect_to institution_path(@institution)
      end
    end
end
