== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

## Development ##
* Start a Solr instance on port 8982:
`bundle exec rake sunspot:solr:start`

## Tests ##
### Running tests ###
* Start a Solr instance on port 8981:
`bundle exec sunspot-solr run -p 8981`

* Run the tests:
`bundle exec rake spec`

* If desired, stop the Solr instance:
`bundle exec sunspot-solr stop`

## SOLR ##

#### Reindexing Objects ####

Objects are automatically indexed to Solr as a part of the save callbacks.

There are a number of ways to index manually within Ruby:

* On a class itself
`Product.reindex
Sunspot.commit`

* On mixed objects
`Sunspot.index [product1, ncm2]
Sunspot.index product3
Sunspot.commit`

* With autocommit
```
Sunspot.index! [product1, product2, ncm3]
```

If you make a change to the object's "schema" (code in the searchable block), you must reindex all objects so the changes are reflected in Solr:
```
bundle exec rake sunspot:solr:reindex
```

or, to be specific to a certain model with a certain batch size:
`bundle exec rake sunspot:solr:reindex[500,Post]` some shells will require escaping [ with \[ and ] with \]

to skip the prompt asking you if you want to proceed with the reindexing:
`bundle exec rake sunspot:solr:reindex[,,true]` some shells will require escaping [ with \[ and ] with \]

## Resque ##
`bundle exec bin/resque work -c ./.resque`
