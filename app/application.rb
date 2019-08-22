require 'pry'

class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    price = 0
    item = req.path.split("/items/").last
    if req.path=="/items/" + item
      Item.all.each do |line|
        if item == line.name
          price = line.price
         
        end
      end
      if price == 0 
        resp.write  "Item not found"
        resp.status = 400
      else
         resp.write price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end