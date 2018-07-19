class Secret < ApplicationRecord
  geocoded_by :ip_address,
  :latitude => :lat, :longitude => :lon
  after_validation :geocode

# return a secret once a secret is shared

def returnSecret
  secret_found = Secret.all.sample
    if secret_found == self
       return self.returnSecret
    else
      return secret_found
    end
end

# more complex method to return secret found

   def returnSecretComplex
    @secret_found = self.findSecret
    if @secret_found != self
      return @secret_found
    else
        return self.findSecret.sample
     end
    end

  def findSecret

      Secret.all.find_all{ |secret| self.sentence.split.find { |i| secret.sentence.include?(i) } }
    
  end
end  
