{pkgs, ...}: {
  enable = true;
  package = pkgs.ungoogled-chromium;
  commandLineArgs = [
    "--disable-features=AutofillSavePaymentMethods"
    "--disable-session-crashed-bubble"
  ];
  extensions = [
    {id = "nngceckbapebfimnlniiiahkandclblb";}
    {id = "ddkjiahejlhfcafbddmgiahcphecmpfh";}
  ];
}
