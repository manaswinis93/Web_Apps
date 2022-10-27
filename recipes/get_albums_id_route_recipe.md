# GET `/albums/:id` Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method : GET
  * the path  : `/albums/:id`
  * any query parameters (passed in the URL) : `:id`
  * or body parameters (passed in the request body)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Example for GET /albums/1 -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Surfer Rosa</h1>
    <p>
      Release year: 1988
      Artist: Pixies    
    </p>
  </body>
</html>
```

```html
<!-- Example for GET /albums/2 -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Waterloo</h1>
    <p>
      Release year: 1974
      Artist: ABBA
    </p>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /albums/1

# Expected response:

Response for 200 OK
```
      Surfer Rosa
      Release year: 1988
      Artist: Pixies   

```
# Request:

GET /albums/2

# Expected response:
Response for 200 OK

      Waterloo
      Release year: 1974
      Artist: ABBA


```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /albums/:id" do
    it 'returns album record for ID: 1' do
      response = get('/albums/1')
      expect(response.status).to eq(200)
      expect(response.body).to include('Surfer Rosa')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end

    it 'returns album record for ID: 1' do
      response = get('/albums/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('Waterloo')
      expect(response.body).to include('Release year: 1974')
      expect(response.body).to include('Artist: ABBA')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

