
#import('dart:html');
#import('dart:math');


//page load
void main() {
  //adds handlers to buttons
  initButtons();
  
}
/*
 * Business Logic
 * 
 * */
void addItemToList()
{
  //get value from textbox
  InputElement box = query('#newItemBox');
    
  //add item to list
  String newthing = box.value;
   if (newthing.length > 0 )
   {
     actuallyAddItemToList(newthing);
      //clear input box
      box.value="";

   }
  
}

void actuallyAddItemToList(newthing)
{
  var template = query("#template").innerHTML;
  var innerHTMLToAdd = template.replaceAll("%newItem%", newthing);
  var newItem = new Element.html(innerHTMLToAdd);
  var list = query("#List");
  list.nodes.add(newItem);
}

void chooseItem()
{
  //gather all items in an array from the DOM
  var itemListFromDOM = queryAll(".item");
  var itemList = new Map();
  var count = 0;
  for (var item in itemListFromDOM)
  {
    itemList[count] = item.nodes[0].text;
    count++;
  }
  //remove template from list of selection
  itemList.remove(--count);
    
  for (var i = 0; i < count; i ++)
  {
    print(itemList[i]);
  }

  //pick one
  var choice = getChoice(count);
  var selectedItem = itemList[choice];
 
  //clear list
  var list = query("#List");
  list.remove();
  var listParent = query("#listParent");
  listParent.nodes.add(new Element.html('<div id="List"></div>'));
  //add this item to list as selected
  actuallyAddItemToList(selectedItem);
  var newItem = query('.item');
  newItem.classes.remove("alert-info");
  newItem.classes.add("alert-success");
}


int getChoice(max)
{
  var ch;
  var r = new Random();
  ch = r.nextInt(max) ;
  return ch;
}


/*
 * Boilerplate functions ??
 * Subject to change as more projects are made
 * */
void initButtons()
{
  //add item to screen button
   var addButton = document.query('#addButton');
   addButton.on.click.add((event) => addItemToList() );
   
   //pick item
   var chooseButton = document.query('#chooseButton');
   chooseButton.on.click.add((event) => chooseItem() );
}
