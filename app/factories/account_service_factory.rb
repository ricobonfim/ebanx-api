class AccountServiceFactory
  def self.create(params)
    case params['type']
    when 'deposit'
      Events::DepositService.new params
    when 'withdraw'
      Events::WithdrawService.new params
    when 'transfer'
      Events::TransferService.new params
    end
  end
end
