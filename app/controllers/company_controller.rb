class CompanyController < ApplicationController
include GeneralLoginConcern

before_action :check_token, only: [:logout]

    def company_signin
        candidate = Candidate.find_by(name: params[:name])
        if candidate.nil?
            company = Company.new(company_params)
            if company.save
                mesg = "Usuario creado exitosamente"
                render(json: mesg, status: 200)
            else
                render(json: company.errors.full_messages, status: 401)
            end
        else
            mesg = "El nombre de usuario ya existe"
            render(json: mesg, status: 401)
        end        
    end

    private

    def company_params
        params.require(:company).permit(:name, :password)
    end
end
