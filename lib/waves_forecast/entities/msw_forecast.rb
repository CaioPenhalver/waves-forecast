class MSWForecast
  attr_accessor :timestamp, :localTimestamp, :issueTimestamp, :fadedRating,
                :solidRating, :swell, :wind, :condition, :charts

  def initialize(params)
    params.each do |attr, value|
      send("#{attr}=", value) if respond_to?(:"#{attr}=")
    end
  end

  def swell=(swell)
    @swell = Swell.new swell
  end

  class Swell
    attr_accessor :absMinBreakingHeight, :absMaxBreakingHeight, :probability,
                  :unit, :minBreakingHeight, :maxBreakingHeight, :components

    def initialize(params)
      params.each do |attr, value|
        send("#{attr}=", value) if respond_to?(:"#{attr}=")
      end
    end
  end
end
