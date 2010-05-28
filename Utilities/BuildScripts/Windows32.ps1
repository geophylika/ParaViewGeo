Clear-Host

#$client = new-object System.Net.WebClient
#$client.DownloadFile( $url, $path )

#ftp://ftp.qt.nokia.com/jom/jom.zip

Set-Content CMakeCache.txt "
CMAKE_BUILD_TYPE:STRING=Release
BUILD_SHARED_LIBS:BOOL=ON
BUILD_TESTING:BOOL=OFF
PARAVIEW_BUILD_QT_GUI:BOOL=ON
PARAVIEW_ENABLE_PYTHON:BOOL=ON
PYTHON_EXECUTABLE:FILEPATH=/System/Library/Frameworks/Python.framework/Versions/2.3/bin/python
PYTHON_INCLUDE_PATH:PATH=/System/Library/Frameworks/Python.framework/Versions/2.3/include/python2.3
PYTHON_LIBRARY:FILEPATH=/System/Library/Frameworks/Python.framework/Versions/2.3/Python
PARAVIEW_TESTING_WITH_PYTHON:BOOL=OFF
PYTHON_UTIL_LIBRARY:FILEPATH=
CMAKE_OSX_ARCHITECTURES:STRING=i386;ppc
CMAKE_OSX_SYSROOT:PATH=/Developer/SDKs/MacOSX10.4u.sdk
CMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.4
QT_QMAKE_EXECUTABLE:FILEPATH=/Users/partyd/Dashboards/Support/qt-4.6.2/bin/bin/qmake
VTK_USE_FFMPEG_ENCODER:BOOL=ON
VTK_USE_QVTK_QTOPENGL:BOOL=ON
VTK_USE_64BIT_IDS:BOOL=OFF
BUILD_DOCUMENTATION:BOOL=ON
PARAVIEW_GENERATE_PROXY_DOCUMENTATION:BOOL=ON
GENERATE_FILTERS_DOCUMENTATION:BOOL=ON".Split()




function UnzipFile([string] $zipFile, [string] $destinationFolder)
{
    if(test-path($zipFile))
    {
        $shell = new-object -com Shell.Application
        $srcFolder = $shell.NameSpace($zipFile)
        $destFolder = $shell.NameSpace($destinationFolder)
        $items = $srcFolder.Items()
        $destFolder.CopyHere($items);
    }        
}

function wget([string]$url, [string]$path)
{

  if(!(Split-Path -parent $path) -or !(Test-Path -pathType Container (Split-Path -parent $path))) {
    $path = Join-Path $pwd (Split-Path -leaf $path)
  }

  "Downloading [$url]`nSaving at [$path]"

  $client = new-object System.Net.WebClient
  $client.DownloadFile( $url, $path )
}