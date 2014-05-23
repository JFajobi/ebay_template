class TemplateController < ApplicationController
  def index
    @templates = Template.all
  end

  def show
    render "master_templates/#{params["template_name"]}"
  end

end