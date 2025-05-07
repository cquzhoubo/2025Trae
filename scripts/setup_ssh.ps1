# 自动配置SSH连接
$sshPath = Join-Path $env:USERPROFILE '.ssh'

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
"@ | Out-File (Join-Path $sshPath 'config') -Encoding utf8 -NoNewline

Write-Host '✅ SSH配置完成，请执行测试命令：ssh -T git@github.com'