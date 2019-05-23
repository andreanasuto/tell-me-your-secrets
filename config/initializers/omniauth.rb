Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, '79204877464-ad6cspjs08t1f9noj3eq2djcq1vvi2an.apps.googleusercontent.com', 'b2PRRDISednqojiQ5shB1RI8'
end
