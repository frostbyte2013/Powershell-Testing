gci
cls
$PSVersionTable

Set-Variable testconstantvariable -Option ReadOnly -Value "test" #sets the variable 'testconstantvariable' as a readonly/constant variable

Set-Variable testconstantvariable -Option None -Force  #removes readonly status allowing you to edit the variable again


