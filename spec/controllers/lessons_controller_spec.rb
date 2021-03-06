  require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe LessonsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Lesson. As you add validations to Lesson, be sure to
  # adjust the attributes here as well.
  let(:institution) { FactoryGirl.create :institution}
  let(:course) { FactoryGirl.create :course, institution_id: institution.id }
  let(:lesson) { FactoryGirl.create :lesson, course_id: course.id}

  let(:invalid_attributes) {
    { name: '' }
  }

  before(:each) do
    institution
    course
  end
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LessonsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all lessons as @lessons" do
      lesson
      get :index, params: { institution_id: institution.id, course_id: course.id }
      expect(assigns(:lessons)).to eq([lesson])
    end
  end

  describe "GET #show" do
    it "assigns the requested lesson as @lesson" do
      lesson
      get :show, params: { institution_id: institution.id, course_id: course.id, id: lesson.to_param}
      expect(assigns(:lesson)).to eq(lesson)
    end
  end

  describe "GET #new" do
    it "assigns a new lesson as @lesson" do
      get :new, params: { institution_id: institution.id, course_id: course.id }
      expect(assigns(:lesson)).to be_a_new(Lesson)
    end
  end

  describe "GET #edit" do
    it "assigns the requested lesson as @lesson" do
      lesson
      get :edit, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param}
      expect(assigns(:lesson)).to eq(lesson)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        @lesson_params = {name: 'Ruby', subject: 'Ruby', content: 'Ruby stuff', course_id: course.id }
        post :create, institution_id: institution.id, course_id: course.id, lesson: @lesson_params
      end
      it "creates a new Lesson" do
        expect(Lesson.count).to eq(1)
      end

      it "assigns a newly created lesson as @lesson" do       
        expect(assigns(:lesson)).to be_a(Lesson)
        expect(assigns(:lesson)).to be_persisted
      end

      it "redirects to the created lesson" do
        expect(response).to redirect_to(institution_course_lesson_path(institution, course, Lesson.first.id))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved lesson as @lesson" do
        post :create, params: {institution_id: institution.id, course_id: course.id, lesson: invalid_attributes}
        expect(assigns(:lesson)).to be_a_new(Lesson)
      end

      it "re-renders the 'new' template" do
        post :create, params: {institution_id: institution.id, course_id: course.id, lesson: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'javascript' }
      }

      it "updates the requested lesson" do
        lesson
        put :update, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param, lesson: new_attributes}
        expect(lesson.reload.name).to eq('javascript')
      end

      it "assigns the requested lesson as @lesson" do
        lesson
        @lesson_params = {name: 'Ruby', subject: 'Ruby', content: 'Ruby stuff', course_id: course.id }
        put :update, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param, lesson: @lesson_params}
        expect(assigns(:lesson)).to eq(lesson)
      end

      it "redirects to the lesson" do
        lesson
        @lesson_params = {name: 'Ruby', subject: 'Ruby', content: 'Ruby stuff', course_id: course.id }
        put :update, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param, lesson: @lesson_params}
        expect(response).to redirect_to(institution_course_lesson_path(institution, course, lesson))
      end
    end

    context "with invalid params" do
      it "assigns the lesson as @lesson" do
        lesson
        put :update, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param, lesson: invalid_attributes}
        expect(assigns(:lesson)).to eq(lesson)
      end

      it "re-renders the 'edit' template" do
        lesson
        put :update, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param, lesson: invalid_attributes}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested lesson" do
      lesson
      expect {
        delete :destroy, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param}
      }.to change(Lesson, :count).by(-1)
    end

    it "redirects to the lessons list" do
      lesson
      delete :destroy, params: {institution_id: institution.id, course_id: course.id, id: lesson.to_param}
      expect(response).to redirect_to(institution_course_path(institution, course))
    end
  end

end
