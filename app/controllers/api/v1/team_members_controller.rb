module Api
  module V1
    class TeamMembersController < ApiController
      respond_to :json

      def index
        respond_with TeamMember.select(:id, :name, :practice_id)
      end
      
      def show
        respond_with TeamMember.find(params[:id])
      end

      def create
# binding.pry
        respond_with TeamMember.create(team_member_params)
      end

      def update
        tm = TeamMember.find(params[:id])
        respond_with tm.update_attributes(team_member_params)
      end

      def destroy
        tm = TeamMember.find_by_name("TestTM")
        respond_with tm.destroy
      end


      def named
        respond_with TeamMember.find_by(name: params[:name])
      end

      def team_member_params
        params.require(:team_member).permit(:name)
      end
    end
  end
end
