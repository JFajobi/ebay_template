class TemplateService

  class << self
    def construct_listing_page(html_content, template_name)
      # open a file and print the html_content to it 
      css = File.read Rails.root.join("app", "assets", "stylesheets", "#{template_name}_template.css").to_s
      
      File.open(Rails.root.join("tmp", "#{template_name}.html").to_s, 'w') do |file|
        file.write(html_content)
        file.write("<style type='text/css'>#{css}</style>")
      end


      # write a <style type="text/css"> tag
      # copy css and paste below style tag
      # close out style tag </style>

    end

    def inline_css_styles(html_filepath, template_name)
      # create inline style
      # rm file

      markup = File.read html_filepath
      html = InlineStyle.process(markup)
      File.delete Rails.root.join("tmp", "#{template_name}.html").to_s
      html

    end
  end

end