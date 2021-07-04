class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def current_user
        @current_user ||= ( Candidate.find_by(token: params[:token]) || Company.find_by(token: params[:token]) )
    end

    def check_token
        return if current_user.present?

        mesg = "Usuario no identificado"
        render(json: mesg, status: 401)
    end
end
