**SYNOPSIS**

This function collects a list of files within a directory and child directories, then amends the last write time to the time of execution

**EXAMPLE**

PS> touch-files -FilePath 'C:\My files' -Recurse True

This example will collect all files from the directory C:\My Files and child directories and amend the last write attribute to the current date/time

**PARAMATER**
	 - FileLocation - This determines the parent location of the files to be amended.
	 - Recurse - This determines if all files in child directories are amended.
