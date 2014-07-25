function Main()
{
openApp();
createOrders();
editOrders();
delAll();
closeApp();
}

function openApp()
{
  TestedApps.Orders.Run();
}

function createOrders()
{
 var driver = DDT.CSVDriver(Files.FileNameByName("Test_Data.txt"));
 while (!driver.EOF())
  { Log.AppendFolder("Create Order");  
    var  orders;
    var  orderForm;
    var  groupBox;
    var  textBox;
//Steps  
    orders = Aliases.Orders;
    orders.MainForm.MainMenu.Click("Orders|New order...");
    orderForm = orders.OrderForm;
    
    groupBox = orderForm.Group;
    groupBox.ProductNames.ClickItem(driver.Value(0));
  
    textBox = groupBox.Quantity;
    textBox.wValue = driver.Value(1);
  
    textBox = groupBox.Price;
    textBox.wText = driver.Value(2);
  
    textBox = groupBox.Discount;
    textBox.wText = driver.Value(3); 
  
    textBox = groupBox.Date;
    textBox.wDate = driver.Value(4);
  
    textBox = groupBox.Customer; 
    textBox.wText = driver.Value(5);
  
    textBox = groupBox.Street;
    textBox.wText = driver.Value(6);
  
    textBox = groupBox.City;
    textBox.wText = driver.Value(7);
  
    textBox = groupBox.State;
    textBox.wText = driver.Value(8);

    textBox = groupBox.Zip;
    textBox.wText = driver.Value(9);
    
    groupBox.WinFormsObject(driver.Value(10)).Click();

    textBox = groupBox.CardNo; 
    textBox.wText = driver.Value(11);
  
    groupBox.ExpDate.wDate = driver.Value(12); 
  
    orderForm.ButtonOK.ClickButton();
 //Verification   
    aqObject.CompareProperty(Aliases.Orders.MainForm.OrdersView.wSelectedItems, cmpEqual, driver.Value(5), false);
   
    Log.PopLogFolder();
    driver.Next();
 }
  DDT.CloseDriver("driver");
}

function editOrders()
{
 var driver = DDT.CSVDriver(Files.FileNameByName("Test_Data.txt"));
 while (!driver.EOF())
  { Log.AppendFolder("Edit Order");
    var  orders;
    var  listView;
    var  orderForm;
    var  textBox;
  
    orders = Aliases.Orders;
    listView = orders.MainForm.OrdersView;
    listView.ClickItemR(driver.Value(5), 0);
    listView.PopupMenu.Click("Edit order...");
    orderForm = orders.OrderForm;
    textBox = orderForm.Group.Customer;
    textBox.wText = driver.Value(13);
    orderForm.ButtonOK.ClickButton();
//Verification  
    aqObject.CompareProperty(Aliases.Orders.MainForm.OrdersView.wSelectedItems, cmpEqual, driver.Value(13), false); 
    
    Log.PopLogFolder();
    driver.Next();
  }
 DDT.CloseDriver("driver");
}

function delAll() 
{ var  orders;
  var  listView; 
  var  ItemCount; 
  orders = Aliases.Orders;
  listView = orders.MainForm.OrdersView;
  ItemCount = listView.itemCount;
  for (i = 0; i < ItemCount; i++) 
 {
  Log.AppendFolder("Del Order");
  listView.ClickItemR(0);
  listView.PopupMenu.Click("Delete order");
  orders.dlgConfirmation.btnYes.ClickButton();
  Log.PopLogFolder();
 }
} 

function closeApp()
{ Log.AppendFolder("Close App");
  var  orders;
  orders = Aliases.Orders;
  orders.MainForm.Close();
//Don't save changes  
  orders.dlgConfirmation.btnNo.ClickButton();
  Log.PopLogFolder();
}









