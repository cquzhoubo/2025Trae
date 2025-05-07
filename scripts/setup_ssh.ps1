# 自动配置SSH连接
$sshPath = "$env:USERPROFILE\.ssh"

if (-not (Test-Path $sshPath)) {
    New-Item -Path $sshPath -ItemType Directory -Force
    attrib +h $sshPath
}

[IO.File]::WriteAllText("$sshPath\config", @"
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
"@)

Write-Host '✅ 请执行验证命令：ssh -T git@github.com'