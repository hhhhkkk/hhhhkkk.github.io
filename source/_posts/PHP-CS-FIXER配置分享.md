---
title: PHP-CS-FIXER配置分享
date: 2024-08-20 09:08:10
tags: php
---

> 整理本人使用的 PHP-CS-FIXER 的配置，方便以后使用

[文档地址](https://cs.symfony.com/doc/rules/)

以下是我个人在开发 `hyperf` 项目的配置
```php
<?php
// .php-cs-fixer.php
return (new PhpCsFixer\Config())
    ->setRiskyAllowed(true)
    ->setRules([
        // 引用的规则集
        '@PSR2' => true,
        '@Symfony' => true,
        '@DoctrineAnnotation' => true,
        '@PhpCsFixer' => true,
        // 使用短语法定义数组 e.g. [1, 2, 3]
        'array_syntax' => [
            'syntax' => 'short'
        ],
        // 使用短语法解构数组 e.g. [a, b, c] => [$a, $b, $c]    
        'list_syntax' => [
            'syntax' => 'short'
        ],
        // 字符串拼接应配置间隔符
        'concat_space' => [
            'spacing' => 'one'
        ],
        // 关键字语句都应有空格间隔， 可配置关键字列表 ['break', 'case', 'continue', 'declare', 'default', 'do', 'exit', 'for', 'foreach', 'goto', 'if', 'include', 'include_once', 'phpdoc', 'require', 'require_once', 'return', 'switch', 'throw', 'try', 'while', 'yield', 'yield_from']
        'blank_line_before_statement' => [
            'statements' => [
                'declare',
            ],
        ],
        // PHPDoc 注释中移除 author 标签, 标签可定义
        'general_phpdoc_annotation_remove' => [
            'annotations' => [
                'author'
            ],
        ],
        // 只有一行实际内容的单行注释和多行注释应使用语法
        'single_line_comment_style' => [
            'comment_types' => [
            ],
        ],
        // yoda 语法
        'yoda_style' => [
            'always_move_variable' => false,
            'equal' => false,
            'identical' => false,
        ],
        // PHPDoc 对齐设置
        'phpdoc_align' => [
            'align' => 'left',
        ],
        // 禁止在结束分号前使用多行空格，或将分号移到新行以进行链接调用,移除多行空格
        'multiline_whitespace_before_semicolons' => [
            'strategy' => 'no_multi_line',
        ],
        // 禁止大写的常量
        'constant_case' => [
            'case' => 'lower',
        ],
        // 类、trait和interface必须用一个空行或没有空行分隔
        'class_attributes_separation' => true,
        // 移除连续的 unset
        'combine_consecutive_unsets' => true,
        // 声明严格类型
        'declare_strict_types' => true,
        // 确保没有代码与 PHP open 标记在同一行。
        'linebreak_after_opening_tag' => true,
        // 确保静态引用使用小写
        'lowercase_static_reference' => true,
        // 移除无用的 else
        'no_useless_else' => true,
        // 移除无用的 imports
        'no_unused_imports' => true,
        // 非后必须有空格 if(!false) => if(! false)
        'not_operator_with_successor_space' => true,
        // 取非时是否有前置空格 if(!false) => if( !false)
        'not_operator_with_space' => false,
        // 对 类、trait、interface、enums 排序
        'ordered_class_elements' => true,
        // import 排序
        'ordered_imports' => [
            'imports_order' => [
                'class', 'function', 'const',
            ],
            // 排序规则
            'sort_algorithm' => 'alpha',
        ],
        // 跟 PHP unit 有关，目前没摸清用法，大概就是不要与 PHP unit 的方法重名
        'php_unit_strict' => false,
        // PHPDoc 中的注解应该组合在一起，以便相同类型的注解立即相互跟随。不同类型的批注由单个空行分隔。
        'phpdoc_separation' => false,
        // 单引号模式
        'single_quote' => true,
        // 用 != 替换 <>
        'standardize_not_equals' => true,
        // DocBlocks必须以两个星号开头，多行注释必须以一个星号开头，在开始斜杠之后。两者都必须在结束斜杠之前以一个星号结尾。
        'multiline_comment_opening_closing' => true,
    ])
    ->setFinder(
        PhpCsFixer\Finder::create()
            // 排除的目录
            ->exclude('public')
            ->exclude('runtime')
            ->exclude('vendor')
            ->in(__DIR__)
    )
    // 是否启用缓存
    ->setUsingCache(true);

```
