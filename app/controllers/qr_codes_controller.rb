class QrCodesController < ApplicationController

    def create
        if !params[:url]
            render json: "Er is geen url meegegeven om een qr code te maken", status: 404
        end

        code = Barby::QrCode.new(params[:url], size: 5)
        send_data code.to_png({xdim: 5}), :filename => "qr_code.png", :content_type => "image/png", :disposition => "attachment"
    end

end