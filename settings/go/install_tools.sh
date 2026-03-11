#!/bin/bash
# install-all-go-tools.sh

echo "🚀 Installing complete Go development toolchain..."

# 定义所有工具
TOOLS=(
    # 核心工具
    "golang.org/x/tools/gopls@latest"
    "golang.org/x/tools/cmd/goimports@latest"
    "mvdan.cc/gofumpt@latest"
    
    # 调试
    "github.com/go-delve/delve/cmd/dlv@latest"
    

    # 静态分析
    # # 官方静态分析工具
    "honnef.co/go/tools/cmd/staticcheck@latest"
    # 检测低效赋值
    "github.com/gordonklaus/ineffassign@latest"
    "github.com/client9/misspell/cmd/misspell@latest" # 拼写检查
    "mvdan.cc/unparam@latest"                         # 未使用参数检查
    

    # 代码生成
    "github.com/cweill/gotests/gotests@latest"
    # 为结构体添加/删除 tags
    "github.com/fatih/gomodifytags@latest"
    # 生成接口实现
    "github.com/josharian/impl@latest"
    # 生成 Mock
    # "github.com/golang/mock/mockgen@latest"
    # "go.uber.org/mock/mockgen@latest"  # Uber 的 mock 工具
    
    # 测试
    "golang.org/x/tools/cmd/cover@latest"
    # 测试运行器
    # "github.com/rakyll/gotest@latest"
    # 压力测试
    # "golang.org/x/tools/cmd/benchcmp@latest"
    
    # 安全
    #  依赖可视化
    # "github.com/go-modules-by-example/listmodwhygraph@latest"
    # 文档服务
    # "golang.org/x/tools/cmd/godoc@latest"
    # 安全漏洞检查
    "golang.org/x/vuln/cmd/govulncheck@latest"
    
    # 性能
    "github.com/google/pprof@latest"
    # 性能追踪
    #"golang.org/x/perf/cmd/benchstat@latest"

    # 内存分析
    # "github.com/dominikh/go-tools/cmd/structlayout@latest"
    # "github.com/dominikh/go-tools/cmd/structlayout-optimize@latest"
    # "github.com/dominikh/go-tools/cmd/structlayout-pretty@latest"

    # 跨平台编译
    # "github.com/mitchellh/gox@latest"
    # # 二进制文件大小分析
    # "github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
    # # 发布工具
    # "github.com/goreleaser/goreleaser@latest"
)

# 安装进度计数器
total=${#TOOLS[@]}
current=1

# 安装所有工具
for tool in "${TOOLS[@]}"; do
    echo "[$current/$total] Installing: $tool"
    go install $tool
    ((current++))
done

echo ""
echo "✅ Installation complete!"
echo ""
echo "📁 Tools installed in: $(go env GOPATH)/bin"
echo ""
echo "📋 Installed tools:"
ls -la $(go env GOPATH)/bin/ | grep -v "^total"

# 检查 PATH
if [[ ":$PATH:" != *":$(go env GOPATH)/bin:"* ]]; then
    echo ""
    echo "⚠️  Add to your shell config (~/.bashrc or ~/.zshrc):"
    echo "    export PATH=\$PATH:$(go env GOPATH)/bin"
fi
