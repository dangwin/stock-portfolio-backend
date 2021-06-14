class Stock < ApplicationRecord

    belongs_to :user
    
    def current_price
        quote = Alphavantage::TimeSeries.new(symbol: self.symbol).quote
        quote.price
    end

end
