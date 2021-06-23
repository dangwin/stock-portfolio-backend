class Stock < ApplicationRecord
    belongs_to :user

    validate :valid_symbol?
    validates :quantity, presence: true, numericality: true

    before_save :update_name
    
    def current_price
        quote = Alphavantage::TimeSeries.new(symbol: self.symbol).quote
        quote&.price
    end

    def valid_symbol?
        if current_price.nil?
            errors.add(:symbol, "invalid symbol")
        end
    end

    def update_name
        company = Alphavantage::Fundamental.new(symbol: self.symbol)
        self.name = company.overview.name
    end

end
