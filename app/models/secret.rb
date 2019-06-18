class Secret < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :sentence, presence: {message: 'You should insert a secret!'}
  validates_associated :location
  validates_presence_of :location

def close_secrets
  secrets = []
  self.location.nearbys.collect do |l|
    l.secrets.each do |secret|
      secrets << secret
    end
  end
  secrets.reject { |e| e.user == self.user }
end

def check_user
  if params[:id] || params[:user_id]
    User.find(params[:id] || params[:user_id]) == current_user
  end
end

def check_user_secret(user)
  self.user == user
end

# return a random secret once a secret is shared
# def returnSecret
#   secret_found = Secret.all.sample
#   # it avoids that it returns the secret just shared by itself
#     if secret_found == self
#        return self.returnSecret
#     else
#       return secret_found
#     end
# end
#
# # more complex method to return secret founds
#    def returnSecretComplex
#     @secret_found = self.findSecret
#     if @secret_found != self
#       return @secret_found
#     else
#         return self.findSecret.sample
#      end
#     end
#
#   def findSecret
#       Secret.all.find_all{ |secret| self.sentence.split.find { |i| secret.sentence.include?(i) } }
#   end
end
