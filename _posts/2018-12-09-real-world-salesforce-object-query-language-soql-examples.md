Real-world Salesforce Object Query Language (SOQL) examples
===========
by Cody Goodman (@codygman)

Have you ever spent more time than you wanted trying to figure out what you think should be a very simple problem? While [pairing](TODO) another developer and I experienced this problem, and thought it would be helpful to share the results of our problem solving to save others time.

The simple select statement with a `WHERE` in a url query param being pretty simple in the end:

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'" -H "Authorization: Bearer token"
```

Note that the value must be quoted, that quotes are valid in urls, and you do not need to escape them. Any knowledge of SQL combined with browsing the [SOQL docs](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql.htm) would confirm that the SOQL query is:

```
SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'
```

Looking at the [Condition Expression Syntax documentation](TODO) you'll see more examples which are all very helpful, but they leave the question of integration as an exercise to the reader, even the [Execute an SOQL query using curl docs](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_query.htm) only has the simplest example. The problem is that the docs assumed constructing the SOQL query--and any transforming needed to use it in a query parameter--was trivial and not worth covering. In our case a simple example of using SOQL with curl like we posted above would have drastically improved our user experience with the Salesforce API and would have saved us literally hours.


Various other SOQL examples we wrote
===========

## Simplest curl SOQL query

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account" -H "Authorization: Bearer token"
```
## Simplest curl SOQL query + limit
-------------------

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+LIMIT+10" -H "Authorization: Bearer token"
```


## Simplest curl SOQL query + where
-------------------------

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'" -H "Authorization: Bearer token"
```

Hopefully these examples saved you some time and encouraged you to think from the perspective of your api consumer when writing api documentation.
