class DepositService < AccountService
  def handle
    account = Account.find_or_create_by(id: destination)
    account.update!(balance: account.balance + amount)
    [nil, account]
  end
end
