class PeopleController < ApplicationController
  before_action :load_person, only: %i[show edit update destroy]

  def index
    @people = Person.all
  end

  def show; end

  def new
    @person = Person.new
    @person.build_address
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    @person.destroy

    redirect_to people_path, notice: 'sucesso'
  end

  private

  def load_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :email, :phone, :birthdate, address_attributes)
  end

  def address_attributes
    { address_attributes: %i[id street city state postal_code country] }
  end
end
