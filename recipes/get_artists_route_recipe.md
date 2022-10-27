# GET  `/artists` Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method : GET
  * the path : `/artists`
  * any query parameters (passed in the URL) 
  * or body parameters (passed in the request body)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->
# Return list of artists with link for each artist to generate artist id page 



```
# Expected response (200 OK)


```html
<html>
  <body>
    <h1> ARTISTS </h1>
     <% @artists.each do |artist| %>
     <div>
      <a href= "/artists/<%=@artist.id%>"><%=@artist.name%></a>
      </div>
    </body>
  </html>

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /artists

# Expected response:

Response for 200 OK
```html
# Expected response (200 OK)

<html>
  <body>
    <h1> ARTISTS </h1>
     <% @artists.each do |artist| %>
     <div>
      <a href= "/artists/1>"><'Pixies'></a>
      </div>

      <div>
      <a href= "/artists/5>"><'Massive Attack'></a>
      </div>

    </body>
  </html>


```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /artists" do
    it 'returns list of artists and linking each artist to /artists/:id' do
      response = get('/artists')
  
      expect(response.status).to eq(200)
      expect(response.body).to eq(<a href= "/artists/1>"><'Pixies'></a>)
      expect(response.body).to eq(<a href= "/artists/4>"><'Nina Simone'></a>)
      expect(response.body).to eq(<a href= "/artists/7>"><'Wild nothing'></a>)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

