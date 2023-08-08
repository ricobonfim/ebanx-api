class AccountsController < ApplicationController
  # GET /balance
  def balance
    account = Account.find(balance_params['account_id'])

    render json: account.balance
  rescue ActiveRecord::RecordNotFound
    render status: 404, json: 0
  end

  # POST /event
  def event
    account_event = AccountServiceFactory.create(event_params)
    @accounts = account_event.handle
    render status: :created
  rescue ActiveRecord::RecordNotFound
    render status: 404, json: 0
  end

  # POST /reset
  def reset
    Account.all.delete_all

    render status: :ok, json: 'OK'
  end

  private
  
  def balance_params
    params.permit :account_id
  end

  def event_params
    params.permit [:amount, :destination, :origin, :type]
  end
end
