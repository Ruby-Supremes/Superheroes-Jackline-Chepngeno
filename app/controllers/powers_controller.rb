class PowersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :validation_error

    def index
        powers = Power.all
        render json:  powers, include: ['id','name','description']
    end

    def show
        power = find_power
        render json: power
    end

    def update
        power = find_power
        power.update(power_params)
        render json: power
    end

    private
    def power_params
        params.permit(:description)
    end
    
    def find_power
        Power.find(params[:id])
    end
    
    def render_not_found_response
        render json: { error: "Power not found" }, status: 404
    end

    def validation_error
        render json: { error:  ["validation errors"]}, status: 422
    end
    
end
