# frozen_string_literal: true

module Admin
  class ApiClientsController < BaseController
    def index
      @api_clients = collection.page(params[:page]).per(15)
    end

    def new
      @api_client = collection.new
    end

    def create
      @api_client = collection.new(api_client_params)

      if @api_client.save
        flash[:success] = 'ApiClient was successfully created'
        redirect_to admin_api_clients_path
      else
        render :new
      end
    end

    def edit
      @api_client = resource
    end

    def update
      @api_client = resource

      if @api_client.update(api_client_params)
        flash[:success] = 'ApiClient was successfully updated'
        redirect_to admin_api_clients_path
      else
        render :edit
      end
    end

    def destroy
      @api_client = resource
      @api_client.destroy!

      flash[:success] = 'ApiClient was successfully deleted'

      redirect_to admin_api_clients_path
    end

    private

    def api_client_params
      params.require(:api_client).permit(:name)
    end

    def collection
      ApiClient.ordered
    end

    def resource
      collection.find(params[:id])
    end
  end
end
