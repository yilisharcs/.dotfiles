syn match OilExecutable /\v(\s+[r-][w-]x.{6}\s.*[A-Z][a-z]{2}\s+[0-9]{2}\s+([0-9]{2}:[0-9]{2}|[0-9]{4})\s+)@<=.*[^\/]$/

hi OilExecutable guifg=#5fd75f
hi OilLinkHidden guifg=NvimLightRed gui=bold
