class MiscController < ApplicationController
  def homepage
    render({ :template => "misc_templates/home"})
  end


  def list_all_directors

    @dir_list = Director.all


    render({ :template => "layouts/directors"})

  end # Of method.

  def show_dir_details


  end # Of method.
  




end # Of class
