#Hoizon Variables
$user = ${env:user}
$pswd = ${env:pass}

#Email Variables
$connection = ${env:connnection_server}
$virtualMachine = ${env:VMName}
$ActionRequired = ${env:action}


#Make a Connection to the Horizon Server
$hvServer1 = Connect-HVServer -Server $connection -User $user -Password $pswd
$Services1= $hvServer1.ExtensionData

if($action -eq 'ExitMaintenance') {

Do{
$vm = Get-HVMachineSummary -MachineName $virtualMachine
$VirtualMachinestate = $vm.Base.BasicState

}until($VirtualMachinestate -ne 'MAINTENANCE')
}


elseif($action -eq 'EnterMaintenance') {

Do{
$vm = Get-HVMachineSummary -MachineName $virtualMachine
$VirtualMachinestate = $vm.Base.BasicState

  
if($VirtualMachinestate -eq 'MAINTENANCE') {
    SendMail
}
}until($VirtualMachinestate -eq 'MAINTENANCE')

}

Start-Sleep -Seconds 30
$vm = Get-HVMachineSummary -MachineName $virtualMachine
$VirtualMachinestate1= $vm.Base.BasicState


Add-Type –Path ‘C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.23\Assemblies\v4.5.2\MySql.Data.dll'
$Connection = [MySql.Data.MySqlClient.MySqlConnection]@{ConnectionString='server=;uid=;pwd=;database='}
$Connection.Open()
$MYSQLCommand = New-Object MySql.Data.MySqlClient.MySqlCommand
$MYSQLDataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter
$MYSQLDataSet = New-Object System.Data.DataSet
$MYSQLCommand.Connection=$Connection
$MYSQLCommand.CommandText="UPDATE horizondesk SET ='"+ $VirtualMachinestate +"' WHERE ='" + $machine + "'"
$MYSQLCommand.ExecuteNonQuery()
$Connection.Close()
