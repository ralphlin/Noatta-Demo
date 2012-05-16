// BioPlugin ActiveX control to capture finger data
<OBJECT ID="BioPlugInActX" WIDTH=0 HEIGHT=0 CLASSID="CLSID:05E8280C-D45A-494F-AE42-840A40444AFF">
<param name="_Version" value="65536">
<param name="_ExtentX" value="2646">
<param name="_ExtentY" value="2646">
<param name="_StockProps" value="0">
</OBJECT>

<script language="javascript" type="text/javascript">
/* global variables used to determine which route to
take after onIdentify */

checkin=false;
payscan=false;

/* Identify calls single finger scan from M2Sys ActiveX control */
function Identify()
{
  BioPlugInActX.IdentifyQuick(0);
}

/* scanIn is called after onIdentify for checkin */
function scanIn(uid)
{
  var targetURL = 'http://localhost:3000/scanin/'
  window.location.replace(targetURL + uid); 
}

/* scanPay is called after onIdentify for payment */
function scanPay(uid)
{
  var targetURL = 'http://localhost:3000/paymentconfirmation/'
  var amount = <%= params[:amounttopay] %>
  window.location.replace(targetURL + uid + "/" + amount); 
}
</script>


/* catches onIdentify ActiveX event and directs to correct page 
for either check in or payment */
<script language="javascript" type="text/javascript" for="BioPlugInActX" event="OnIdentify()" >
  var foundID = BioPlugInActX.result;
  if ((foundID == "000000000") | (foundID == "-1"))
  {
    alert("User not found!");
    window.location.replace('http://localhost:3000/clientdemo');
  }
  else
  { 
    if ( checkin === true )
    {
      checkin=false;
      scanIn(foundID);
    }
    if ( payscan === true )
    {
      payscan=false;
      scanPay(foundID);
    }
  }
</script>
