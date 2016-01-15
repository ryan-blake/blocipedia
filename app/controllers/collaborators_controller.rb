class CollaboratorsController < ApplicationController


  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:collaborator][:user_attributes][:email])
    @collaborator = Collaborator.new(user: @user, wiki: @wiki)
    @collaborators = @wiki.collaborators

    if @user

      if @collaborator.save

        flash[:notice] = "collaborator was saved."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:error] = "There was an error saving the collaborator. Please try again."
        render "wikis/edit"
      end
    else
      flash[:error] = "User not found to add as collaborator"
      render "wikis/edit"
    end

  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      # #38
      redirect_to root_url
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end


  private

  def collaborator_params
    params.require(:collaborator).permit(:email, :id)
  end

  def index
    @collaborators = policy_scope(Wiki)
  end
end
