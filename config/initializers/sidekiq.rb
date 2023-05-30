# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  # Ideal colocar esses valores como env vars/secrets
  [user, password] == ['rarofood', 'rarofood@r@r0@c@demy2023']
end
