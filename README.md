#firebasic

Will turn input.json (intended to be exported from Firebase) into a series of folders with the appropriately named individual json blobs.

Generates a nested series of folders that can be served statically, API-compatibly with Firebase.

Think of it as Jekyll for your JSON.

##example

Will turn this json:

```javascript
{
  "a": {
    "1": "1",
    "2": "2"
  },
  "b": {
    "1": "1",
    "2": "2",
    "3": "3"
  },
  "c": {
    "1": {
      "aa": "aa"
    }
  }
}
```

into this filesystem structure
```
├── a
│   ├── 1.json
│   └── 2.json
├── a.json
├── b
│   ├── 1.json
│   ├── 2.json
│   └── 3.json
├── b.json
├── c
│   ├── 1
│   │   └── aa.json
│   └── 1.json
└── c.json
```

When this folder is served statically (e.g. from S3,) it responds to basic GET requests API-compatibly with Firebase.

Useful when you want to remove a Firebase dependency in cases where you only want to use it as a read-only JSON server.


##usage

`bundle install`

`ruby firebasic.rb input-file.json output-directory`