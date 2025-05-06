## SSH密钥配置指南
1. 获取公钥内容：
```powershell
cat $env:USERPROFILE\.ssh\id_ed25519.pub
```
2. 登录GitHub → Settings → SSH and GPG keys → New SSH key
3. 添加~/.ssh/config配置：
```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
```
4. 测试连接：
```
ssh -T git@github.com
```