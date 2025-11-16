(call_expression
  function: (identifier) @_name
  (#any-of? @_name "type" "scope")
  arguments: [(arguments
    (string
      (string_fragment) @injection.content))

    (arguments
      (array
        (string
          (string_fragment) @injection.content)))

    (arguments
      (object
        (pair
          key: ([(property_identifier) (string)]
            value: (string
              (string_fragment) @injection.content)))))

    ; go a level deeper
    (arguments
      (object
        (pair
          key: ([(property_identifier) (string)]
            value: (object
              (pair
               key: ([(property_identifier) (string)]
             value: (string
               (string_fragment) @injection.content))))))))]
  (#set! injection.language "arktype"))

(call_expression
  function: (member_expression
              object: (identifier) @_name
              (#eq? @_name "type")
              property: (property_identifier))
  arguments: (arguments
               (string
                 (string_fragment) @injection.content
                 (#set! injection.language "arktype"))))
