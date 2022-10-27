# GET `/albums` Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method : GET
  * the path : /albums
  * any query parameters (passed in the URL) : none
  * or body parameters (passed in the request body) : none

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<!-- GET /albums -->

<html>
  <head></head>
  <body>
    <h1>Albums</h1>

    <div>
      Title: Doolittle
      Released: 1989
    </div>

    <div>
      Title: Surfer Rosa
      Released: 1988
    </div>

    <!-- so on and list of albums -->
  </body>
</html>
```


## 3. Write Examples

_Replace these with your own design._
# Request:

GET /albums

# Expected response:

Response for 200 OK
```
     Albums

Title: Doolittle
      Released: 1989

Title: Surfer Rosa
      Released: 1988
#and similarly for all the albums
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /albums" do
    it 'returns list of albums' do
      response = get('/albums')
      expect(response.status).to eq(200)
      expect(response.body).to include('Title: Lover')
      expect(response.body).to include('Released: 2022')
      expect(response.body).to include('Title: Baltimore')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
