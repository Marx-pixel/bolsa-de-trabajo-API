class JobOffersController < ApplicationController
    before_action :check_token, only: [:create_job_offer, :delete_job_offer, :close_job_offer, :my_job_offers, :bring_offers]

    def create_job_offer
        job_offer = current_company.job_offers.new(job_offer_params)
        job_offer.company_name = current_company.name
        job_offer.status = "Active"
        if job_offer.save
            mesg = "Oferta laboral creada"
            render(json: mesg, status: 200)
        else
            render(json: job_offer.errors.full_messages, status: 401)
        end
    end

    def delete_job_offer
        job_offer = current_company.job_offers.find_by(id: params[:id])
        if job_offer.present?
            job_offer.destroy
            mesg = "Oferta laboral eliminada"
            render(json: mesg, status: 200)
        else
            mesg = "Oferta laboral no encontrada"
            render(json: mesg, status: 404)
        end
    end

    def my_job_offers
        jobs = current_company.job_offers
        if jobs.present?
            render(json: jobs.as_json(only: [:id, :name, :description, :status]), status: 200)
        else
            mesg = "Aún no tienes ofertas laborales"
            render(json: mesg, status: 200)
        end
    end

    def close_job_offer
        job_offer = current_company.job_offers.find_by(id: params[:id])
        if job_offer.present?
            job_offer.status = "Closed"
            job_offer.save!
            mesg = "Oferta laboral cerrada"
            render(json: mesg, status: 200)
        else
            mesg = "Oferta laboral no encontrada"
            render(json: mesg, status: 404)
        end
    end

    def bring_offers
        job_offer = JobOffer.where(status: "Active")
        if job_offer.present? 
            render(json: job_offer.as_json(only: [:id, :company_name, :name, :description]), status: 200)
        else
            mesg = 'Aún no hay ofertas laborales'
            render(json: mesg, status: 200)
        end
    end

    private

    def current_company
        @current_company ||= Company.find_by(token: params[:token])
    end

    def job_offer_params
        params.require(:job_offer).permit(:name, :description)
    end
end
