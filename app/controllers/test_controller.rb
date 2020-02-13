class TestController < ApplicationController
  def index    
  end

  def new
    @address = Adresses.new
  end

  def create
    @address = Adresses.new(address_params)
  end

  private
  def address_params
    params.require(:address).permit(:family_name,:last_name,:j_family_name,:postal_code,:prefectures,:municipality,:number,:details,:phone_number)

end
