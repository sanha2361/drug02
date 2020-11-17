class Order {

  String drugtype;
  String drugname;
  
  Order({this.drugtype,this.drugname});
  static List<Order> getOrders() {
    return <Order>[
      Order(drugtype: "diuretics", drugname: "lasix"),
      Order(drugtype: "antibiotics", drugname: "penicillin"),
      
    ];
  }
  
}

