class TemplateController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    render "master_templates/#{params["template_name"]}"
  end

  def create_listing
    cookies[:website_markup] = params["content"]["primary"]["value"]
    cookies[:template_name]  = params["template_name"]
    
    
    # Once rendered user is redirected to "/completed_page"
    # redirection is handled in the mercury.js file
    render :text => '{}'
  end

  def scrape_page
    page_html_content = cookies[:website_markup].html_safe
    template_name     = cookies[:template_name]
    html_filepath     = Rails.root.join("tmp","#{template_name}.html").to_s

    TemplateService.construct_listing_page(page_html_content, template_name)
    @html = TemplateService.inline_css_styles(html_filepath, template_name)

    cookies[:website_markup] = @html

    
    @listing = current_user.listings.new if current_user
    

    render "template/scrape_page"
  end

end