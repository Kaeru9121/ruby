Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#abount"
end
