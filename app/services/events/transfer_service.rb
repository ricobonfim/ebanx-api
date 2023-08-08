module Events
  class TransferService < Events::AccountService
    def handle
      ActiveRecord::Base.transaction do
        [
          WithdrawService.new(data).handle[0],
          DepositService.new(data).handle[1]
        ]
      end
    end
  end
end
