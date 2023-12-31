<div class="container p-3">
  <div class="row">
    <div class="col-md-12">
    <h3>注文確認</h3>

      <table class="table table-secondary table-bordered order_confirm_table">
        <thead class="table-active">
          <tr>
            <th>商品名</th>
            <th>単価(税込)</th>
            <th>数量</th>
            <th>小計</th>
          </tr>
        </thead>
          <% @cart_items.each do |cart_item| %>
        <tbody>
            <tr>
              <td>
                <%= image_tag cart_item.item.image, size:"10×10" %>
                <%= cart_item.item.name %>
              </td>
              <td><%= cart_item.item.add_tax_cost.to_s(:delimited) %></td>
              <td><%= cart_item.amount %></td>
              <td><%= (cart_item.item.add_tax_cost * cart_item.amount).to_s(:delimited) %></td>
            </tr>
          <% end %>
        </tbody>
      </table>

    <div class="d-flex">
      
      <div class="infomation">
        <tr><th>支払い方法</th><td><%= @order.payment_method_i18n %></td></tr>
        <tr><th>お届け先</th><td>〒<%= @selected_address %></td></tr>
      </div>
      

    	<div>
      <%= form_with model: @order, url: orders_path, method: :post do |f| %>
        <%= f.hidden_field :post_code, :value => @order.post_code %>
        <%= f.hidden_field :address, :value => @order.address %>
        <%= f.hidden_field :name, :value => @order.name %>
        <%= f.hidden_field :total_payment, :value => @total %>
        <%= f.hidden_field :shipping_cost, :value => @postage %>
        <%= f.hidden_field :payment_method, :value => @order.payment_method %>
        <div class="text-center mb-3">
          <%= f.submit "注文を確定する", class: "btn btn-success" %>
        </div>
      <% end %>
    </div>


      <table class="table table-secondary table-bordered w-25 offset-4 order_confirm_table">
        <tr>
          <th class="table-active w-50">送料</th>
          <td><%= @postage %></td>
        </tr>
        <tr>
          <th class="table-active">商品合計</th>
          <td><%= @sub_total.to_s(:delimited) %></td>
        </tr>
        <tr>
          <th class="table-active">請求額</th>
          <td><%= @total.to_s(:delimited) %></td>
        </tr>
      </table>
  </div>
</div>