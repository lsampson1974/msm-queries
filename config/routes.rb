Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors", { :controller => "misc", :action => "list_all_directors" })

  get("/directors/:director_id", { :controller => "misc", :action => "show_dir_details" })
end
