require 'pry'
class PokemonsController < ApplicationController
  def index
      pokemons = pokemon.all
      render json:pokemons
  end

  def show
      pokemon = Pokemon.find(params[:id])
      render json:pokemon
  end

  def create
    trainer = Trainer.find(params[:trainer_id])
    pokemon = trainer.pokemons.build({
      nickname: Faker::Name.first_name ,
      species: Faker::Games::Pokemon.name


      })

      if pokemon.save
        render json :pokemon
      else
        binding.pry

  end

  def destroy
    pokemon = Pokemon.find(params[:id])
    pokemon.destroy
  end




end