module Api
  module V1
    class PracticesController < ApiController
      respond_to :json

      def index
        respond_with Practice.select(:id, :name)
      end
      
      def show
        respond_with Practice.find(params[:id])
      end

      def named
        respond_with Practice.find_by(name: params[:name])
      end
    end
  end
end
