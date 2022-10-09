class HeroPowersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :validation_error
    def create
        hero = HeroPower.create!(heropower_param)
        render json: hero,  status: 201
      end
    
      private 
    
      def validation_error
        render json: { error:  ["validation errors"]}, status: 422
      end
    
      def heropower_param
        params.permit(:strength, :power_id, :hero_id)
      end
      
end
