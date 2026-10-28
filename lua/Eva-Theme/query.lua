local M = {}

function M.c_sharp()
  vim.treesitter.query.set(
    'c_sharp',
    'highlights',
    [[;; extends

    (binary_expression
       operator: ["==" "!=" "<" ">" ">=" "<=" "||" "&&" "??"] @Eva-Theme.logical)

    (prefix_unary_expression
       "!" @Eva-Theme.logical)

    (assignment_expression
       operator: "=" @Eva-Theme.assignment)

    (parameter
       "=" @Eva-Theme.assignment)

    (variable_declarator
       name: (identifier) @Eva-Theme.variable
       "=" @Eva-Theme.assignment)

    (enum_member_declaration
       "=" @Eva-Theme.assignment)

    (anonymous_object_creation_expression
       "=" @Eva-Theme.assignment)

    (property_declaration
       "=" @Eva-Theme.assignment)

    (lambda_expression
       "=>" @Eva-Theme.func)

    (arrow_expression_clause
       "=>" @Eva-Theme.func)

    (switch_expression_arm
       "=>" @Eva-Theme.func)

    (enum_declaration
       name: (identifier) @Eva-Theme.variable)

    (enum_member_declaration
       name: (identifier) @Eva-Theme.constant)

    (property_pattern_clause
      (subpattern
        (identifier) @Eva-Theme.property))

    (recursive_pattern
      type: (identifier) @Eva-Theme.type)

    (constant_pattern
      (member_access_expression
        expression: (identifier) @Eva-Theme.type
        name: (identifier) @Eva-Theme.constant))

    (nullable_type
       "?" @Eva-Theme.logical)

    (initializer_expression
       (assignment_expression
          left: (identifier) @Eva-Theme.variable))

    (member_binding_expression
      name: (identifier) @Eva-Theme.property)

    (invocation_expression
      function: (conditional_access_expression
        condition: (identifier)
        (member_binding_expression
          name: (identifier) @Eva-Theme.func))
      arguments: (argument_list))

    (property_declaration
       name: (identifier) @Eva-Theme.variable)

    (accessor_declaration
       name: _ @Eva-Theme.func)

    (implicit_array_creation_expression
       "new" @Eva-Theme.keyword)

    (implicit_object_creation_expression
       "new" @Eva-Theme.keyword)

    (object_creation_expression
       "new" @Eva-Theme.keyword)

    (type_parameter
       ["out" "in"]? @Eva-Theme.keyword
       name: (identifier) @Eva-Theme.primitive)

    (type_parameter_constraints_clause
       "where" @Eva-Theme.logical)

    (typeof_expression
       "typeof" @Eva-Theme.primitive)

    (default_expression
       "default" @Eva-Theme.func
       type: (identifier)? @Eva-Theme.type)

    (argument
       "out" @Eva-Theme.keyword)

    (constructor_constraint
       "new" @Eva-Theme.keyword)

    (fixed_statement
       "fixed" @Eva-Theme.logical)

    (tuple_element
       name: (identifier) @Eva-Theme.property)
  ]]
  )
end

function M.typescript()
  vim.treesitter.query.set(
    'typescript',
    'highlights',
    [[;; extends

    (binary_expression
       operator: ["==" "!=" "===" "!==" "<" ">" ">=" "<=" "&&" "||" "??"] @Eva-Theme.logical)

    (unary_expression
       operator: "!" @Eva-Theme.logical)

    (assignment_expression
       "=" @Eva-Theme.assignment)

    (variable_declarator
       "=" @Eva-Theme.assignment)

    (type_alias_declaration
       "=" @Eva-Theme.assignment)

    (required_parameter
       "=" @Eva-Theme.assignment)

    (unary_expression
       operator: "typeof" @Eva-Theme.primitive)

    (index_type_query
       "keyof" @Eva-Theme.func)

    (arrow_function
       "=>" @Eva-Theme.func)

    (function_type
       "=>" @Eva-Theme.func)

    (method_definition
       ["get" "set"] @Eva-Theme.func)

    (member_expression
       "." @Eva-Theme.punctuation)

    (union_type
       "|" @Eva-Theme.logical)

    (intersection_type
       "&" @Eva-Theme.logical)

    (literal_type
       [(undefined) (true) (false)] @Eva-Theme.primitive)

    (type_parameter
       name: (type_identifier) @Eva-Theme.parameter)

    (default_type
       "=" @Eva-Theme.assignment)

    (import_statement
       "import" @Eva-Theme.keyword
       "type"? @Eva-Theme.logical
       "from" @Eva-Theme.keyword)

    (namespace_import
       "*" @Eva-Theme.operator)

    (type_query
       "typeof" @Eva-Theme.primitive)

    (public_field_definition
       "=" @Eva-Theme.assignment)

    (nested_type_identifier
      module: (identifier) @Eva-Theme.module)

    (lexical_declaration
       kind: "const"
       (variable_declarator
          name: (identifier) @Eva-Theme.constant))

    (new_expression
       "new" @Eva-Theme.keyword)

    (throw_statement
       "throw" @Eva-Theme.func)

    (optional_chain
       "?." @Eva-Theme.punctuation)
  ]]
  )
