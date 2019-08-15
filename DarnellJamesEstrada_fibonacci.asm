 # Darnell James V. Estrada
 # Professor Farzan Roohparvar
 # CS 2430 Sec 01
 # Assignment: Have the user enter two integers; then
 # use recursion to demonstrate the fibonacci sequence.

.data
        int1:          .word        0                       # Create a variable to
                                                            # hold the first integer
                                                            # the user entered.
        
        int2:          .word        0                       # Create variable to
                                                            # hold the second integer
                                                            # the user entered.
        
        outcome:       .word        0                       # Create a variable to
                                                            # hold an outcome of
                                                            # the fibonacci sequence.
        
        prompt1:       .asciiz      "Enter two integers and I will show its "
        prompt2:       .asciiz      "fibonacci sequence up to 20 elements.\n\n"
        
        enter1:        .asciiz      "Enter your first integer: "
        enter2:        .asciiz      "Enter your second integer: "
        
        end:           .asciiz      "\n\nThis ends this fibonacci sequence with 20 "
        elements:      .asciiz      "elements."
        
        newLine:       .asciiz       "\n"
        space:         .asciiz       " "
        
.text
        main:
                       li           $v0, 4                  # Display "prompt1".
                       la           $a0, prompt1
                       syscall
                       
                       la           $a0, prompt2            # Display "prompt2".
                       syscall
                       
                       la           $a0, enter1             # Display "enter1".
                       syscall
                       
                       li           $v0, 5                  # Have the user input
                       syscall                              # the first integer.
                       
                       sw           $v0, int1               # Save the first integer
                                                            # into "int1".
         
                       li           $v0, 4                  # Display "enter2".
                       la           $a0, enter2
                       syscall
                       
                       li           $v0, 5                  # Have the user input
                       syscall                              # the second integer.
                       
                       sw           $v0, int2               # Save the second integer
                                                            # into "int2".
                       
                       li           $v0, 4                  # Create a new line.
                       la           $a0, newLine
                       syscall
                       
                       li           $v0, 1                  # There is no reason to
                       lw           $a0, int1               # display "int1" in the
                       syscall                              # recursive function
                                                            # since the user knows
                                                            # it, so display it here.
                       
                       li           $v0, 4                  # Display "space".
                       la           $a0, space
                       syscall
                       
                       li           $v0, 1                  # There is no reason to
                       lw           $a0, int2               # display "int2" in the
                       syscall                              # recursive function
                                                            # since the user knows
                                                            # it, so display it here.
                       
                       li           $v0, 4                  # Display "space".
                       la           $a0, space
                       syscall
                       
                       li           $t0, 0                  # Set an index
                                                            # initialized to 0.
                       
                       lw           $a1, int1               # Load "int1" into this
                                                            # first argument.
                       
                       lw           $a2, int2               # Load "int2" into this
                                                            # second argument.
                       
                       jal          fib                     # Jump and link to fib.
                                                            # In this function, we
                                                            # will display the next
                                                            # elements of the
                                                            # fibonacci sequence.
                              
                       li           $v0, 4                  # Display "end".
                       la           $a0, end
                       syscall
                       
                       li           $v0, 4                  # Display "elements".
                       la           $a0, elements
                       syscall
                       
        exit:
                       li           $v0, 10                 # Exit the program.
                       syscall  
                     
        fib:           
                       subu         $sp, $sp, 16            # Save four elements to
                                                            # the stack.
                       
                       sw           $ra, 0($sp)             # Save the $ra of caller
                                                            # to the first spot of
                                                            # the stack pointer.
                       
                       sw           $a1, 4($sp)             # Save the earlier element
                                                            # into the second spot of
                                                            # the stack pointer.
                        
                       sw           $a2, 8($sp)             # Save the later element
                                                            # into the third spot
                                                            # of the stack pointer.
                        
                       sw           $v0, 12($sp)            # Save what will be the
                                                            # next element of the
                                                            # fibonacci sequence
                                                            # into the fourth spot
                                                            # of the stack pointer.
                       
                       beq          $t0, 18, fibDone        # If the index equals to
                                                            # 24, leave this part of
                                                            # the function to fibDone.
                                                           
                                                            # We recurse 18 times to
                                                            # create the 18 elements
                                                            # of the fibonacci
                                                            # sequence into the stack.
                                                            # I could change this to 
                                                            # show whatever number of 
                                                            # elements to be
                                                            # displayed but I just
                                                            # chose 18.
                        
                       add          $v0, $a1, $a2           # Add the two elements and
                                                            # store the result in $v0.
                                                                     
                       move         $a1, $a2                # Make the next element
                                                            # the previous element.
                                                           
                       move         $a2, $v0                # Make the fibonacci
                                                            # element the next
                                                            # element.
                       
                       sw           $v0, outcome            # Save the fibonacci
                                                            # element into "outcome".
                       
                       li           $v0, 1                  # Display "outcome".
                       lw           $a0, outcome
                       syscall
                       
                       li           $v0, 4                  # Display "space".
                       la           $a0, space
                       syscall
                       
                       addi         $t0, $t0, 1             # Increment the index 
                                                            # count by 1. 
                       
                       jal          fib                     # Jump and link back to
                                                            # start of fib
                                                            # (Recursion).
                                                                     
        fibDone:
                       lw           $ra, 0($sp)             # Load the return address.
                       
                       lw           $a1, 4($sp)             # Load the previous
                                                            # element.
                       
                       lw           $a2, 8($sp)             # Load the next element.
                        
                       lw           $v0, 12($sp)            # Load the fibonacci
                                                            # element.
                                                            
                       addu         $sp, $sp, 16            # Put $sp back to its
                                                            # previous location.
                       
                       jr           $ra                     # Jump to return address.
