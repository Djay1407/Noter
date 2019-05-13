import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SIMPLE INTREST CALCULATOR",
      home: curcalc(),
    )
  );
}

class curcalc extends StatefulWidget
{ 
  @override
  State<StatefulWidget> createState() {
    
    return curcalcstate();
  }

}

class curcalcstate extends State<curcalc>
{ var _currency = ["Rupees","Dollar","Yen","Ringett","Pounds"];
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
     // resizeToAvoidBottomPadding: false,                            //removes pixel overflown warning
      appBar: AppBar(
        title: Text("Simple Intrest Calculator v-1.0"),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(                                  //column was replaced by list to allow scrolling
          children: <Widget>[
            imgImage(),
            Padding(padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: TextField(                                    //Text field ....VVV.IMPORTANT
              keyboardType: TextInputType.number,         //Changes the keyboard to numeric type
              decoration: InputDecoration(
                labelText: "Enter Amount",
                hintText: "eg. 2000",
                //counterText: "counter",
                //suffixText: "suffix",
                //prefixText: "prefix",
                border: OutlineInputBorder(               //creates a border with corner radius 5.0
                  borderRadius: BorderRadius.circular(5.0)
                )
              )
            ),),
            Padding(
              padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: TextField(                                    //Text field ....VVV.IMPORTANT
              keyboardType: TextInputType.number,         //Changes the keyboard to numeric type
              decoration: InputDecoration(
                labelText: "Enter Rate",
                hintText: "In percent",
                //counterText: "counter",
                //suffixText: "suffix",
                //prefixText: "prefix",
                border: OutlineInputBorder(               //creates a border with corner radius 5.0
                  borderRadius: BorderRadius.circular(5.0)
                )
              )
            ),),
            
            Row(
              children: <Widget>[
                Expanded( child:
                Padding(
                padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                child: TextField(                                    
                 keyboardType: TextInputType.number,         
                  decoration: InputDecoration(
                    labelText: "Term",
                   hintText: "In years",
                   //counterText: "counter",
                   //suffixText: "suffix",
                   //prefixText: "prefix",
                   border: OutlineInputBorder(               
                     borderRadius: BorderRadius.circular(5.0)
                    )
                  )
                ),),
                ),

                Container(width: 25.0,),                              //to add space between the 2 widgets

                Expanded(
                  child: 
                  DropdownButton<String>(                                     //Drop Down Button
                   items: _currency.map((String dropdownlst){
                      return DropdownMenuItem<String>(
                        value: dropdownlst,
                       child: Text(dropdownlst, style: TextStyle(fontStyle: FontStyle.italic)),
                      );
                   }).toList(),
                   value: _currency[0],
                   onChanged: (String newval){
                       setState(() {
                         // value: newval,
                       });
                    }, 
                  ),
                )
              ],
            ),
            Padding( padding: EdgeInsets.all(5.0),
              child:Row(children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("calculate"),
                    onPressed: (){
                      //action
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("reset"),
                    onPressed: (){
                      //action
                    },
                  ),
                )
              ],) ,),
            Padding( padding: EdgeInsets.all(10.0),
              child: Text('ANSWER'),)  
          ],
        ),
      ),
      
    );
  }
  Widget imgImage()
  {
    AssetImage assetImage = AssetImage("images/img2.png");
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);
    return Container(child: image,margin: EdgeInsets.all(50.0),);
  }
}
