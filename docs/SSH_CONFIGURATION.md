## Windows SSH配置指南
1. 打开PowerShell执行：
```powershell
$sshDir = Join-Path $env:USERPROFILE '.ssh'
if (-not (Test-Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir -Force
    attrib +h $sshDir}

$configContent = @"
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
"@
$configContent | Out-File (Join-Path $sshDir 'config') -Encoding UTF8 -NoNewline
```
2. 验证文件权限：
```powershell
icacls (Join-Path $sshDir 'config') /grant "Administrators:(F)"
```
3. 测试连接：
```
ssh -T git@github.com
```