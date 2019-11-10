class Api::DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render 'index.json.jb'
  end

  def show
    @dog = Dog.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @dog = Dog.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed]
    )
    @dog.save
    render 'show.json.jb'
  end

  def update
    # find the dog
    @dog = Dog.find_by(id: params[:id])
    # change the dog
    @dog.age = params[:age] || @dog.age
    @dog.breed = params[:breed] || @dog.breed
    @dog.name = params[:name] || @dog.name
    @dog.save
    render 'show.json.jb'
  end

  def destroy
    @dog = Dog.find_by(id: params[:id])
    @dog.destroy
    render 'destroy.json.jb'
  end
end
