Our Problem
===========

spent lots of time trying to figure out how to do common use case of Salesforce SQL query with where statement
--------------------------------------------------------------------------------------------------------------

What could have fixed it
========================

More real-world examples of common sql queries
----------------------------------------------

### This would have helped demonstrate for instance that identifiers after the where must be single quoted

### and if there are any other gotchas we don't know about, it would have covered the most common you need to know

real-world SOQL examples
========================

simplest query from the docs
----------------------------

``` {.bash .rundoc-block rundoc-language="sh" rundoc-exports="both"}
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account" -H "Authorization: Bearer token"
```

limiting that query
-------------------

``` {.bash .rundoc-block rundoc-language="sh" rundoc-exports="both"}
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+LIMIT+10" -H "Authorization: Bearer token"
```

adding a where constraint
-------------------------

``` {.bash .rundoc-block rundoc-language="sh" rundoc-exports="both"}
curl "https://yourInstance.salesforce.com/services/data/v20.0/query/?q=SELECT+name+from+Account+WHERE+id='ACCOUNT_ID'" -H "Authorization: Bearer token"
```

terminology that threw us off
=============================

instance
--------

account
-------

Why do all the fields have `__c`?
---------------------------------

misc
====

How to get your instance?
-------------------------

difference between testing environment instance and your production instance
----------------------------------------------------------------------------

pay attention to version differences
------------------------------------

how to find the version of api your salesforce instance can use
---------------------------------------------------------------

### I think all salesforce instances can use newest and versioning is only for client code you write sticking to the api contract

### so maybe nothing more to say here
