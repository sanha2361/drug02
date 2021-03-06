import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MemoTile extends StatefulWidget {
  DocumentSnapshot dc;
  MemoTile(this.dc);
  @override
  _MemoTileState createState() => _MemoTileState();
}

class _MemoTileState extends State<MemoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          print(widget.dc['subject']);
        },
        child: Card(
          elevation: 0.0,
          margin: EdgeInsets.fromLTRB(20.0, 7.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(widget.dc['suject']),
                  SizedBox(width: 10.0),
                  Text(widget.dc['content']),

                  /*ListTile(
                      /*trailing:  GFAvatar(
                        backgroundImage: NetworkImage(note.photourl),
                        shape: GFAvatarShape.square
                      ),*/
                      title:Text(note.title),
                      /*leading:CircleAvatar(
                        radius:15.0,
                        backgroundColor: Colors.brown,
                        backgroundImage: NetworkImage(note.photourl),
                      ),*/
                     
                      onTap:() {
                       //print('${note.title}');
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailView(note: note ,user:user)),);
                       //Navigator.pop(context);
                      },
                    ),*/
                ],
              ),
              Divider(
                thickness: 5,
              )

              //Divider(height:5.0),
              /*Row(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: <Widget>[
                        CircleAvatar(
                        radius:10.0,
                        backgroundColor: Colors.brown,
                        backgroundImage: NetworkImage(user.photoUrl),
                        
                      ),
                      SizedBox(width:5.0),
                      Text(note.timestamp.toDate().toString()),
                      SizedBox(width:5.0),
                      Text('조회수'),
                      SizedBox(width:5.0),
                      Text(note.count.toString()),
                      SizedBox(width:5.0),
                      Text('댓글'),
                      SizedBox(width:5.0),
                      Text(note.replycount.toString()),
                      
                      
                      
                      ],
                    ),
                    
                  
                    Divider(thickness:3.0)*/
            ],
          ),
        ),
      ),
    );
  }
}
