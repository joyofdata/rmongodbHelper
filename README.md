rmongodbHelper
==============

The recommended package for using MongoDB with R is "rmongodb". Sadly there is bug in this package preventing an easy construction of BSONs containing arrays from lists or JSON-objects. The suggested method for bypassing this issue is building up a mongo.bson.buffer from scratch. That's kind of cumbersome. For that purpose I composed this small package to allow easy generation of BSONs from JSON or a list().

To give you an example - let's assume we would like to create a BSON for searching documents who feature a key "a" either holding value 1 or 2: {$or: [{a=1},{a=3}]}

The sequence of mongo.bson.buffer statements would be this:

```
buf <- mongo.bson.buffer.create()

# "$or":[ ...
mongo.bson.buffer.start.array(buf, "$or")

# dummy name "0" for object in array
# "0": { ...
mongo.bson.buffer.start.object(buf, "0")
# "a":1
mongo.bson.buffer.append.int(buf, "a", 1)
# ... }
mongo.bson.buffer.finish.object(buf)

mongo.bson.buffer.start.object(buf, "1")
mongo.bson.buffer.append.int(buf, "a", 3)
mongo.bson.buffer.finish.object(buf)

# ...]
mongo.bson.buffer.finish.object(buf)

q <- mongo.bson.from.buffer(buf)
```

Using the function rmongodbHelper::json_to_bson():

```
json_to_bson('{
  "$or": [
    {"a":1},
    {"a":3}
  ]
}')
```

For detailed information on how to use this package please have a look at the following answers on stackoverflow.com:

- http://stackoverflow.com/a/25239583/562440
- http://stackoverflow.com/a/25473782/562440
- http://stackoverflow.com/a/25473070/562440
