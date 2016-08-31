require 'rails_helper'

RSpec.describe InstitutionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "sets the institutions instance variable" do
      get :index
      expect(assigns(:institutions)).to eq([])
    end

    it "has institutions in the instance variable" do
      Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :index
      expect(assigns(:institutions).length).to eq(1)
      expect(assigns(:institutions).first.name).to eq('devpoint')
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :show, id: institution.id
      expect(response).to have_http_status(:success)
    end

    it 'sets the institution instance variable' do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :show, id: institution.id
      expect(assigns(:institution)).to eq(institution)
    end

    it 'renders the show template' do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :show, id: institution.id
      expect(assigns(:institution).class).to eq(Institution)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "sets the institution instance variable" do
      get :new
      expect(assigns(:institution)).to_not eq(nil)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:institution).class).to eq(Institution)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :edit, id: institution.id
      expect(response).to have_http_status(:success)
    end

    it "sets the institution instance variable" do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :edit, id: institution.id
      expect(assigns(:institution)).to eq(institution)
    end

    it "renders the edit template" do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      get :edit, id: institution.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    it "successfully creates an institution" do
      institution_params = {institution: {name: 'devpoint', discipline: 'coding', founded: '2013', accepting_applications: true}}
      post :create, institution_params
      expect(Institution.count).to eq(1)
      expect(Institution.first.name).to eq(institution_params[:institution][:name])
    end

    it 'renders the new template upon unsuccessful create' do
      institution_params = {institution: {name: '', discipline: 'coding', founded: '2013', accepting_applications: true}}
      post :create, institution_params
      expect(Institution.count).to eq(0)
      expect(response).to render_template(:new)
    end

    it 'redirects to the institution path upon successful creation' do
      institution_params = {institution: {name: 'devpoint', discipline: 'coding', founded: '2013', accepting_applications: true}}
      post :create, institution_params
      expect(response).to redirect_to institution_path(Institution.first)
    end
  end

  describe "PUT #update" do
    it "successfully updates an institution" do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      institution_params = {name: 'devpoint labs'}
      put :update, {id: institution.id, institution: institution_params}
      expect(institution.reload.name).to eq('devpoint labs')
    end

    it 'renders the edit template upon unsuccessful update' do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      institution_params = {name: ''}
      put :update, {id: institution.id, institution: institution_params}
      expect(response).to render_template(:edit)
    end

    it 'redirects to institution path upon successful update' do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      institution_params = {name: 'devpoint labs'}
      put :update, {id: institution.id, institution: institution_params}
      expect(response).to redirect_to institution_path(institution)
    end
  end

  describe "DELETE #destroy" do
    it 'successfully deletes an institution' do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      expect(Institution.count).to eq(1)
      delete :destroy, id: institution.id
      expect(Institution.count).to eq(0)
    end

    it 'redirects to the institutions path upon successful delete' do
      institution = Institution.create(name: 'devpoint', discipline: 'coding', founded: '2013')
      delete :destroy, id: institution.id
      expect(response).to redirect_to institutions_path
    end
  end
end
