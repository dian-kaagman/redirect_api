# README

## API
Landing page for api, just rendering plain welcome text

	get '/',                      :controller => :redirects,      :action => :index
	
Route for redirecting to Redirect.url, so api.redirect.nl/1 -> google.nl

  	get '/:id',                   :controller => :redirects,      :action => :redirect
	
Get all Redirect objects with url given through params
	
  	post '/url',                  :controller => :redirects,      :action => :url
	
Create a new redirect url by giving a url param
	
  	post '/redirects',            :controller => :redirects,      :action => :create