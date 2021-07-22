class Redirect < ApplicationRecord

    def base_url
        Rails.env.production? ? 'https://verwijslink.nl/' : 'http://localhost:3000/' 
    end

    def redirect_url
        base_url + self.id.to_s
    end

    def qr_code
        code = Barby::QrCode.new(self.redirect_url, size: 5)
        code.to_image({ xdim: 5 }).to_data_url
    end
end