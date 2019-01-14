Real-world Salesforce Object Query Language (SOQL) examples
===========
by Cody Goodman (@codygman)

Have you ever spent more time than you wanted trying to figure out what you think should be a very simple problem? While [pairing](https://engineering.itpro.tv/2018/10/24/how-we-work-pair-programming/) with another developer ITProTV we experienced exactly that.

The rest of this post is a few short snippets of Salesforce Object Query Language that would have made our issues trivial and commentary where necessary.

The simple select statement with a `WHERE` in a url query param being pretty simple in the end:

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'" -H "Authorization: Bearer token"
```

Note that the value must be quoted, that quotes are valid in urls, and you do not need to escape them. Any knowledge of SQL combined with browsing the [SOQL docs](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql.htm) would confirm that the SOQL query is:

```
SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'
```

Looking at the [Condition Expression Syntax documentation](https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql_select_conditionexpression.htm) you'll see more examples which are all very helpful, but they leave the question of integration as an exercise to the reader, even the [Execute an SOQL query using curl docs](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_query.htm) only has the simplest example. The problem is that the docs assumed constructing the SOQL query--and any transforming needed to use it in a query parameter--was trivial and not worth covering. In our case a simple example of using SOQL with curl like we posted above would have drastically improved our user experience with the Salesforce API and would have saved us literally hours.


Miscellaneous SOQL examples we wrote
===========

### Simplest curl SOQL query

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account" -H "Authorization: Bearer token"
```
### Simplest curl SOQL query + limit
-------------------

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+LIMIT+10" -H "Authorization: Bearer token"
```


### Simplest curl SOQL query + where
-------------------------

```
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'" -H "Authorization: Bearer token"
```

Hopefully these examples both saved you some time and encouraged you to be more empathetic to the use-cases of your api consumer when writing api documentation in the future.
