## Ruby Version 2.6.3

## People
### GET api/people
`
{"data":[
    ["Abrahamson","Donnell"],["Adamczewski","Erhard"],["Adao","Orin"],etc .....
    ]
 }
`
 
## Person

### GET api/person/{last_name}/{first_name}
`
{"data":
  {"id":"381",
  "first":"Phoebe",
  "last":"Brandon"}
}
`

### POST api/person/
Params: {first: "first", last: "last"}
`
{"data":
  {"id":"381",
  "first":"Phoebe",
  "last":"Brandon"}
}
`


