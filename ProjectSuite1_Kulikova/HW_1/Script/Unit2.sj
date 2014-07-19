�� //This script creates, saves and deletes txt file

 var Text = "Join the Dark Side" ; 
 var FilePath  = "C:\\join.txt" ;

function CreateDelFile()
{
  CreateFile() ;
  DelFile() ;
}

function CreateFile()
{ TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys(Text);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.dlgSaveAs.SaveFile(FilePath, "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, Text, false);
  Aliases.notepad.wndNotepad.Close();
}

function DelFile()  
{  TestedApps.cmd.Run();
  Aliases.cmd.wndConsoleWindowClass.Keys("del C:\\join.txt[Enter]");
  Aliases.cmd.wndConsoleWindowClass.Click(654, 14);
}
