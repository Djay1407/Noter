import "package:flutter/material.dart";
import 'scr02.dart';
class NoteList extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    
    return NoteListstate();
  }

}
class NoteListstate extends State<NoteList> with SingleTickerProviderStateMixin //with singletickerproviderstatemixin for animation while using tabbar 
{
  int count = 0;
  TabController controller;        //controller for controling the tabs
  @override                                     //** necessary for implementing tab view
  void initState(){                             //** necessary for implementing tab view
    super.initState();
    controller = TabController(vsync: this,length: 2);   //length is no of tabs
  }
  @override
  void dispose(){                           //** necessary for implementing tab view
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:CustomScrollView(                    //for implementing scrollable appbar
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,          
            floating: false,            
            pinned: true,
            snap: false,
            title:  Text("NOTER V-1.0"),
           /* flexibleSpace: FlexibleSpaceBar(        //title moves with the appbar
              title: Text("NOTER V-1.0"),
              background: Image.asset(name),     
              
            ),*/
            bottom: TabBar(               //implementing or designing tabbar in the bottom of the appbar
              controller: controller,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.list),),
                Tab(icon: Icon(Icons.grid_on),)
               ],
            ),
          ),
          
         SliverFillRemaining(              //fill the rest part of the sliver or scrollable area
            child: TabBarView(              //to view the content in the respective tabs
              controller: controller,
              children: <Widget>[
                getListview(),             //function to call the list view
                getListview(),             //function to call the list view
              ],
            ) 
          )   
        ],

      ),

      bottomNavigationBar: BottomAppBar(         //bottom appbar
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(                                           //icon button
              icon: Icon(Icons.filter_list,color: Colors.white,),
              onPressed: (){
                filterdialog(context);
              },
            )
          ],
        ),
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,  //placing the button on the end of navigation bar
      floatingActionButton: FloatingActionButton(       //FAB
        onPressed: (){debugPrint("FAB");
          NavigateTOdetail("Add Note");
        } ,
        tooltip: "add note",                //passing text add note to title bar of detailpage
        child: Icon(Icons.add),
      ),
    );
  }


ListView getListview(){                         //****returning List view in the function
  TextStyle titlestyle = Theme.of(context).textTheme.subhead;               //defining theme of the listview
  return ListView.builder(                                          //for creating infinite list
    itemCount: count,
    itemBuilder: (BuildContext context, int position){
      return Card(                                                //defining the card widgetin the list view
        color: Colors.white54,
        elevation: 5.0,
        child: ListTile(
          leading: CircleAvatar(                            //Circular Button beside the tile
            backgroundColor: Colors.yellowAccent,
            child: Icon(Icons.keyboard_arrow_right),
          ),
          title: Text("title", style: titlestyle,),
          subtitle: Text("subtitle"),
          trailing: Icon(Icons.delete_sweep, color: Colors.blueGrey),
          onTap: (){ debugPrint("tapped");
           NavigateTOdetail("Edit Note");},               //passing text edit note to title bar of detailpage
        ),

      );
    },
  );
}

// noob way to navigate
void NavigateTOdetail(String text){                //taking text as an argument to pass to the notedetail class
    Navigator.push(context, MaterialPageRoute(builder: (context){           //navigate to next page
            return NoteDetail(text);
          }));}
}

void filterdialog(BuildContext context)
  {
   var dialog = SimpleDialog(
     title: Text("Filter",),
     
    );
    showDialog(
      context: context,
     builder: (BuildContext context)
     {
      return dialog;
     }
    );

  } 