class Inscription {
  Inscription(
      {required this.ContractId,
      required this.DateEnd,
      required this.categorie,
      required this.contractdate});

  int ContractId;
  DateTime DateEnd;
  String categorie;
  DateTime contractdate;

   int lastdays   (){
    Duration remainingTime = DateEnd.difference(DateTime.now());
    print(remainingTime.inDays);
    int daysRemaining = remainingTime.inDays;
     return daysRemaining;
    
    
   }
}
