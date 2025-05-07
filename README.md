# 2025Trae
## 快速开始

1. 生成SSH密钥：
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. 执行自动配置脚本：
```powershell
./scripts/setup_ssh.ps1
```

3. 克隆仓库：
```bash
git clone git@github.com:cquzhoubo/2025Trae.git
```

4. 验证SSH连接：
```bash
ssh -T git@github.com
```