if ($?tcsh) then
	set modules_shell="tcsh"
else
	set modules_shell="csh"
endif

if ( -f /opt/Modules/default/init/${modules_shell} ) then
   source /opt/Modules/default/init/${modules_shell}
endif

setenv MODULERCFILE /opt/modulerc
module add null

unset modules_shell

