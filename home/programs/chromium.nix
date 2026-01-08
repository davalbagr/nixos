{pkgs, ...}: {
  enable = true;
  package = pkgs.brave;
  commandLineArgs = [
    "--disable-features=AutofillSavePaymentMethods"
    "--disable-session-crashed-bubble"
    "--disable-infobars"
  ];
}
