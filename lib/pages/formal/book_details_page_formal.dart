import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_app/data/repository.dart';
import 'package:test_app/model/Book.dart';
import 'package:test_app/pages/abstract/book_details_page_abstract.dart';



class BookDetailsPageFormal extends StatefulWidget {


  BookDetailsPageFormal(this.book);

  final Book book;

  @override
  State<StatefulWidget> createState() => new _BookDetailsPageFormalState();

}


class _BookDetailsPageFormalState extends AbstractBookDetailsPageState<BookDetailsPageFormal> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stamp Collection"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Center(
                  child: new Hero(
                    tag: widget.book.id,
                    child: new Image.network(widget.book.url, fit: BoxFit.cover,),
                  ),
                ),
              ),
              new SizedBox(height: 16.0,),
              new Text(widget.book.title, style: const TextStyle(fontSize: 24.0, fontFamily: "Butler"),),
              new SizedBox(height: 8.0,),
              new Text("${widget.book.author} - Sience Ficition", style: const TextStyle(fontSize: 16.0, fontFamily: "Butler", fontWeight: FontWeight.w200),),
              new Divider(height: 32.0, color: Colors.black38,),
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new IconButtonText(
                        onClick: (){},
                        iconData: Icons.store,
                        text: "Search store",
                        selected: false,
                      ),
                  ),
                  new Expanded(
                    child: new IconButtonText(
                      onClick: (){},
                      iconData: Icons.bookmark,
                      text: "Bookmark",
                      selected: false,
                    ),
                  ),
                  new Expanded(
                    child: new IconButtonText(
                      onClick: (){
                        setState(() {
                          widget.book.starred = !widget.book.starred;
                        });
                        Repository.get().updateBook(widget.book);
                      },
                      iconData: widget.book.starred? Icons.remove : Icons.add,
                      text: widget.book.starred? "Remove"  :"Mark as read",
                      selected: widget.book.starred,
                    ),
                  ),
                ],
              ),
              new Divider(height: 32.0, color: Colors.black38,),
              new Text("Description", style: const TextStyle(fontSize: 20.0, fontFamily: "Butler"),),
              new SizedBox(height: 8.0,),
              new Text(widget.book.description, style: const TextStyle(fontSize: 16.0),),
            ],
          ),
        ),
      ),
    );
  }

}


class IconButtonText extends StatelessWidget {



  IconButtonText({@required this.onClick, @required this.iconData, @required this.text, this.selected});


  final VoidCallback onClick;

  final IconData iconData;
  final String text;

  bool selected = false;

  final Color selectedColor = new Color(0xff8ca5e4);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: onClick,
      child: new Column(
        children: <Widget>[
          new Icon(iconData, color: selected? selectedColor: Colors.black,),
          new Text(text, style: new TextStyle(color: selected? selectedColor: Colors.black),)
        ],
      ),
    );
  }

}