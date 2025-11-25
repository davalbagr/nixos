{pkgs, ...}: {
  enable = true;
  package = pkgs.ungoogled-chromium;
  commandLineArgs = [
    "--disable-features=AutofillSavePaymentMethods"
  ];
  extensions = [
    {id = "nngceckbapebfimnlniiiahkandclblb";}
    {id = "ddkjiahejlhfcafbddmgiahcphecmpfh";}
  ];
}
