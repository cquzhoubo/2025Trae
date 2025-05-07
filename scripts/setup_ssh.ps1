# 自动配置SSH连接
$sshPath = "$env:USERPROFILE\.ssh"

if (-not (Test-Path $sshPath)) {
    New-Item -Path $sshPath -ItemType Directory -Force
    attrib +h $sshPath
}

@"
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
"@ | Out-File -FilePath "$sshPath\config" -Encoding utf8NoBOM -NoNewline

Write-Host '✅ 请执行：ssh -T git@github.com'