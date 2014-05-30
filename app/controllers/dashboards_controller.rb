class DashboardsController < ApplicationController
  before_action :check_log_in
  def show
    @markdown = get_markdown_renderer
    render 'dashboards/dashboard'
  end
end