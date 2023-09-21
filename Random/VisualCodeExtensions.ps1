$VisualCodeExtensions = @(
    "redhat.ansibe"
    "ms-python.python"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode-remote.remote-containers"
    "ms-azuretools.vscode-docker"
    "atlassian.atlascode"
    "ms-vscode.powershell"
    "ms-python.vscode-pylance"
    "redhat.vscode-yaml"
    "aws-scripting-guy.cform"
    "kddejong.vscode-cfn-lint"
    "vscjava.vscode-gradle"
    "jianglinghao.vscode-npm-scripts"
    "4ops.packer"
    "dannysteenman.cloudformation-yaml-snippets"
)

foreach ($extension in $VisualCodeExtensions) {
    code --install-extension $extension
}

Write-Host "Visual Studio Code Extensions Installed"
