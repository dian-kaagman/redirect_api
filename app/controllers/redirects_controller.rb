class RedirectsController < ApplicationController

    def index
        render plain: 'API for redirecting'
    end

    def url
        redirects = Redirect.where(url: params[:url])
        if redirects.size < 1
            render :json => "Redirects with url: #{params[:url]} were not found", :status => 404 
            return
        end

        render json: redirects, :status => 200
    end

    def redirect
        redirect = Redirect.find_by(id: params[:id])
        if !redirect
            error_url = "https://verwijslink.nl/error"
            error_url << "?id=#{params[:id]}" if params[:id]
            redirect_to error_url
            return
        end

        redirect_to redirect.url
    end

    def create
        if !params[:url]
            render :json => "Missing url parameter", :status => 500 
            return
        end 

        redirect = Redirect.new(url: params[:url])
        if redirect.save!
            render json: {origin_url: "#{request.base_url}/#{redirect.id}"}, :status => 200 
        else 
            render json: "Failed", :status => 500
        end
    end
end