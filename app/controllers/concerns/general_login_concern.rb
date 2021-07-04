module GeneralLoginConcern
    extend ActiveSupport::Concern

    included do
        helper_method :login, :logout
    end

    def login
        if login_user.present?
            if login_user.password == params[:password]
                login_user.token = SecureRandom.urlsafe_base64
                login_user.save!
                render(json: {token: login_user.token}, status: 200)
            else
                mesg = "Contraseña incorrecta"
                render(json: mesg, status: 401)
            end
        else
            mesg = "El usuario no existe"
            render(json: mesg, status: 401)
        end
    end

    def login_user
        @login_user ||= ( Candidate.find_by(name: params[:name]) || Company.find_by(name: params[:name]) )
    end

    def logout
        logout_user.token = nil
        logout_user.save!
        
        mesg = "Sesión cerrada"
        render(json: mesg, status: 200)
    end

    def logout_user
        @logout_user ||= ( Candidate.find_by(token: params[:token]) || Company.find_by(token: params[:token]) )
    end
end