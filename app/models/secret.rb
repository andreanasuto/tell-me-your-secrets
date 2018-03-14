class Secret < ApplicationRecord
belongs_to :location


  def returnSecret
    #@secret_sentences = self.all.map { |e| e.sentence }
    @secret_found = Secret.all.find { |secret| secret.sentence.include?(self.sentence.split[0])}
    if @secret_found != self
      return @secret_found
    else
        return Secret.all.sample
    end
  end

end
