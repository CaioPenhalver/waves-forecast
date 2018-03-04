require 'features_helper'

RSpec.describe MSWCommand do
  let(:json_response) do
    x = [{
    timestamp: 1366902000,
    localTimestamp: 1366902000,
    issueTimestamp: 1366848000,
    fadedRating: 0,
    solidRating: 0,
    swell: {
        minBreakingHeight: 1,
        absMinBreakingHeight: 1.06,
        maxBreakingHeight: 2,
        absMaxBreakingHeight: 1.66,
        unit: "ft",
        components: {
            combined: {
            height: 1.1,
            period: 14,
            direction: 93.25,
            compassDirection: "W"
        },
        primary: {
            height: 1,
            period: 7,
            direction: 83.37,
            compassDirection: "W"
        },
        secondary: {
            height: 0.4,
            period: 9,
            direction: 92.32,
            compassDirection: "W"
        },
        tertiary: {
            height: 0.3,
            period: 13,
            direction: 94.47,
            compassDirection: "W"
        }
        }
    },
    wind: {
        speed: 10,
        direction: 85,
        compassDirection: "W",
        chill: 15,
        gusts: 13,
        unit: "mph"
    },
    condition: {
        pressure: 1020,
        temperature: 18,
        unitPressure: "mb",
        unit: "c"
    },
    charts: {
        swell: "http://cdn.magicseaweed.com/wave/750/1-1366902000-1.gif",
        period: "http://cdn.magicseaweed.com/wave/750/1-1366902000-2.gif",
        wind: "http://cdn.magicseaweed.com/gfs/750/1-1366902000-4.gif",
        pressure: "http://cdn.magicseaweed.com/gfs/750/1-1366902000-3.gif",
        sst: "http://cdn.magicseaweed.com/sst/750/1-1366902000-10.gif"
    }
    }]
    JSON.generate x
  end

  # subject do
  #   http_service = instance_double('HttpService')
  #   response = instance_double('Net::HTTPResponse')
  #   allow(http_service).to receive(:get).and_return(response)
  #   allow(response).to receive(:body).and_return(json_response)
  #   described_class.new(34, http_service).execute
  # end
  subject do
    http_service = instance_double('HttpService')
    response = instance_double('Net::HTTPResponse')
    response = Net::HTTPResponse.new(1.0, 200, 'ok')
    response.body = json_response
    allow(http_service).to receive(:get).and_return(response)
    described_class.new(34, http_service).execute
  end

  context 'receive the right respose' do
    it 'receive json' do
      expect(subject.body).to eq json_response
    end
  end
end
