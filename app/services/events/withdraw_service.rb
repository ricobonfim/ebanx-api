module Events
  class WithdrawService < Events::AccountService
    def handle
      account = Account.find(origin)
      account.update!(balance: account.balance - amount)
      [account, nil]
    end
  end
end
