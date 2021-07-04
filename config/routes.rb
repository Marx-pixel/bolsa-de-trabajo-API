Rails.application.routes.draw do
  concern :general_login do
    collection do
      post :login 
      post :logout
    end
  end

  resources :company, concerns: [:general_login] do
    collection do
      post :company_signin
    end
  end

  resources :candidate, concerns: [:general_login] do
    collection do
      post :candidate_signin
    end
  end

  resources :job_offers do
    collection do
      post :create_job_offer
      get :my_job_offers
      get :bring_offers
    end

    member do
      delete :delete_job_offer
      post :close_job_offer
    end
  end

  resources :postulation do
    collection do
      get 'bring_postulations/:id', to: 'postulation#bring_postulations'
      get :my_postulations
    end

    member do
      post :postulate
      post :hire_postulant
      post :reject_postulant
      post :interest_postulant
    end
  end
end
