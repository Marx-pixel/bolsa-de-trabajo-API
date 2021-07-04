class PostulationController < ApplicationController
    before_action :check_token, only: [:bring_postulations, :hire_postulant, :reject_postulant, :interest_postulant, :postulate, :my_postulations]

    def bring_postulations
        job_offer = current_company.job_offers.find_by(id: params[:id])
        if job_offer.present?
            postulations = job_offer.postulations
            if postulations.present?
                render(json: postulations.as_json(only: [:id, :candidate_name, :status]), status: 200)
            else
                mesg = "Aún no hay postulaciones"
                render(json: mesg, status: 200)
            end
        else
            mesg = "La oferta laboral no existe"
            render(json: mesg, status: 404)
        end
    end

    def hire_postulant
        postulation = Postulation.find_by(id: params[:id])
        if postulation.present?
            job_offer = postulation.job_offer
            my_postulation = current_company.job_offers.find_by(id: job_offer.id)
            if my_postulation.present?
                postulation.status = "Hired"
                if postulation.save
                    mesg = "Postulante contratado"
                    render(json: mesg, status: 200)
                else
                    render(json: postulation.errors.full_messages, status: 401)
                end
            else
                mesg = "La postulación no corresponde a una oferta laboral suya"
                render(json: mesg, status: 401)
            end
        else
            mesg = "La postulación no existe"
            render(json: mesg, status: 404)
        end
    end

    def reject_postulant
        postulation = Postulation.find_by(id: params[:id])
        if postulation.present?
            job_offer = postulation.job_offer
            my_postulation = current_company.job_offers.find_by(id: job_offer.id)
            if my_postulation.present?
                postulation.status = "Rejected"
                if postulation.save
                    mesg = "Postulante rechazado"
                    render(json: mesg, status: 200)
                else
                    render(json: postulation.errors.full_messages, status: 401)
                end
            else
                mesg = "La postulación no corresponde a una oferta laboral suya"
                render(json: mesg, status: 401)
            end
        else
            mesg = "La postulación no existe"
            render(json: mesg, status: 404)
        end
    end

    def interest_postulant
        postulation = Postulation.find_by(id: params[:id])
        if postulation.present?
            job_offer = postulation.job_offer
            my_postulation = current_company.job_offers.find_by(id: job_offer.id)
            if my_postulation.present?
                postulation.status = "Interested"
                if postulation.save
                    mesg = "Postulante interesado"
                    render(json: mesg, status: 200)
                else
                    render(json: postulation.errors.full_messages, status: 401)
                end
            else
                mesg = "La postulación no corresponde a una oferta laboral suya"
                render(json: mesg, status: 401)
            end
        else
            mesg = "La postulación no existe"
            render(json: mesg, status: 404)
        end
    end

    def postulate
        job_offer = JobOffer.find_by(id: params[:id])
        if job_offer.present?
            if job_offer.status == "Active"
                candidate_offer = current_candidate.job_offers.find_by(id: params[:id])
                if candidate_offer.present?
                    mesg = "Solo puedes postularte una vez"
                    render(json: mesg, status: 401)
                else
                    new_postulation = job_offer.postulations.new()
                    new_postulation.status = "Pending"
                    new_postulation.job_name = job_offer.name
                    new_postulation.candidate_name = current_candidate.name
                    current_candidate.postulations << new_postulation
                    if new_postulation.save
                        mesg = "Postulación creada"
                        render(json: mesg, status: 200)
                    else
                        render(json: new_postulation.erros.full_messages, status: 401)
                    end
                end 
            else
                mesg = "La oferta laboral está cerrada"
                render(json: mesg, status: 401)
            end
        else
            mesg = "La oferta laboral no existe"
            render(json: mesg, status: 404)
        end
    end

    def my_postulations
        postulations = current_candidate.postulations
        if postulations.present?
            render(json: postulations.as_json(only: [:id, :job_name, :status]), status: 200)
        else
            mesg = "No tienes postulaciones aún"
            render(json: mesg, status: 200)
        end
    end

    private

    def current_company
        @current_company ||= Company.find_by(token: params[:token])
    end

    def current_candidate
        @current_candidate ||= Candidate.find_by(token: params[:token])
    end
end
