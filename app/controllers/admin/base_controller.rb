module Admin
  class BaseController < ApplicationController
    before_action :require_user

    def index; end

    def show; end

    def new
      @resource = resource_class.new
    end

    def edit; end

    def create
      @resource = resource_class.new(resource_params)

      if resource.save
        redirect_to [:admin, resource], notice: "#{capital_resource_class} was successfully created."
      else
        render :new
      end
    end

    def update
      if resource.update(resource_params)
        redirect_to [:admin, resource], notice: "#{capital_resource_class} was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      resource.destroy
      redirect_to [:admin, resource_class], notice: "#{capital_resource_class} was successfully destroyed."
    end

    def active
      resource_class.update(params[symbolized_resource_class.to_s].keys, params[symbolized_resource_class.to_s].values)
      redirect_to [:admin, resource_class], notice: "#{resource_class.to_s.pluralize.titleize} updated."
    end

    def move_up
      resource.move_higher
      redirect_to [:admin, resource_class], notice: "#{capital_resource_class} moved up."
    end

    def move_down
      resource.move_lower
      redirect_to [:admin, resource_class], notice: "#{capital_resource_class} moved down."
    end

    def move_to_top
      resource.move_to_top
      redirect_to [:admin, resource_class], notice: "#{capital_resource_class} moved to top."
    end

    def move_to_bottom
      resource.move_to_bottom
      redirect_to [:admin, resource_class], notice: "#{capital_resource_class} moved to bottom."
    end

    private

    def resource
      @resource ||= resource_class.find(params[:id])
    end

    def collection
      @collection ||= resource_class.order(:id)
    end

    def resource_class
      raise 'Add a `resource_class` method to your controller'
      # self.class.to_s.gsub(/Admin::(.*?)Controller/, '\1').singularize.constantize
    end

    def capital_resource_class
      resource_class.to_s.titleize
    end

    def symbolized_resource_class
      resource_class.to_s.downcase.pluralize.to_sym
    end

    helper_method :resource, :collection, :resource_class
  end
end
