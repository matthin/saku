class Api::StoryController < ApplicationController
  def create
    story = Story.create(story_params)

    respond_to do |format|
      if story.save
        format.json {render(json: story, status: 201)}
      else
        format.json {render(json: story, status: 400)}
      end
    end
  end

  def index
    respond_to do |format|
      format.json {render(json: Story.all)}
    end
  end

private
  def story_params
    params.require(:story).permit(
      :title, :description
    )
  end
end
