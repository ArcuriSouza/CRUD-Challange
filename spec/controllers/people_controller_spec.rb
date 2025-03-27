require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  let!(:person) { create(:person) }

  describe 'GET' do
    describe '#index' do
      let!(:second_person) { create(:person, name: 'Jessica Doe', email: 'jessica@example.com') }

      before { get :index }

      it 'returns all people on the @people variable' do
        expect(assigns(:people)).to contain_exactly(person, second_person)
      end

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end
    end

    describe '#show' do
      before { get :show, params: { id: person.id } }

      it 'returns the correct person on the @person variable' do
        expect(assigns(:person)).to eq(person)
      end

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end
    end

    describe '#new' do
      before { get :new }

      it 'returns a new Person instance' do
        expect(assigns(:person)).to be_a_new(Person)
      end

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end
    end

    describe '#edit' do
      before { get :edit, params: { id: person.id } }

      it 'returns a correct person' do
        expect(assigns(:person)).to eq(person)
      end

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST' do
    describe '#create' do
      context 'when send valid params' do
        before { post :create, params: person_params }

        it 'returns a valid person' do
          expect(assigns(:person)).to be_valid
        end

        it 'creates the user' do
          expect(Person.count).to eq(2)
        end

        it 'has a 301 status code' do
          expect(response.status).to eq(302)
        end
      end

      context 'when send invalid params' do
        before { post :create, params: person_params(false) }

        it 'person should not be valid' do
          expect(assigns(:person)).not_to be_valid
          expect(assigns(:person).errors[:name]).to include("Nome deve ser preenchido")
        end

        it 'should render new action' do
          expect(response).to render_template(:new)
        end

        it 'should not create the person' do
          expect(Person.count).to eq(1)
        end
      end
    end
  end

  describe 'PUT' do
    describe '#update' do
      context 'when send valid params' do
        before { put :update, params: { id: person.id, person: { name: 'Robert Doe' } } }

        it 'returns an updated person' do
          expect(person.reload.name).to eq('Robert Doe')
        end

        it 'has a 301 status code' do
          expect(response.status).to eq(302)
        end
      end

      context 'when send invalid params' do
        before { put :update, params: { id: person.id, person: { name: nil } } }

        it 'person should not be valid' do
          expect(assigns(:person)).not_to be_valid
          expect(assigns(:person).errors[:name]).to include("Nome deve ser preenchido")
        end

        it 'should render edit action' do
          expect(response).to render_template(:edit)
        end
      end
    end
  end

  def person_params(valid = true)
    {
      person: {
        name: valid ? 'Jessica Doe' : nil,
        email: 'jessica.doe@example.com'
      }
    }
  end
end
