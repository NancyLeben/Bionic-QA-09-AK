//USEUNIT Create_File

function CreateEditFile()
{
  Create_File.OpenApp();
  Create_File.CreateFile(); 
  EditFile();
  DelEditedFile();
}

function EditFile()
{ 
  Log.AppendFolder("Edit File");
  var textEdit = "We have cookies";

// Open file from console	
  TestedApps.cmd.Run();
  cmd.Keys("start "+FilePath+"[Enter]");
  TestedApps.cmd.Close();
	
// Edit and save text
  NotepadWnd.MainMenu.Click("Edit|Select All");
	NotepadWnd.Edit.Keys("[Del]")
  NotepadWnd.Edit.Keys(textEdit);
  NotepadWnd.MainMenu.Click("File|Save");
  NotepadWnd.MainMenu.Click("File|Exit");
	
//Verify 
  Delay(1000);
  TestedApps.notepad.Run();
  NotepadWnd.MainMenu.Click("File|Open...");
  notepad.dlgOpen.OpenFile(FilePath, "Text Documents (*.txt)");
  aqObject.CompareProperty(NotepadWnd.Edit.wText, 0, textEdit, false);
  NotepadWnd.MainMenu.Click("File|Exit");
	Log.PopLogFolder();
}

function DelEditedFile()
{ 
  TestedApps.cmd.Run();
  cmd.Keys("del "+FilePath+"[Enter]");
  TestedApps.cmd.Close();
}




