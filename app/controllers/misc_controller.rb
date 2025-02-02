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

def list_all_films

  @film_list = Movie.all
  
  render({ :template => "layouts/films"})

end # Of method.

#--------------------------------------------

  def show_film_details

    @film_num = params[:film_id]

    film_details = Movie.where({ :id => @film_num }).first

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

  def list_all_actors

    @actor_list = Actor.all

    render({ :template => "layouts/actors"})

  end

#--------------------------------------------

  def show_actor_details

    @actor_num = params[:actor_id]

    actor_details = Actor.where({ :id => @actor_num }).first

    # Actor info

    @actor_name = actor_details.name

    @actor_dob = actor_details.dob

    @actor_bio = actor_details.bio

    @actor_image = actor_details.image

    @actor_info_created_at = actor_details.created_at

    @actor_info_updated_at = actor_details.updated_at

    # Character info

    @movies_acted_in = Character.where({ :actor_id => @actor_num }).all


    render({ :template => "layouts/actor_info"})

  end # Of method.

#--------------------------------------------

  def show_youngest_director

    youngest_director = Director.where.not({ :dob => nil }).all.order(:dob => :asc).last

    @director_name = youngest_director.name

    @director_id = youngest_director.id

    @dob_string = youngest_director.dob.strftime('%B %d, %Y')

    render({ :template => "layouts/youngest"})    

  end # Of method.

#--------------------------------------------

  def show_eldest_director

    eldest_director = Director.where.not({ :dob => nil }).all.order(:dob => :asc).first

    @director_name = eldest_director.name

    @director_id = eldest_director.id

    @dob_string = eldest_director.dob.strftime('%B %d, %Y')

    render({ :template => "layouts/eldest"})    

  end # Of method.

#--------------------------------------------


end # Of class
