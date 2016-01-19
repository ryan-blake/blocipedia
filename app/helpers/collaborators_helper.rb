module CollaboratorsHelper
  def user_is_authorized_for_collaborators?
      current_user.premium? || current_user.admin?

      # <!-- <div class="row">
      #   <div class="col-md-8">
      #    <% if user_is_authorized_for_collaborators? %>
      #    <div class="col-md-4">
      #    <%= link_to "show Wiki collab", wiki_collaborator_path, class: 'btn btn-success' %>
      #    </div>
      #    <% end %>
      #   </div>
      # </div> -->


  end

end
