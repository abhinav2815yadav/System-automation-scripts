# Bulk user creation from CSV in Active Directory
Import-Csv "C:\UsersList.csv" | ForEach-Object {
    New-ADUser -Name $_.Name `
               -GivenName $_.FirstName `
               -Surname $_.LastName `
               -SamAccountName $_.Username `
               -UserPrincipalName "$($_.Username)@yourdomain.com" `
               -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force) `
               -Enabled $true
}
