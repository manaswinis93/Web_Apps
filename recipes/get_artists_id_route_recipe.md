# GET '/artits/:id' Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method : GET 
  * the path : `/artists/:id`
  * any query parameters (passed in the URL) : `:id`
  * or body parameters (passed in the request body)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1><%=@artist.name%></h1>
    <div>
        GENRE: <%=@artist.genre%>
    </div>
  </body>
</html>
```

```html

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /artists/1


# Expected response:

Response for 200 OK
```
<html>
  <head></head>
  <body>
    <h1>Pixies</h1>
    <div>
        GENRE: Rock
    </div>
  </body>
</html>
```
# Request:

GET /artists/4

# Expected response:
Response for 200 OK

<html>
  <head></head>
  <body>
    <h1>Nina Simone</h1>
    <div>
        GENRE: Pop
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

  context "GET /artists/:id" do
    it 'return artist info for that artist ID' do
      response = get('/artists/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('Pixies')
      expect(response.body).to include('GENRE: Rock')
    end

    it 'return artist info for that artist ID' do
      response = get('/artists/4')

      expect(response.status).to eq(200)
      expect(response.body).to include('Nina Simone')
      expect(response.body).to include('GENRE: Pop')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

