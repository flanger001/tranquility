class Admin::BaseController < ApplicationController
  before_action :require_user

  def index
  end

  def show
  end

  def new
    @resource = resource_class.new
  end

  def edit
  end

  def create
    @resource = resource_class.new(resource_params)

    if resource.save
      redirect_to [:admin, resource], notice: "#{resource.class.to_s.titleize} was successfully created."
    else
      render :new
    end
  end

  def update
    if resource.update(resource_params)
      redirect_to [:admin, resource], notice: "#{resource.class.to_s.titleize} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to polymorphic_path([:admin, resource_class]), notice: "#{resource.class.to_s.titleize} was successfully destroyed."
  end

  def active
    resource_class.update(params["#{resource_class.to_s.downcase.pluralize.to_sym}"].keys,
                          params["#{resource_class.to_s.downcase.pluralize.to_sym}"].values)
    redirect_to polymorphic_path([:admin, resource_class]), notice: "#{resource_class.to_s.pluralize.titleize} updated."
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

  helper_method :resource, :collection, :resource_class
end
