function Main()
{
    Driver = DDT.CSVDriver(Files.FileNameByName("Test_Data.txt"))
    TestedApps.RunAll(); 
    orders = Aliases.Orders;
    mainForm = orders.MainForm;
    while(!Driver.EOF())
    {
      OpenForm();
      orderForm = orders.OrderForm;
      groupBox = orderForm.Group;
      PopulateForm();
      Checkpoint();
      CloseForm();
      Driver.Next();
    }
    CloseApplication();
}

