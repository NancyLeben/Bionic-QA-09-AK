//This script creates, saves and deletes txt file

//Global variables
  var Text = "Join the Dark Side"; 
  var FilePath  = "C:\\join.txt";
  var  notepad = Aliases.notepad;
	var  NotepadWnd = Aliases.notepad.wndNotepad;
  var cmd = Aliases.cmd.wndConsoleWindowClass;

function CreateDelFile()
{
  OpenApp();
  CreateFile();
  DelFile();
}

function OpenApp()
{
	TestedApps.notepad.Run();
}

function CreateFile()
{  
   Log.AppendFolder("Create File");
//Steps	 
   NotepadWnd.Edit.Keys(Text);
   NotepadWnd.MainMenu.Click("File|Save");
   notepad.dlgSaveAs.SaveFile(FilePath, "Text Documents (*.txt)");
	 NotepadWnd.Close();
   Delay(1000);
	 TestedApps.notepad.Run();
	 NotepadWnd.MainMenu.Click("File|Open...");
	 notepad.dlgOpen.OpenFile(FilePath, "Text Documents (*.txt)");
//Verification	 
	 aqObject.CompareProperty(NotepadWnd.Edit.wText, 0, Text, false);
   NotepadWnd.Close();
	 Log.PopLogFolder();
}

function DelFile()  
{  
   TestedApps.cmd.Run();
   cmd.Keys("del "+FilePath+"[Enter]");
   TestedApps.cmd.Close();
}


