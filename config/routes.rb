Rails.application.routes.draw do
  # 커밋용 주석
  match ":controller(/:action(/:id))", :via => [:post, :get]
end
