
NeoTrace Version 2.12a
Released February 1, 2000
--------------------------------------------------------------------------
Welcome to NeoTrace 2.12a!

Please review this entire document.

It is recommended that you completely uninstall any previous versions of
NeoTrace, including any beta versions, before installing this new release.
_____________
DOCUMENTATION

Help information is hosted on the NeoWorx web site.  When you select a help
button or menu item your browser will be opened and a help screen loaded
from the NeoWorx web site.  Be sure you are online when using NeoTrace.

The complete user manual in PDF format may be downloaded from the NeoWorx web
site.  Links to the PDF document appear on all online help pages.

If you do not yet have PDF compatible software you can download a free Acrobat
reader from the Adobe web site at http://www.adobe.com

You can download the full manual by using the Auto Update
feature built in to NeoTrace or from the navigation bar while viewing any
online help page.

___________________
PROGRAM DESCRIPTION

NeoTrace is a diagnostic and investigative tool.  It traces the network path
across the Internet from the host system to a target system anywhere on the 
Internet.  Automatic retrieval of data includes registration details for the
owner of each computer on the route (address, phone, email address) and the 
network each node IP is registered to.  Easy to read views of the data 
include a world map showing the locations of nodes along the route, a graph 
showing the relative response time of each node along the path, a simple 
listing and an abstract representation of the path and node types along the 
route.

NeoTrace has been popular with home enthusiasts for diagnosing connection 
problems.  Many Internet Service Providers recommend NeoTrace to their 
customers and also use it themselves.  By providing their users with NeoTrace 
many organizations have found they are able to decrease the number of help 
desk calls they handle related to connection problems.  It is also used by 
law enforcement professionals worldwide, including US Customs and NATO, and 
is taught in courses at the FBI Academy and in Internet Investigator training 
for officers in the state of California.  It has been shown on national TV 
in conjunction with stories on law enforcement efforts to track down pedophiles 
and other criminals.

NeoTrace is the quickest way to get an overview of a connection and through 
its combination of ease of use and powerful and automatic data retrieval it is 
a favored tool of both novices and seasoned professionals.

____________
REQUIREMENTS

To use NeoTrace you will need:

· A '32 bit' version of Windows, i.e. Win95, 98 or NT 4.0 or Windows 2000.
· A connection to the internet 
· MS internet support, this includes wininet.dll and icmp.dll, a standard
  part of 99% of Windows installations.  If you are missing these files
  visit the support pages on our web site.
· The MS version of WinSock, this is the default installation for all windows
  platforms.  If you are using a 3rd party winsock implementation, such as
  Trumpet, you may have problems.

__________
WHAT'S NEW

Changes from 2.12 to 2.12a:


· Greatly expanded local Location Database available with this release
· Data related to NeoTrace installation is now stored in the Registry for
  use by software which wishes to interact with NeoTrace.
· Minor revisions to the event sounds.
· Corrected screen refresh problem when resizing the window.  This flaw affected
  the 'action animation' area of the toolbar on some systems.
· Corrected a minor flaw in the parsing of returned location data when used
  in setting new node locations.  Does not affect users.

Changes from 2.11 to 2.12:

· Improved map drawing.  Maps should now draw considerably faster on slower 
  machines.
· Revised Whois lookup.  NeoTrace now complies with version 1.1 of the Whois
  protocol.
· Online help now detects if you are not connected to the Internet before 
  attempting to access a help page on the NeoWorx server.

Changes from 2.10 to 2.11:

· Configuration Dialog now has options in a tabbed format to simplify the
  appearance and allow room for more options.
· Maps have been restructured to accomodate systems with drivers unable
  to render shapes with very large numbers of points.
· Help file has been removed from the distribution and replaced with
  online help.  The online help is hosted on the NeoWorx web site, allowing
  the information to be presented in a more versatile format and be kept
  up to date.
· Improved location database.  The database of known node locations was
  again enhanced significantly with this release.

Changes from 2.02 to 2.10:

· Edit Location Information option.  Users can now edit the location of
  nodes.  This allows you to place the location of nodes you know about that 
  are not included in our database.  There is also an option to submit the 
  location of these nodes to our master database if you want their location 
  to be made publicly available.
· Auto-Update feature added.  Found under the Help menu, Auto-Update lets
  users check our server for updated support files.  As we add new nodes to the
  local database and more detailed maps, these support files will be available
  through Auto-Update.
· U.S. specific map.  Traces fully contained in the U.S. will be displayed
  on a more detailed map of the United States.
· World map can now wrap on Pacific for nicer trans-Pacific trace displays.
· Improved Home Location dialog.  The Home Location dialog now includes a
  small map to verify the location you input as correct.
· Improved local database.  The database of known node locations continues
  to expand.
· View Map of this Location option.  Users can now view a detailed map of 
  the location of a node in question via a popular Internet mapping web page.
· Graph view updated.  The Graph view has improved labels and contrast.
· List view improved.  The look and feel of the list view has been
  improved.
· Corrected problems with display on large font systems and problems with the
  toolbar being 'compacted'
· Improved scroll and zoom behavior on map display.


Changes from 2.01 to 2.02:

· Corrected the standard print output for WhoIs information changes from NSI.
· Fixed a few minor anamalies when deleting traces and exiting the program.
· Added a warning message when no home location (latitude and longitude) is 
  entered, also display NeoWorx Inc. as the default home location in this case.
· A warning message is now displayed when switching the displayed trace during an
  active trace.

Changes from 2.0 to 2.01:

· Changed parsing of WhoIs results from NSI to accommodate new disclaimer.
· Updated 'action' animation indicates rest position, click to open
  NeoWorx home page.
· Fixed minor memory leak that occurred on exit from NeoTrace.
· All tabs including the first one can now be deleted.
· Fixed screen redraw 'flicker' that occurred when changing views.

Changes from 1.22 to 2.0:

This is a major new release.

· Completely updated User Interface
· Geographical trace result placement
· Geographical databases, public/shared and private/local
· Multiple views:
     · Map view
     · Node view (this is analogous to the NeoTrace 1.x interface)
     · List view
     · Graph view
· One-click saving and printing of results
· One-click copy results to clipboard
· New UI features multiple traces in memory simultaneously
· Up to five traces can be viewed on separate tabs
· Automatic retrieval of network owner information
· Configurable WhoIs servers
· The output display was greatly improved when running in 256-color mode
· New "tracing" animation was created for this release
· The "Escape" key can now be used to stop a active trace
· Now features a more standard Windows UI including menus
· Numerous keyboard shortcuts
· Ctrl+Enter for adding www. and .com to the name in the trace to box and 
  start tracing has been added to the address entry

_____________
ABOUT NEOWORX

NeoWorx is a privately held company specializing in high quality tools for
today's internet users and developers.  We pride ourselves on intuitive
design, uncompromising quality and performance, and proving that quality
software can STILL fit on a floppy!

Thanks from all of us at NeoWorx.

NeoWorx Inc.
http://www.neoworx.com
support@neoworx.com
sales@neoworx.com
info@neoworx.com

--------------------------------------------------------------------------
PLEASE NOTE: NeoTrace is not public domain software, nor is it free software.
You are granted a 30 day trial license to use this software and determine if
it meets your needs.  If you are still using it after 30 days you are required
to license the software by purchasing a registered version of NeoTrace.
--------------------------------------------------------------------------
NeoTrace and NeoWorx are trademarks of NeoWorx Inc.
Copyright ©2000 NeoWorx Inc.  All Rights Reserved.
