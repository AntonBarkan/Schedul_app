
#OmniAuth.config.logger = Rails.logger

#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :google_oauth2,
#            '688144363652-brriul4ifu7rubps2hspt2c1ujhdth87.apps.googleusercontent.com',
#            'ol6yRPwEtD0g_dN94jzNemo0',
#            :access_type => 'offline',
#            :scope => ' calendar',
#            {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
#end

#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :google_oauth2,
#           ENV['688144363652-brriul4ifu7rubps2hspt2c1ujhdth87.apps.googleusercontent.com'],
#           ENV['ol6yRPwEtD0g_dN94jzNemo0'], {
#      :access_type => 'offline',
#      :scope => ' calendar'
#      #:redirect_uri => 'http://localhost/auth/google_oauth2/callback'
#  }
#end