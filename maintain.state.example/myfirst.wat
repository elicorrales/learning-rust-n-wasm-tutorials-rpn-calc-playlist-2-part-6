(;
Let's explore if a WASM VM can maintain state between
function calls.
;)

(module

    (global $mystorage (mut i32) (i32.const 0))


    (func $setIt (export "setIt") (param i32) 
        local.get 0                 ;;load input onto stack(could be a number or operator)
        global.set $mystorage       ;;pop from stack and save to global storage
    )

    (func $getIt (export "getIt") (result i32)
        global.get $mystorage       ;;get from global storage, push onto stack
                                    ;;pop from stack because it's end of function
                                    ;;return the value
    )
)

