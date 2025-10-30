#!/bin/bash

# ディレクトリ統合スクリプト
# 指定されたディレクトリの中の複数ファイルを1つのディレクトリにまとめる汎用ツールです。

set -euo pipefail

# 色付き出力用の関数
print_info() {
    echo -e "\033[1;34mℹ️  $1\033[0m"
}

print_success() {
    echo -e "\033[1;32m✅ $1\033[0m"
}

print_warning() {
    echo -e "\033[1;33m⚠️  $1\033[0m"
}

print_error() {
    echo -e "\033[1;31m❌ $1\033[0m"
}

print_header() {
    echo -e "\033[1;36m$1\033[0m"
}

# プロジェクトのルートディレクトリ
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 利用可能なディレクトリを取得する関数
get_available_directories() {
    local directories=()
    for item in "$PROJECT_ROOT"/*; do
        if [[ -d "$item" ]]; then
            local dir_name=$(basename "$item")
            # 隠しディレクトリやシステムディレクトリを除外
            if [[ ! "$dir_name" =~ ^\. ]]; then
                directories+=("$dir_name")
            fi
        fi
    done
    printf '%s\n' "${directories[@]}"
}

# ディレクトリ内のファイルをスキャンする関数
scan_directory_files() {
    local directory="$1"
    local dir_path="$PROJECT_ROOT/$directory"
    local files=()
    
    if [[ -d "$dir_path" ]]; then
        # 再帰的にファイルを検索
        while IFS= read -r -d '' file; do
            local relative_path="${file#$dir_path/}"
            files+=("$relative_path")
        done < <(find "$dir_path" -type f -print0)
    fi
    
    printf '%s\n' "${files[@]}"
}

# 利用可能なディレクトリとファイルを表示する関数
display_available_content() {
    print_header "=== 利用可能なディレクトリとファイル ==="
    
    local directories=($(get_available_directories))
    
    for directory in "${directories[@]}"; do
        echo ""
        print_info "📁 $directory/"
        local files=($(scan_directory_files "$directory"))
        
        if [[ ${#files[@]} -gt 0 ]]; then
            for file in "${files[@]}"; do
                echo "  ✓ $file"
            done
        else
            echo "  (ファイルなし)"
        fi
    done
}

# ファイルを統合する関数
merge_files() {
    local target_directory="$1"
    shift
    local selected_directories=("$@")
    
    local target_path="$PROJECT_ROOT/$target_directory"
    
    # 統合ディレクトリを作成
    mkdir -p "$target_path"
    
    print_info "🚀 ファイルを統合中..."
    
    # 各選択されたディレクトリからファイルを統合
    for source_directory in "${selected_directories[@]}"; do
        local source_path="$PROJECT_ROOT/$source_directory"
        
        if [[ -d "$source_path" ]]; then
            print_info "📂 $source_directory からファイルを統合中..."
            
            # ディレクトリ内の全ファイルを再帰的にコピー
            while IFS= read -r -d '' file; do
                local relative_path="${file#$source_path/}"
                local target_file="$target_path/$relative_path"
                local target_dir=$(dirname "$target_file")
                
                # ターゲットディレクトリを作成
                mkdir -p "$target_dir"
                
                # ファイルが既に存在する場合は統合
                if [[ -f "$target_file" ]]; then
                    merge_single_file "$target_file" "$file" "$source_directory"
                else
                    # ファイルが存在しない場合はコピー
                    cp "$file" "$target_file"
                    print_info "  📋 コピー: $relative_path"
                fi
            done < <(find "$source_path" -type f -print0)
        else
            print_warning "ディレクトリが見つかりません: $source_directory"
        fi
    done
}

# 単一ファイルを統合する関数
merge_single_file() {
    local target_file="$1"
    local source_file="$2"
    local source_directory="$3"
    
    local file_extension="${target_file##*.}"
    local relative_path="${target_file#$PROJECT_ROOT/$target_directory/}"
    
    print_info "  🔗 統合: $relative_path"
    
    case "$file_extension" in
        "md")
            merge_markdown_file "$target_file" "$source_file" "$source_directory"
            ;;
        "yml"|"yaml")
            merge_yaml_file "$target_file" "$source_file" "$source_directory"
            ;;
        "toml")
            merge_toml_file "$target_file" "$source_file" "$source_directory"
            ;;
        "json")
            merge_json_file "$target_file" "$source_file" "$source_directory"
            ;;
        *)
            # その他のファイルは追記
            merge_generic_file "$target_file" "$source_file" "$source_directory"
            ;;
    esac
}

# Markdownファイルを統合する関数
merge_markdown_file() {
    local target_file="$1"
    local source_file="$2"
    local source_directory="$3"
    
    {
        echo ""
        echo "---"
        echo ""
        echo "## $source_directory からの設定"
        echo ""
        cat "$source_file"
    } >> "$target_file"
}

# YAMLファイルを統合する関数
merge_yaml_file() {
    local target_file="$1"
    local source_file="$2"
    local source_directory="$3"
    
    {
        echo ""
        echo "# $source_directory からの設定"
        cat "$source_file"
    } >> "$target_file"
}

# TOMLファイルを統合する関数
merge_toml_file() {
    local target_file="$1"
    local source_file="$2"
    local source_directory="$3"
    
    {
        echo ""
        echo "# $source_directory からの設定"
        cat "$source_file"
    } >> "$target_file"
}

# JSONファイルを統合する関数
merge_json_file() {
    local target_file="$1"
    local source_file="$2"
    local source_directory="$3"
    
    {
        echo ""
        echo "// $source_directory からの設定"
        cat "$source_file"
    } >> "$target_file"
}

# 汎用ファイルを統合する関数
merge_generic_file() {
    local target_file="$1"
    local source_file="$2"
    local source_directory="$3"
    
    {
        echo ""
        echo "# $source_directory からの設定"
        cat "$source_file"
    } >> "$target_file"
}

# 対話的にディレクトリを統合する関数
interactive_merge() {
    print_header "🔧 ディレクトリ統合ツール"
    echo "=================================================="
    
    # 利用可能なディレクトリとファイルを表示
    display_available_content
    
    # 統合先ディレクトリを選択
    echo ""
    print_info "📁 統合先ディレクトリを選択してください:"
    echo "1. 新しいディレクトリを作成"
    echo "2. 既存のディレクトリを使用"
    
    read -p "選択 (1-2): " choice
    
    case "$choice" in
        1)
            read -p "新しいディレクトリ名を入力: " target_directory
            ;;
        2)
            local directories=($(get_available_directories))
            print_info "利用可能なディレクトリ:"
            for i in "${!directories[@]}"; do
                echo "$((i+1)). ${directories[i]}"
            done
            read -p "選択 (1-${#directories[@]}): " dir_choice
            if [[ "$dir_choice" -ge 1 && "$dir_choice" -le ${#directories[@]} ]]; then
                target_directory="${directories[$((dir_choice-1))]}"
            else
                print_error "無効な選択です。"
                return 1
            fi
            ;;
        *)
            print_error "無効な選択です。"
            return 1
            ;;
    esac
    
    # 統合するディレクトリを選択
    echo ""
    print_info "📋 統合するディレクトリを選択してください:"
    
    local directories=($(get_available_directories))
    for i in "${!directories[@]}"; do
        local dir="${directories[i]}"
        local file_count=$(scan_directory_files "$dir" | wc -l)
        echo "$((i+1)). $dir ($file_count ファイル)"
    done
    
    read -p "選択 (カンマ区切り、例: 1,2,3): " selected_indices
    
    # 選択されたディレクトリを取得
    local selected_directories=()
    IFS=',' read -ra indices <<< "$selected_indices"
    for index in "${indices[@]}"; do
        local idx=$((index-1))
        if [[ "$idx" -ge 0 && "$idx" -lt ${#directories[@]} ]]; then
            selected_directories+=("${directories[idx]}")
        fi
    done
    
    if [[ ${#selected_directories[@]} -eq 0 ]]; then
        print_error "有効なディレクトリが選択されませんでした。"
        return 1
    fi
    
    # 統合を実行
    echo ""
    print_info "🚀 ディレクトリを統合中..."
    merge_files "$target_directory" "${selected_directories[@]}"
    
    print_success "統合完了！"
    print_success "統合されたファイルは $target_directory/ に保存されました。"
}

# 全ディレクトリを統合する関数
merge_all_directories() {
    local target_directory="$1"
    
    print_info "🚀 全ディレクトリを統合中..."
    
    local directories=($(get_available_directories))
    
    if [[ ${#directories[@]} -eq 0 ]]; then
        print_warning "統合するディレクトリが見つかりませんでした。"
        return 1
    fi
    
    merge_files "$target_directory" "${directories[@]}"
    
    print_success "全ディレクトリの統合完了！"
    print_success "統合されたファイルは $target_directory/ に保存されました。"
}

# ヘルプを表示する関数
show_help() {
    cat << EOF
ディレクトリ統合ツール

使用方法:
    $0 [オプション]

オプション:
    -h, --help              このヘルプを表示
    -t, --target DIR        統合先ディレクトリを指定
    -d, --directories DIRS  統合するディレクトリを指定（スペース区切り）
    -a, --all               全ディレクトリを統合
    -i, --interactive       対話モードで実行（デフォルト）

例:
    $0 -t merged -d "general python spec"
    $0 -t merged --all
    $0 --interactive

EOF
}

# メイン関数
main() {
    local target_directory=""
    local selected_directories=()
    local interactive=true
    local merge_all=false
    
    # コマンドライン引数を解析
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -t|--target)
                target_directory="$2"
                interactive=false
                shift 2
                ;;
            -d|--directories)
                shift
                # スペース区切りの引数を配列に分割
                IFS=' ' read -ra dirs <<< "$1"
                selected_directories+=("${dirs[@]}")
                shift
                ;;
            -a|--all)
                merge_all=true
                interactive=false
                shift
                ;;
            -i|--interactive)
                interactive=true
                shift
                ;;
            *)
                print_error "不明なオプション: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    if [[ "$interactive" == true ]]; then
        interactive_merge
    elif [[ "$merge_all" == true && -n "$target_directory" ]]; then
        merge_all_directories "$target_directory"
    elif [[ -n "$target_directory" && ${#selected_directories[@]} -gt 0 ]]; then
        merge_files "$target_directory" "${selected_directories[@]}"
        print_success "ディレクトリを $target_directory/ に統合しました。"
    else
        print_error "統合先ディレクトリとディレクトリの両方を指定してください。"
        show_help
        exit 1
    fi
}

# スクリプトが直接実行された場合のみメイン関数を呼び出し
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
