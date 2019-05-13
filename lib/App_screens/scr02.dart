import "package:flutter/material.dart";
class NoteDetail extends StatefulWidget{
  String titletext;
  NoteDetail(this.titletext);           //constructor accepting the passed value and storing it in titletext
  @override
  State<StatefulWidget> createState() {
   
    return NoteDetailState(this.titletext);     //passing titletext to the class state
  }
}
class NoteDetailState extends State<NoteDetail>{
  String titletext;
  NoteDetailState(this.titletext);        //constructor accepting the passed value and storing it in titletext to use it as appbar title
  static var priority = ["high","low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(titletext),         //using the passed text(Add/Edit note) as title of appbar
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(                            //Drop down Button for priority
                items: priority.map((String dropdownlst){
                      return DropdownMenuItem<String>(
                        value: dropdownlst,
                       child: Text(dropdownlst,),
                      );
                }).toList(),
                style: textStyle,
                value: "low",
                onChanged: (val){
                  setState(() {
                  debugPrint("changed"); });
                },
            )),



            Padding(padding: EdgeInsets.all(15.0),
            child: TextField(                                 //Title textfield
              controller: titleController,
              style: textStyle,
              onChanged: (val){
                  setState(() {
                  debugPrint("changed"); });},
              decoration: InputDecoration(
                labelText: "title",
                labelStyle: textStyle,
                hintText: "name title", 
                border: OutlineInputBorder(               //creates a border with corner radius 5.0
                  borderRadius: BorderRadius.circular(5.0)   
                ) 
              ),
            ),
            ),



           Padding(padding: EdgeInsets.all(15.0),
            child: TextField(                             //Description Textfield
              controller: descController,
              style: textStyle,
              onChanged: (val){
                  setState(() {
                  debugPrint("changed"); });},
              decoration: InputDecoration(
                labelText: "description",
                labelStyle: textStyle,
                hintText: "give description", 
                border: OutlineInputBorder(               //creates a border with corner radius 5.0
                  borderRadius: BorderRadius.circular(5.0)   
                ) 
              ),
            ),
            ),
            

            Padding(padding: EdgeInsets.all(15.0),
            child: Row(children: <Widget>[                          
              Expanded(child: RaisedButton(                         //defining raised button and its properties
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text("save", textScaleFactor: 1.5,),
                onPressed: (){
                  setState(() {
                  debugPrint("pressed");
                                    });
                },
              ),),
              Container(width: 10.0,),
              Expanded(child: RaisedButton(                       //defining raised button and its properties
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text("Delete", textScaleFactor: 1.5,),
                onPressed: (){
                  setState(() {
                  debugPrint("pressed");
                                    });
                },
              ),)
            ],),)
          ],
        ),
      ),
    );
  }

}