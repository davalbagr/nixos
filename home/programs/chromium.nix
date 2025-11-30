{pkgs, ...}: {
  enable = true;
  package = pkgs.ungoogled-chromium;
  commandLineArgs = [
    "--disable-features=AutofillSavePaymentMethods"
    "--disable-session-crashed-bubble"
    "--disable-infobars"
  ];
  extensions = [
    {id = "nngceckbapebfimnlniiiahkandclblb";}
    {id = "ddkjiahejlhfcafbddmgiahcphecmpfh";}
    {id = "noimedcjdohhokijigpfcbjcfcaaahej";}
  ];
}
