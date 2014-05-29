class DashboardsController < ApplicationController

  def show
    @markdown = get_markdown_renderer
    render 'dashboards/dashboard'
  end
end