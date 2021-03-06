require 'spec_helper'

describe Temando::Request, :remote => true do

  describe ".quotes_for" do
    let(:item) { valid_temando_item }
    let(:origin) { Temando::Location.new(:country => 'AU',
                                         :suburb => 'Brisbane',
                                         :postcode => '4000'
                                        ) }
    let(:destination) { Temando::Location.new(:country => 'AU',
                                         :suburb => 'Sydney',
                                         :postcode => '2000'
                                        ) }
    let(:delivery) { Temando::Delivery::DoorToDoor.new(origin, destination) }
    let(:request) { subject.items << item; subject }

    it "dispatches the data in and out from Temando::Api::GetQuotesByRequest" do
      pending "provide real API details"
      Temando::Api::Base.config.username = 'username'
      Temando::Api::Base.config.password = 'password'

      response = request.quotes_for(delivery)

      response.should be_a(Array)
      response.first.should be_a(Temando::Quote)
    end
  end
end
