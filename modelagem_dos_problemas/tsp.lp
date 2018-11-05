\ Caixeiro2.lp
\ TO, MA, PA, BA, PE, SP



Minimize
    totalcos: xTOPA + xTOMA + xTOBA + xTOPE + xTOSP
            + xPATO + xPAMA + xPABA + xPAPE + xPASP
            + xMATO + xMAPA + xMABA + xMAPE + xMASP
            + xPETO + xPEMA + xPEPA + xPEBA + xPESP
            + xBATO + xBAMA + xBAPA + xBAPE + xBASP
            + xSPTO + xSPMA + xSPPA + xSPBA + xSPPE
Subject to
    partidaTO: xTOMA + xTOPA + xTOBA + xTOPE + xTOSP = 1
    partidaMA: xMATO + xMAPA + xMABA + xMAPE + xMASP = 1
    partidaPA: xPATO + xPAMA + xPABA + xPAPE + xPASP = 1
    partidaBA: xBATO + xBAMA + xBAPA + xBAPE + xBASP = 1
    partidaPE: xPETO + xPEMA + xPEPA + xPEBA + xPESP = 1
    partidaSP: xSPTO + xSPMA + xSPPA + xSPBA + xSPPE = 1
    chegadaTO: xMATO + xPATO + xBATO + xPETO + xSPTO = 1
    chegadaMA: xTOMA + xPAMA + xBAMA + xPEMA + xSPMA = 1
    chegadaPA: xTOPA + xMAPA + xBAPA + xPEPA + xSPPA = 1
    chegadaBA: xTOBA + xMABA + xPABA + xPEBA + xSPBA = 1
    chegadaPE: xTOPE + xMAPE + xPAPE + xBAPE + xSPPE = 1
    chegadaSP: xTOSP + xMASP + xPASP + xBASP + xPESP = 1

End