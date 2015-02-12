Rails.application.routes.draw do
  get 'pay_slip/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  get '/' => redirect('/admin')
end

