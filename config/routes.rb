Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors", { :controller => "misc", :action => "list_all_directors" })

  get("directors/youngest", { :controller => "misc", :action => "show_youngest_director" })

  get("directors/eldest", { :controller => "misc", :action => "show_eldest_director" })


  get("/directors/:director_id", { :controller => "misc", :action => "show_dir_details" })

  get("/movies/", { :controller => "misc", :action => "list_all_films" })

  get("/movies/:film_id", { :controller => "misc", :action => "show_film_details" })

  get("/actors/", { :controller => "misc", :action => "list_all_actors" })

  get("/actors/:actor_id", { :controller => "misc", :action => "show_actor_details" })

end
