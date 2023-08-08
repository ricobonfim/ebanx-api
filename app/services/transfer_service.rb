class TransferService < AccountService
  def handle
    ActiveRecord::Base.transaction do
      [
        WithdrawService.new(data).handle,
        DepositService.new(data).handle
      ]
    end
  end
end
