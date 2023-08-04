class AccountsController < ApplicationController
  def balance
    Rails.logger.info params
  end

  def events
    Rails.logger.info params
  end
  
  def reset
    Rails.logger.info "reset"
  end
end
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/balance', to: 'accounts#balance'
  post '/event', to: 'accounts#event'
  post '/reset', to: 'accounts#reset'
end
