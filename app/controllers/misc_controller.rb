class MiscController < ApplicationController

  def homepage
    render({ :template => "misc_templates/home"})
  end

#--------------------------------------------

  def list_all_directors

    @dir_list = Director.all


    render({ :template => "layouts/directors"})

  end # Of method.

#--------------------------------------------

  def show_dir_details

    @director_num = params[:director_id]

    @dir_details = Director.where({ :id => @director_num }).first

    @movies_directed = Movie.where({ :director_id => @director_num }).all

    render({ :template => "layouts/director_info"})

  end # Of method.

#--------------------------------------------

  def show_film_details

    @film_num = params[:film_id]

    film_details = Movie.where({ :id => @film_num }).first

    #puts "TEST ->> #{film_details.title}"

    dir_id = film_details.director_id

    #Director info :
    dir_info = Director.where({ :id => dir_id }).first

    @dir_name = dir_info.name

    #Film info
    @film_name = film_details.title

    @film_year = film_details.year

    @film_duration = film_details.duration

    @film_description = film_details.description

    @film_image = film_details.image

    @film_created_at = film_details.created_at
    
    @film_updated_at = film_details.updated_at

    render({ :template => "layouts/film_info"})


  end

#--------------------------------------------


end # Of class
