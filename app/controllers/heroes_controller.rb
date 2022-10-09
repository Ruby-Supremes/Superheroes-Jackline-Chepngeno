class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        heroes = Hero.all
        render json: heroes, include: ['id','name','super_name']
    end

    def show
        hero = find_hero
        render json: hero
    end

    private
    
    def render_not_found_response
        render json: { error: "Hero not found" }, status: 404
    end

    def find_hero
        Hero.find(params[:id])
    end
end
