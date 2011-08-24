class Geolocation
  
  def initialize(params)
    @params = symbolize_keys(params)
  end
  
  def latitude
    @latitude ||= @params[:coords][:latitude].to_f
  end
  
  def longitude
    @longitude ||= @params[:coords][:longitude].to_f
  end
  
  private
  
  def symbolize_keys(params)
    params.inject({}) do |memo,(key,val)|
      if val.is_a? Hash
        memo[key.to_sym] = symbolize_keys(val)
        memo
      else
        memo[key.to_sym] = val
        memo
      end
    end
  end
  
end