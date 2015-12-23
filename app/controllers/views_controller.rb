class ViewsController < ApplicationController
  prepend_view_path 'src'
  layout false

  def index
    render_case "application"
  end

  def show
    render_case params[:path]
  end

  protected

  def render_case path
    Rails.logger.info "render haml path : #{path}"
    render template: path, formats: [:html]
  end
end
