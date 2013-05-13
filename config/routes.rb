Exams::Application.routes.draw do
  resources :subcategories


  resources :client_needs


  resources :objectives


  resources :report_question_answers


  resources :report_questions


  resources :create_report_questions


  resources :exam_reports


  resources :reports do
    collection do
      get 'examlist'
      get 'mygrade'
    end
    member do
      get 'run'
      get 'mygrade'
      get 'allgrades'
    end
  end


  resources :question_levels


  resources :exam_levels


  resources :user_courses

  resources :exam_users

  resources :user_submits

  resources :exam_content_areas

  resources :question_content_areas

  resources :content_areas

  resources :levels

  resources :departments

  resources :exam_categories

  resources :user_answers

  resources :question_courses

  resources :exam_courses

  resources :courses

  resources :question_categories

  resources :question_answers

  resources :exam_questions

  resources :answers

  resources :categories

  resources :questions

  resources :exams

  devise_for :users
  #match ':exams(/:take(/:id))'
  get "/exams/:id/take", :to => 'exams#take', :as => :take_exam
  #match ':exams(/:grade(/:id))'
  get "/exams/:id/mygrade", :to => 'exams#mygrade', :as => :mygrade_exam
  get "/exams/:id/enable_retake", :to => 'exams#enable_retake', :as => :enable_retake_exam
  get "/exams/:id/enable", :to => 'questions#enable', :as => :enable_question
  get "/exams/:id/availability", :to => 'exams#availability', :as => :availability_exam
  get "/exams/:id/show_results", :to => 'exams#show_results', :as => :show_results_exam
  get "/exams/:id/allgrades", :to => 'exams#allgrades', :as => :allgrades_exam
  get "/user_submits/:id/display", :to => 'user_submits#display', :as => :display_user_submits
#  get "/examlist", :to => 'reports#examlist', :as => :examlist_reports



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  root :to => "home#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
