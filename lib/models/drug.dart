class Drug {

  final String system;
  final String disease;
  final String drugtype;
  final String drugname;
  
  Drug({this.system,this.disease,this.drugtype,this.drugname});
  
}

/*List druglist=[
    {
      "system":"circ",
      "disease":[
        {"dsname":"hypertension",
         "drugtype":["diuretics","blocker"]
        },
        {"dsname":"MI",
         "drugtype":["diuretics","blocker"]
        }
      ]
    },
    {
      "system":"resp",
      "disease":[
        {"dsname":"pneumonia",
         "drugtype":["antibiotics"]
        }
      ]
    }
  ];*/