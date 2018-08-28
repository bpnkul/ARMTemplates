#Set-ExecutionPolicy RemoteSigned

Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name "AllUsers" -Path "DC=TESTSYS,DC=com"
New-ADOrganizationalUnit -Name "Department0" -Path "ou=AllUsers,DC=TESTSYS,DC=com"
New-ADOrganizationalUnit -Name "Department1" -Path "ou=AllUsers,DC=TESTSYS,DC=com"
New-ADOrganizationalUnit -Name "Department2" -Path "ou=AllUsers,DC=TESTSYS,DC=com"
New-ADOrganizationalUnit -Name "Department3" -Path "ou=AllUsers,DC=TESTSYS,DC=com"
New-ADOrganizationalUnit -Name "Department4" -Path "ou=AllUsers,DC=TESTSYS,DC=com"

 $total = 1000
 for ($userIndex=0; $userIndex -lt $total; $userIndex++) 
 { 
  $userID = "{0:0000}" -f ($userIndex + 1)
  $userName = "test.user$userID"
  $deptNumber = $userIndex%5
  $ouPath = "ou=Department$deptNumber,ou=AllUsers,DC=TESTSYS,DC=com"

  Write-Host "Creating user" ($userIndex + 1) "of" $total ":" $userName " at : " $ouPath

  New-ADUser `
   -AccountPassword (ConvertTo-SecureString "AAaaAAaa11!!11" -AsPlainText -Force) `
   -City "City" `
   -Company "Company" `
   -Country "US" `
   -Department "Department" `
   -Description ("TEST ACCOUNT " + $userID + ": This user account does not represent a real user and is meant for test purposes only")`
   -DisplayName "Test User ($userID)" `
   -Division "Division" `
   -EmailAddress "$userName@TESTSYS.com" `
   -EmployeeNumber "$userID" `
   -EmployeeID "ISED$userID" `
   -Enabled $true `
   -Fax "703-555-$userID" `
   -GivenName "Test" `
   -HomePhone "703-556-$userID" `
   -Initials "TU$userID" `
   -MobilePhone "703-557-$userID" `
   -Name "Test User ($userID)" `
   -Office "Office: $userID"`
   -OfficePhone "703-558-$userID" `
   -Organization "Organization" `
   -Path "$ouPath" `
   -POBox "PO Box $userID"`
   -PostalCode $userID `
   -SamAccountName $userName `
   -State "VA - Virginia" `
   -StreetAddress "$userID Any Street" `
   -Surname "User ($userID)" `
   -Title "Title" `
   -UserPrincipalName "$userName@TESTSYS.com"
 }