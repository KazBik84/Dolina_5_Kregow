crumb :root do
  link "Strona Główna", root_path
end
# ------------------ parent root ---------------------------
crumb :user_index do
  link "Index userów", users_path
  parent :root
end

crumb :web_scrolls do
  link "Zwoje z sieci", web_scrolls_path
  paren :root
end

crumb :sign_in do
  link "Zaloguj się", new_user_session_path
  parent :root
end

crumb :sign_up do
  link "Zarejestruj się", new_user_registration_path
  parent :root
end

crumb :show_user do
  link "Twój dział", current_user
  parent :root
end

crumb :contact do
  link "Kontakt", contact_path
  parent :root
end

crumb :l5k_osw_pass do
  link "Brama do grania w Oświęcimiu w l5k", osw_path
  parent :root
end

crumb :add_announcement do
  link "Dodaj post", new_announcement_path
  parent :root
end

crumb :announcement do |announcement|
  link announcement.title, announcement_path(announcement)
  parent :root
end

crumb :edit_announcement do |announcement|
  link "Edycja: #{announcement.title}", edit_announcement_path(announcement)
  parent :root
end

crumb :legendopedia do
  link "Legendopedia", legendopedia_path
  parent :root
end

# ---------------------- parent :legendopedia ------------------------

crumb :legendopedia_schools do
  link "Szkoły", schools_path
  parent :legendopedia
end

crumb :legendopedia_show_schools do
  link "Wybrane szkoły"
  parent :legendopedia_schools
end

crumb :legendopedia_spells do
  link "Czary", spells_path
  parent :legendopedia
end

crumb :legendopedia_spells_show do
  link "Wybrane czary"
  parent :legendopedia_spells
end

crumb :legendopedia_traits do
  link "Zalety i Wady", traits_path
  parent :legendopedia
end

crumb :legendopedia_traits_show do
  link "Wybrane zalety i wady"
  parent :legendopedia_traits
end

crumb :legendopedia_clans do
  link "Klany", clans_path
  parent :legendopedia
end

crumb :legendopedia_clans_show do
  link "Wybrany klan"
  parent :legendopedia_clans
end

crumb :legendopedia_skills do
  link "Umiejętności", skills_path
  parent :legendopedia
end

crumb :legendopedia_skills_show do
  link "Wybrane Umiejętności"
  parent :legendopedia_skills
end

# ---------------------- parent :show_user ---------------------------

crumb :new_character do
  link "Nowa postać", new_user_character_path
  parent :show_user
end

crumb :edit_character do |character|
  link "Edytuj: #{character.family} #{character.name}", edit_user_character_path(character, current_user)
  parent :show_user
end

crumb :show_character do |character|
  link "#{character.family} #{character.name}", user_character_path
  parent :show_user  
end

# ---------------------- parent :l5k_osw_pass ------------------------
crumb :l5k_osw_show do
  link "Czat oświęcimski", osw_show_path
  parent :l5k_osw_pass
end








# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).