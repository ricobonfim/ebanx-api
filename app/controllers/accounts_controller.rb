class AccountsController < ApplicationController
  # Get balance for non-existing account
  # GET /balance?account_id=1234
  # 404 0

  # Get balance for existing account
  # GET /balance?account_id=100
  # 200 20
  def balance
    account = Account.find(balance_params['account_id'])

    render json: account.balance
  rescue ActiveRecord::RecordNotFound
    render status: 404, json: 0
  end

  # Create account with initial balance
  # POST /event {"type":"deposit", "destination":"100", "amount":10}
  # 201 {"destination": {"id":"100", "balance":10}}

  # Deposit into existing account
  # POST /event {"type":"deposit", "destination":"100", "amount":10}
  # 201 {"destination": {"id":"100", "balance":20}}

  # Withdraw from non-existing account
  # POST /event {"type":"withdraw", "origin":"200", "amount":10}
  # 404 0

  # Withdraw from existing account
  # POST /event {"type":"withdraw", "origin":"100", "amount":5}
  # 201 {"origin": {"id":"100", "balance":15}}

  # Transfer from existing account
  # POST /event {"type":"transfer", "origin":"100", "amount":15, "destination":"300"}
  # 201 {"origin": {"id":"100", "balance":0}, "destination": {"id":"300", "balance":15}}

  # Transfer from non-existing account
  # POST /event {"type":"transfer", "origin":"200", "amount":15, "destination":"300"}
  # 404 0
  def event
    account_event = AccountServiceFactory.create(event_params)
    @accounts = account_event.handle
    render status: :created
  rescue ActiveRecord::RecordNotFound
    render status: 404, json: 0
  end

  # Reset state before starting tests
  # POST /reset
  # 200 OK
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