end

function M.javascript()
  vim.treesitter.query.set(
    'javascript',
    'highlights',
    [[;; extends

    (binary_expression
       operator: ["==" "!=" "===" "!==" "<" ">" ">=" "<=" "&&" "||" "??"] @Eva-Theme.logical)

    (unary_expression
       operator: "!" @Eva-Theme.logical)

    (assignment_expression
       "=" @Eva-Theme.assignment)

    (assignment_pattern
       "=" @Eva-Theme.assignment)

    (variable_declarator
       "=" @Eva-Theme.assignment)

    (arrow_function
       "=>" @Eva-Theme.func)

    (unary_expression
       operator: "typeof" @Eva-Theme.primitive)

    (method_definition
       ["get" "set"] @Eva-Theme.func)

    (new_expression
       "new" @Eva-Theme.keyword)

    (throw_statement
       "throw" @Eva-Theme.func)
  ]]
  )
end

function M.go()
  vim.treesitter.query.set(
    'go',
    'highlights',
    [[;; extends

    (binary_expression
       operator: ["==" "!=" "<" ">" ">=" "<=" "&&" "||"] @Eva-Theme.logical)

    (unary_expression
       operator: "!" @Eva-Theme.logical)

    (assignment_statement
       operator: "=" @Eva-Theme.assignment)

    (short_var_declaration
       ":=" @Eva-Theme.assignment)

    (var_spec
       "=" @Eva-Theme.assignment)

    (const_spec
       "=" @Eva-Theme.assignment)
  ]]
  )
end

function M.lua()
  vim.treesitter.query.set(
    'lua',
    'highlights',
    [[;; extends

    (assignment_statement
       operator: "=" @Eva-Theme.assignment)

    (field
       "=" @Eva-Theme.assignment)

    ;(field
    ;   name: (identifier) @Eva-Theme.variable)

    (binary_expression
       operator: ["==" "~="] @Eva-Theme.logical)
  ]]
  )
end

function M.c()
  vim.treesitter.query.set(
    'c',
    'highlights',
    [[;; extends

    (assignment_expression
       operator: "=" @Eva-Theme.assignment)

    (enumerator
       "=" @Eva-Theme.assignment)

    (init_declarator
       "=" @Eva-Theme.assignment)

    (initializer_pair
       "=" @Eva-Theme.assignment)

    (binary_expression
       operator: ["==" "!=" "<" ">" ">=" "<=" "||" "&&"] @Eva-Theme.logical)

    (unary_expression
       operator: "!" @Eva-Theme.logical)

    (enum_specifier
       name: (type_identifier) @Eva-Theme.variable)

    (type_definition
       type: (enum_specifier)
       declarator: (type_identifier) @Eva-Theme.variable)

    (macro_type_specifier
       name: (identifier) @Eva-Theme.func)
  ]]
  )
end

function M.cpp()
  vim.treesitter.query.set(
    'cpp',
    'highlights',
    [[;; extends

    (enumerator
       "=" @Eva-Theme.assignment)

    (field_declaration
       "=" @Eva-Theme.assignment)

    (assignment_expression
       operator: "=" @Eva-Theme.assignment)

    (init_declarator
       "=" @Eva-Theme.assignment)

    (initializer_pair
       "=" @Eva-Theme.assignment)

    (binary_expression
       operator: ["==" "!=" "<" ">" ">=" "<=" "||" "&&"] @Eva-Theme.logical)

    (unary_expression
       operator: "!" @Eva-Theme.logical)
  ]]
  )
end

function M.rust()
  vim.treesitter.query.set(
    'rust',
    'highlights',
    [[;; extends

    (assignment_expression
       "=" @Eva-Theme.assignment)

    (let_declaration
       "=" @Eva-Theme.assignment)

    (enum_variant
       "=" @Eva-Theme.assignment)

    (binary_expression
      operator: ["==" "!=" "<" "<=" ">" ">=" "&&" "||"] @Eva-Theme.logical)

    (unary_expression
      "!" @Eva-Theme.logical)

    (field_initializer
      field: (field_identifier) @Eva-Theme.variable)

    (field_declaration
      name: (field_identifier) @Eva-Theme.variable)

    (enum_item
       name: (type_identifier) @Eva-Theme.variable)

    (enum_variant
       name: (identifier) @Eva-Theme.type)

    ((type_identifier) @Eva-Theme.this
      (#eq? @Eva-Theme.this "Self"))

    (match_arm
       "=>" @Eva-Theme.func)
  ]]
  )
end

return M
