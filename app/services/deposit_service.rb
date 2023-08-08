class DepositService < AccountService
  def handle
    account = Account.find_or_create(id: destination)
    account.update!(balance: account.balance + amount)
    account
  end
end
