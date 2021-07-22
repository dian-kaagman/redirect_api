Rails.application.routes.draw do
  get '/',                      :controller => :redirects,      :action => :index
  get '/:id',                   :controller => :redirects,      :action => :redirect
  post '/url',                  :controller => :redirects,      :action => :url
  post '/redirects',            :controller => :redirects,      :action => :create

  post 'qr-code',               :controller => :qr_codes,       :action => :create
end
