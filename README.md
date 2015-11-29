# linkedin-scrapper
Scrapper of linkedin public profiles

```
  $ npm install linkedin-profile
```

```
  var callback = function(obj) {
    console.log(obj.result, obj.$, obj.response);
    // obj.result -> json filled with linkedin data
    // obj.$ -> cheerio object you can use as jQuery
    // obj.response -> request's response object
  }

  var scrapper = require('linkedin-scrapper');
  scrapper('http://public.profile.url', callback, additionalMapping={})
```

Can be extended with additionalMapping parameter which merges with mapping.coffee:

```
addditionalMapping = {
  sections: {
    your-section-name: {
      mapping: {
        field: '.additional > #selector'
      }
    }
  }
  defaultSectionMapping: {
    field: '.additional default > #selector'
  }
}
```

**LinkedIn markup may change. So launch** ```npm test``` **first**
