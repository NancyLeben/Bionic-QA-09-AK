//USEUNIT Unit2
function CreateEditFile()
{
  FromUnit2()
  EditFile()
}

function FromUnit2()
{
  Unit2.CreateFile()
}

function EditFile()
{ var textEdit = "!!"
  TestedApps.cmd.Run();
// Open file from console
  Aliases.cmd.wndConsoleWindowClass.Keys("start C:\\join.txt[Enter]");
  Aliases.notepad.wndNotepad.Edit.Click(165, 8);
// Edit and save text 
  Aliases.notepad.wndNotepad.Edit.Keys(textEdit);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit");
  Delay(500);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile(FilePath, "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "Join the Dark Side!", false);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit");
// Delete file
  Aliases.cmd.wndConsoleWindowClass.Keys("del C:\\join.txt[Enter]");
  Aliases.cmd.wndConsoleWindowClass.Click(653, 11);
}
