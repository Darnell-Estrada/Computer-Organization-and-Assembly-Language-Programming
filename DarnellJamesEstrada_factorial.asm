# Darnell James V. Estrada
# Professor Farzan Roohparvar
# CS 2430 Sec 01
# Assignment: Have the user enter an integer;
# then use recursion to find its factorial.

.data
        number:         .word          0                       # Create a variable
                                                               # to hold the number
                                                               # inputted by the
                                                               # user.
                                                               
        answer:         .word          0                       # Create a variable
                                                               # to hold the
                                                               # factorial of the
                                                               # number.
                                                                       
        prompt:         .asciiz        "Enter an integer to find its factorial.\n\n"
        message:        .asciiz        "Enter an integer: "
        resMessage:     .asciiz        "The factorial of "
        is:             .asciiz        " is: "
        
.text
        main:             
                        li             $v0, 4                  # Display "prompt".
                        la             $a0, prompt
                        syscall
                               
                        la             $a0, message            # Display "message".
                        syscall
                        
                        li             $v0, 5                  # Have the user
                        syscall                                # input an integer.
                        
                        sw             $v0, number             # Save the integer
                                                               # into "number".
                                                               
                        lw             $a0, number             # Load "number"
                                                               # into an
                                                               # argument.
                                                               
                        jal            findFactorial           # Jump and link to
                                                               # findFactorial.
                                                               
                        sw             $v0, answer             # Save returned value
                                                               # from findFactorial
                                                               # into "answer".
          
                        li             $v0, 4                  # Display
                        la             $a0, resMessage         # "resMessage".
                        syscall
                        
                        li             $v0, 1                  # Display the number
                        lw             $a0, number             # the user originally
                        syscall                                # inputted.
                        
                        li             $v0, 4                  # Display "is".
                        la             $a0, is
                        syscall
                        
                        li             $v0, 1                  # Display the
                        lw             $a0, answer             # factorial (answer)
                        syscall                                # of the number
                                                               # inputted.
                        
        exit:
                        li            $v0, 10                  # Exit the program.
                        syscall
                        
        findFactorial:
                        subu          $sp, $sp, 8              # Save two elements
                                                               # to the stack.
                                                               
                        sw            $ra, 0($sp)              # Save the $ra of a
                                                               # caller to the first
                                                               # spot of the stack
                                                               # pointer.
                                                               
                        sw            $s0, 4($sp)              # Save the local
                                                               # variable of $s0
                                                               # into the second spot
                                                               # in the stack.
                        
                        li            $v0, 1                   # The base case is
                                                               # reached here. The
                                                               # return value is 1.
                                                              
                        beq           $a0, 0, factorialDone    # When the argument is
                                                               # 0, branch to
                                                               # factorialDone.
                                                              
                        move          $s0, $a0                 # Move the argument
                                                               # value into $s0.
                                                              
                        subi          $a0, $a0, 1              # Decrement the
                                                               # argument value by 1
                                                               # to follow the
                                                               # factorial's format
                                                               # (i.e. 5! = 5 * 4!).
                         
                        jal           findFactorial            # Jump and link back
                                                               # to the start of
                                                               # findFactorial
                                                               # (Recursion).
                        
                        mul           $v0, $s0, $v0            # Multiply the
                                                               # return value by one
                                                               # less of its value.
                                                               # Again...
                                                               # (i.e. 5! = 5 * 4!).
                                                              
        factorialDone:
                        lw            $ra, 0($sp)              # Load the return
                                                               # address.
                                                              
                        lw            $s0, 4($sp)              # Load the value of the
                                                               # factorial into $s0.
                                                              
                        addu          $sp, $sp, 8              # Put $sp back to its
                                                               # previous location.
                                                               
                        jr            $ra                      # Jump to the return
                                                               # address.