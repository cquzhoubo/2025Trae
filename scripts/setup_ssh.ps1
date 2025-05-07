# 自动配置SSH连接
$sshPath = Join-Path $env:USERPROFILE '.ssh'

if (-not (Test-Path $sshPath)) {
    New-Item -Path $sshPath -ItemType Directory -Force
    attrib +h $sshPath
}

[System.IO.File]::WriteAllText(
    (Join-Path $sshPath 'config'),
    @"
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
"@
)

Write-Host '✅ 请依次执行：
1. 删除旧配置：Remove-Item -Force -Path "$HOME/.ssh/config"
2. 重新运行本脚本
3. 验证连接：ssh -T git@github.com'