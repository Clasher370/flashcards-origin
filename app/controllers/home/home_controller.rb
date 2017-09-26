module Home
  class HomeController < BaseController
    def index
      @card = CardOnIndex.setter(params[:id], current_user)

      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
