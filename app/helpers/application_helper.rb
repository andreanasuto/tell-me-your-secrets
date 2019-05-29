module ApplicationHelper

  def have_access_to_secrets?(secret)
    if @secrets == current_user.secrets
      render partial: 'secrets/links', locals: {secret: secret}
    end
  end
end
