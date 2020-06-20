class Data{
   String intro = '';
   String bording = '';
   List<String> pool = [];
   List<String> excursion = [];
   List<String> dining = [];
   List<String> casino = [];
   List<String> various = [];

   void setIntro({String url}){
     intro = url;
   }
   void setBoarding({String url}){
     bording = url;
   }
   void setPool({String url}){
     pool.add(url);
   }
   void setExc({String url}){
     excursion.add(url);
   }
   void setDining({String url}){
     dining.add(url);
   }
   void setCasino({String url}){
     casino.add(url);
   }
   void setVarious({String url}){
     various.add(url);
   }
}