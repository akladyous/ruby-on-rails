module Products
  class Creator

    def initialize(product)
      @product = product
    end

    def save
      price_in_cents if @product.preice.present?
    end

    private

    def price_in_cents
    end
  end
end
