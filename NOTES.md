teams/index.html

<h1 class="display-3">Teams</h1>
  <% @teams.in_groups_of(3).each do |group| %>
    <div class="row">
        <% group.each do |item| %>
            <div class="col-sm mb-5">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="<%= item.img %>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%= item.city %> <%= item.name %></h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        <% end %>
    </div>
  <% end %>
