class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/task-lists" do
    task_lists = TaskList.all 
    task_lists.to_json(include: :tasks)
  end

  post "/task-lists" do
    task_list = TaskList.create(
      name: params[:name],
      important: params[:important],
      urgent: params[:urgent],
      complete: params[:complete]
    )
    task_list.to_json
  end

  post "/tasks" do
    task = Task.create(
      name: params[:name],
      important: params[:important],
      urgent: params[:urgent],
      complete: params[:complete],
      task_list_id: params[:task_list_id]
    )
    task.to_json
  end

  # post '/baked_goods' do
  #   baked_good = BakedGood.create(
  #     name: params[:name],
  #     price: params[:price],
  #     bakery_id: params[:bakery_id]
  #   )
  #   baked_good.to_json
  # end

  # patch '/bakeries/:id' do
  #   bakery = Bakery.find(params[:id])
  #   bakery.update(
  #     name: params[:name]
  #   )
  #   bakery.to_json
  # end

  # delete '/baked_goods/:id' do
  #   baked_good = BakedGood.find(params[:id])
  #   baked_good.destroy
  #   baked_good.to_json
  # end

end
