
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           '688144363652-brriul4ifu7rubps2hspt2c1ujhdth87.apps.googleusercontent.com',
           'ol6yRPwEtD0g_dN94jzNemo0', {
      access_type: 'offline',
      scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
      redirect_uri:'http://localhost/auth/google_oauth2/callback'
  }
end