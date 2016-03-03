class AppsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
      @app = App.new
      
      
  end

  def create
      @app = App.new(apps_params) # on specifie les parametres que l'on autorise
      if @app.save
          reditect_to @app, success: "L'application #{@aap.name} a bien été créée"
      else
          flash.now[:error] = "Certains champs n'ont pas été correctement remplis"
          render "new"
      end
  end

  def destroy
  end


protected

    def apps_params # pour nettoyer les parametres => parametres que l'on autorise
        params.require(:app).permit(:name, :certificat_ios, :image)
    end

    
    
    
end