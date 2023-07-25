Rails.application.routes.draw do
  get '/blog', to: 'blogs#handle_foo'
end
