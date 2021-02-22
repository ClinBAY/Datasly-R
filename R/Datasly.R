Datasly <- function(...) {

  arguments <- list(...)
  for (i in 1:length(arguments)){
    if (!(any(class(arguments[[i]])=="data.frame")||any(class(arguments[[i]])=="matrix"))) {
      stop(paste0("Argument ",i,", is not a data frame"))
    }
  }

  sysgetpath<-Sys.getenv("Path");
  path<-""


  if (!((grepl("Datasly",sysgetpath)))==TRUE) {

    #If enviroment is not set check for a settings file
    libpath<-.libPaths()[file.exists(paste0(.libPaths(),"/Datasly/settings.txt"))][1]
    if (!is.na(libpath)) {
      filepath<-paste0(libpath,"/Datasly/settings.txt")
      fileConn<-file(filepath)
      path<-readLines(fileConn)
      close(fileConn)
      if (!file.exists(paste0(path,"Data_Viewer.exe"))) {
        file.remove(filepath)
        path<-""
      }
    }

    #If enviroment is not set check if it is the default folder
    if (file.exists(paste0("C:\\Users\\",Sys.getenv("USERNAME"),"\\AppData\\Local\\ClinBAY\\Datasly\\Data_Viewer.exe")))
    {
      path<-paste0("C:\\Users\\",Sys.getenv("USERNAME"),"\\AppData\\Local\\ClinBAY\\Datasly\\")
    }
    else if (nchar(path)>1) {

    }
    else {
      q1<-askYesNo(msg='Could not run Datasly application. Is Datasly installed?')
      if (is.na(q1)){
        stop('Cancelled');
      }
      if (q1==TRUE) {
        q3<-askYesNo(msg='Would you like to enter the location of Datasly manually?')
        if (q3==TRUE) {
          mylocation <- readline(prompt="Please enter datasly directory manually: ")
          if (!(substr(mylocation, nchar(mylocation),nchar(mylocation))=="\\" || substr(mylocation, nchar(mylocation),nchar(mylocation))=="/")  ) {
            mylocation<-paste0(mylocation,"/")
          }
          if (!file.exists(paste0(mylocation,"Data_Viewer.exe"))) {
            stop("Could not identify Datasly in the designated location")
          }
          libpath<-.libPaths()[file.exists(paste0(.libPaths(),"/Datasly/INDEX"))][1]
          fileConn<-file(paste0(libpath,"/Datasly/settings.txt"))
          mylocation<-gsub(pattern="\\",replacement="/",x=mylocation,fixed=TRUE)
          writeLines(mylocation, fileConn)
          close(fileConn)
        }
        else {
          stop('Please open Datasly as Admin, and check the "Add Datasly to system enviromental variables" option');

        }

      }

      if (q1==FALSE){
        q2<-askYesNo(msg='Would you like to download and install Datasly?')
        if (q2==TRUE){
          #Download file
          download<-download.file("https://datasly.net/Account/Datasly_installer.zip","Datasly_installer.zip")
          #Extract file
          unzip<-unzip("Datasly_installer.zip")
          #Find which of the files extracted is the executable
          filename<-unzip[grepl(".exe",unzip)]
          system(filename)
        }
        else {
          stop('Datasly needs to be installed');
        }
      }

    }
  }

  tempdirname<- tempfile(pattern = "file", tmpdir = tempdir(), fileext = "")
  tempfilename<-paste(tempdirname,".RData",sep="");


  save(...,file=tempfilename);

  if (path=="") {
    dataslycommand<-paste0("Data_Viewer -OpenFile ",tempfilename,' -alldata ')
  }
  else {

    dataslycommand<-paste0("cd ", path,"& Data_Viewer -OpenFile ",tempfilename,' -alldata')
  }
  #print(dataslycommand)
  #system(dataslycommand)
  #print(dataslycommand )
  temp<-shell(dataslycommand,wait=FALSE)


}


datasly<-function(...) {

  Datasly(...)
}


