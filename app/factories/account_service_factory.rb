class AccountServiceFactory
  def self.create(params)
    case params['type']
    when 'deposit'
      DepositService.new params
    when 'withdraw'
      WithdrawService.new params
    when 'transfer'
      TransferService.new params
    end
  end
end
