class Secret < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :sentence, presence: true

def secrets_close_to_a_location
  # this method should return secrets that are close to a location
end

# return a random secret once a secret is shared
def returnSecret
  secret_found = Secret.all.sample
  # it avoids that it returns the secret just shared by itself
    if secret_found == self
       return self.returnSecret
    else
      return secret_found
    end
end

# more complex method to return secret founds
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
