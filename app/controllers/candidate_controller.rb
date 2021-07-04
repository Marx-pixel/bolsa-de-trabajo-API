class CandidateController < ApplicationController
    include GeneralLoginConcern

    before_action :check_token, only: [:logout]

    def candidate_signin
        company = Company.find_by(name: params[:name])
        if company.nil?
            candidate = Candidate.new(candidate_params)
            if candidate.save
                mesg = "Usuario creado exitosamente"
                render(json: mesg, status: 200)
            else
                render(json: candidate.errors.full_messages, status: 401)
            end
        else
            mesg = "El nombre de usuario ya existe"
            render(json: mesg, status: 401)
        end
    end

    private

    def candidate_params
        params.require(:candidate).permit(:name, :password)
    end
end
