class Secret < ApplicationRecord
  geocoded_by :ip_address,
  :latitude => :lat, :longitude => :lon
  after_validation :geocode

def returnSecret
  Secret.all.sample
end

   def returnSecretComplex
    @secret_found = self.findSecret
    if @secret_found != self
      return @secret_found
    else
        return self.findSecretsample
     end
    end

  def findSecret

      Secret.all.find_all{ |secret| self.sentence.split.find { |i| secret.sentence.include?(i) } }
    
  end
end  
