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
      render :new, status: :found
    end
  end

  def edit; end

  def update
    if @person.update(person_params)
      redirect_to people_path
    else
      @person.build_address if @person.address.nil?

      render :edit, status: :found
    end
  end

  def destroy
    @person.destroy

    redirect_to people_path, notice: "sucesso"
  end

  private

  def load_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :email, :phone, :birthdate, address_attributes)
  end

  def address_attributes
    { address_attributes: %i[id _destroy street city state postal_code country] }
  end
end
