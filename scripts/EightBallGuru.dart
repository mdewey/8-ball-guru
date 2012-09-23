
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
   
  //TODO: format list item better
  var newItem = new Element.html("<span class='item'><b> $newthing </b></span>");
  
  var list = query("#List");
  var br = new Element.html("<br/>");
  
  list.nodes.add(newItem);
  list.nodes.add(br);
  
  //clear input box
  box.value="";
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
  for (var i = 0; i < count; i ++)
  {
    print(itemList[i]);
  }

  //pick one
  var choice = getChoice(count);
  var selectedItem = itemList[choice];
  window.alert("Selected item: $selectedItem ");
  //TODO:clear list
  
  
  //TODO:add this item to list as selected
  
}


int getChoice(max)
{
  var ch;
  var r = new Random();
  ch = r.nextInt(max+1) ;
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