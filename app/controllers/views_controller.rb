class ViewsController < ApplicationController
  prepend_view_path ::Base::SRC_FOLDER
  layout false

  def index
    render_case ::Base::BASE_FILE
  end

  def show
    render_case params[:path]
  end

  protected

  def render_case path
    render template: path, formats: [:html]
  end
end
