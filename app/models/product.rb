class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true , numericality: {greater_than: 0}


  # confirma si un producto esta vencido o no
  # def self.vencido(entrada) do
  #   if entrada == 0 then
  #     return "Vencido"
  #   else
  #     return "VigKente"
  #   end
  # end
  
  def expiration(date)
    if date < expiration_date
      return "Vencido"
    else
      return "Vigente"
    end
  end

  
end
