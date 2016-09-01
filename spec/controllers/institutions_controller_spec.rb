require 'rails_helper'

RSpec.describe InstitutionsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the institutions instance variable" do
      expect(assigns(:institutions)).to eq([])
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #index" do
    it "has institutions in the instance variable" do
      @institution = FactoryGirl.create(:institution)
      get :index
      expect(assigns(:institutions).length).to eq(1)
      expect(assigns(:institutions).first.name).to eq('devpoint')
    end
  end

  describe "GET #show" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      get :show, id: @institution.id
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'sets the institution instance variable' do
      expect(assigns(:institution)).to eq(@institution)
    end

    it 'renders the show template' do
      expect(assigns(:institution).class).to eq(Institution)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the institution instance variable" do
      expect(assigns(:institution)).to_not eq(nil)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
      expect(assigns(:institution).class).to eq(Institution)
    end
  end

  describe "GET #edit" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      get :edit, id: @institution.id
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "sets the institution instance variable" do
      expect(assigns(:institution)).to eq(@institution)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before(:each) do
      @institution_params = {institution: {name: 'devpoint', discipline: 'coding', founded: '2013', accepting_applications: true}}
      post :create, @institution_params
    end
    it "successfully creates an institution" do
      expect(Institution.count).to eq(1)
      expect(Institution.first.name).to eq(@institution_params[:institution][:name])
    end

    it 'redirects to the institution path upon successful creation' do
      expect(response).to redirect_to institution_path(Institution.first)
    end
  end

  describe "POST #create" do
    it 'renders the new template upon unsuccessful create' do
      institution_params = {institution: {name: '', discipline: 'coding', founded: '2013', accepting_applications: true}}
      post :create, institution_params
      expect(Institution.count).to eq(0)
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
      @institution_params = {name: 'devpoint labs'}
      put :update, {id: @institution.id, institution: @institution_params}
    end
    it "successfully updates an institution" do 
      expect(@institution.reload.name).to eq('devpoint labs')
    end

    it 'redirects to institution path upon successful update' do
      expect(response).to redirect_to institution_path(@institution)
    end
  end

  describe "PUT #update" do
    it 'renders the edit template upon unsuccessful update' do
      institution = FactoryGirl.create(:institution)
      institution_params = {name: ''}
      put :update, {id: institution.id, institution: institution_params}
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @institution = FactoryGirl.create(:institution)
    end
    it 'successfully deletes an institution' do
      expect(Institution.count).to eq(1)
      delete :destroy, id: @institution.id
      expect(Institution.count).to eq(0)
    end

    it 'redirects to the institutions path upon successful delete' do
      delete :destroy, id: @institution.id
      expect(response).to redirect_to institutions_path
    end
  end
end
