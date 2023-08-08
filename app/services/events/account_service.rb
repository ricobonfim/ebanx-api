module Events
  class AccountService
    def initialize(data)
      @data = data
    end
  
    def handle; end
  
    private
  
    def amount
      data['amount'].to_i
    end
  
    def data
      @data
    end
  
    def destination
      data['destination'].to_i
    end
  
    def origin
      data['origin'].to_i
    end
  end
end
