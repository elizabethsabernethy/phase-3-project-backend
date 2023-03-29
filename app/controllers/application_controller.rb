class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/task-lists" do
    taskLists = TaskList.all 
    taskLists.to_json(include: :tasks)
  end

end
