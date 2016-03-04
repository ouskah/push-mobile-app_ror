class DevicesController < ApplicationController
  
    before_filter :set_resources  
    authorize_resource
    
    
  def new
      if params[:key] == @app.token
          @device = @app.devices.new(device_params)
          if @device.save
              render json: {success: 1} 
          else
              render json: {error: 1, errors: @device.errors}
          end
          
      else
          render json: {error: "La clef ne semble pas valide"}
      end
  end
    
    
  def destroy
      authorize! :destroy, @app
      @device.destroy
      redirect_to @app, flash: {success: "Le périphérique a bien été supprimé"}
      
  end
    
    
    
  protected
  
    def set_resources
    
        @app = App.find(params[:app_id])
        @device = Device.find(params[:id]) if params[:id]
    
    end
    
    
    def device_params
        params.permit(:platform, :version, :uuid, :model, :token)
        
    end

end
