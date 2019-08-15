# Darnell James V. Estrada
# Professor Farzan Roohparvar
# CS 2430 Sec 01
# 
# =Final Project=
# 
# Have the user enter 25 integers and store them in a 2D array.
# After that, implement a menu-driven program to prompt what
# function the user want to perform. The functions include:
# exit, switching two rows, and switching columns. I will
# actually add another function that will display the 2D array.

.data
        arr_Addr:        .space        100                      # 100 integers.
        
        arr_Temp:        .space        20                       # Temporary array.
        
        temp_Var1:       .word         0                        # To save address.
        temp_Var2:       .word         0                        # To save address.
        
        row_Incr:        .word         4                        # Increment rows.
        col_Incr:        .word         20                       # Increment rows.
        
        fp:              .asciiz       "FINAL PROJECT\n\n"
        
        prompt:          .asciiz       "Please enter 25 integers in an array.\n\n"
        note1:           .asciiz       "NOTE: Use similar significant figures to\n"
        note2:           .asciiz       "minimize disfigurement in the table.\n\n"
        enter:           .asciiz       "Enter integer ("
        colon:           .asciiz       ") : "
        
        instr1:          .asciiz       "\nEnter which function you want to perform"
        instr2:          .asciiz       "\nby entering its corresponding number in\n"
        instr3:          .asciiz       "the menu.\n"
        menu1:           .asciiz       "\nMENU:\n[0] EXIT\n[1] SWITCH ROWS\n"
        menu2:           .asciiz       "[2] SWITCH COLUMNS\n[3] DISPLAY\n"
        menuInp:         .asciiz       "\nEnter menu option: "
        
        exiting:         .asciiz       "\nExiting the program..."
        
        row_sw1:         .asciiz       "\nEnter two row numbers to switch, "
        row_sw2:         .asciiz       "each between (1-5).\n"
        row_inp:         .asciiz       "Enter row number: "
        
        col_sw1:         .asciiz       "\nEnter two column numbers to switch,"
        col_sw2:         .asciiz       "each between (1-5).\n"
        col_inp:         .asciiz       "Enter column number: "
        
        switch1:         .asciiz       "The contents have switched!\nCheck it "
        switch2:         .asciiz       "out by heading to menu option 3.\n"
        
        col_LABEL:       .asciiz       "\n     1   2   3   4   5\n"
        border1:         .asciiz       "  -----------------------"
        border2:         .asciiz       "|"
        
        again1:          .asciiz       "\nYou entered an invalid number. "
        again2:          .asciiz       "Please Refer back to the menu "
        again3:          .asciiz       "and try again.\n"
        
        newLine:         .asciiz       "\n"
        space:           .asciiz       "   "
        
.text
        main:
                         li            $v0, 4                   # Display "fp".
                         la            $a0, fp
                         syscall
                         
                         la            $a0, prompt              # Display "prompt".
                         syscall
                         
                         la            $a0, note1               # Display "note1".
                         syscall
                         
                         la            $a0, note2               # Display "note2".
                         syscall
                         
                         la            $t0, arr_Addr            # Register address.
                         la            $t1, arr_Temp            # Register address.
                         
                         li            $s0, 0                   # Create a counter.
                         
        inp_LOOP:
                         beq           $s0, 25, reset           # Exit the loop.
                         
                         li            $v0, 4                   # Display "enter".
                         la            $a0, enter
                         syscall
                         
                         li            $v0, 1                   # Display counter.
                         addi          $a0, $s0, 1
                         syscall
                         
                         li            $v0, 4                   # Display "colon".
                         la            $a0, colon
                         syscall
                         
                         li            $v0, 5                   # Get user input.
                         syscall
                         
                         sw            $v0, ($t0)               # Save input.
                         
                         addi          $t0, $t0, 4              # Increase address.
                         addi          $s0, $s0, 1              # Increase counter.
                         
                         j             inp_LOOP                 # Loop function.
                         
        reset:
                         li            $v0, 4                   # Display "instr1".
                         la            $a0, instr1
                         syscall
                         
                         la            $a0, instr2              # Display "instr2".
                         syscall
                         
                         la            $a0, instr3              # Display "instr3".
                         syscall
                         
                         li            $s0, 0                   # Reset counter.
                         
        menu_LOOP:
                         li            $v0, 4                   # Display "menu1".
                         la            $a0, menu1
                         syscall
                         
                         la            $a0, menu2               # Display "menu2".
                         syscall
                         
                         la            $a0, menuInp             # Display "menuInp".
                         syscall
                         
                         li            $v0, 5                   # Get menu input.
                         syscall
                         
                         beq           $v0, 0, exit             # Branch to exit.
                         beq           $v0, 1, row_SWITCH       # Branch to row...
                         beq           $v0, 2, col_SWITCH       # Branch to col...
                         beq           $v0, 3, disp             # Branch to disp.
                         
                         bne           $v0, 0, repeat           # Branch to repeat
                         bne           $v0, 1, repeat           # if the user enters
                         bne           $v0, 2, repeat           # an invalid input
                         bne           $v0, 3, repeat           # in the menu.
                         
                         addi          $s0, $s0, 1              # Increase counter.
                         
                         j             menu_LOOP                # Loop function.
                         
        exit:
                         li            $v0, 4                   # Display "exiting".
                         la            $a0, exiting
                         syscall
                         
                         li            $v0, 10                  # Exit the program.
                         syscall
                         
        row_SWITCH:
                         li            $v0, 4                   # Display "row_sw1".
                         la            $a0, row_sw1
                         syscall
                         
                         la            $a0, row_sw2             # Display "row_sw2".
                         syscall
                         
                         la            $a0, row_inp             # Display "row_inp".
                         syscall
                         
                         li            $v0, 5                   # Get row number.
                         syscall
                         
                         move          $t8, $v0                 # Reduce the input
                         subi          $t8, $t8, 1              # value by one.
                         
                         li            $v0, 4                   # Display "row_inp".
                         la            $a0, row_inp
                         syscall
                         
                         li            $v0, 5                   # Get row number.
                         syscall
                         
                         move          $t9, $v0                 # Reduce the input
                         subi          $t9, $t9, 1              # value by one.
                         
                         la            $t0, arr_Addr            # Reset base address.
                         lw            $s7, row_Incr            # Load row increment.
                         
                         mul           $t8, $t8, 20             # Address = [Base
                         add           $t0, $t0, $t8            # + 20(Row #)]
                         
                         sw            $t0, temp_Var1           # Save 1st address.
                         
                         jal           transfer_to_MEM          # Jump to this func.
                         
                         la            $t0, arr_Addr            # Reset base address.
                         la            $t1, arr_Temp            # Reset temp address.
                         li            $s0, 0                   # Reset counter.
                         
                         mul           $t9, $t9, 20             # Address = [Base
                         add           $t0, $t0, $t9            # + 20(Row #)]
                         
                         sw            $t0, temp_Var2           # Save 2nd address.
                         lw            $t2, temp_Var1           # Load 1st address.
                         
                         jal           transfer_in_MID          # Jump to this func.
                         
                         li            $s0, 0                   # Reset the counter.
                         
                         lw            $t0, temp_Var2           # Load 2nd address.
                         lw            $t2, temp_Var1           # Load 1st address.
                         la            $t1, arr_Temp            # Reset temp address.
                         
                         jal           transfer_fr_MEM          # Jump to this func.
                         
                         la            $t0, arr_Addr            # Reset base address.
                         la            $t1, arr_Temp            # Reset temp address.
                         li            $s0, 0                   # Reset counter.
                         
                         li            $v0, 4                   # Display "switch1".
                         la            $a0, switch1
                         syscall
                         
                         la            $a0, switch2             # Display "switch2".
                         syscall
                         
                         j             menu_LOOP                # Go back to menu.
                         
        col_SWITCH:
                         li            $v0, 4                   # Display "col_sw1".
                         la            $a0, col_sw1
                         syscall
                         
                         la            $a0, col_sw2             # Display "col_sw2".
                         syscall
                         
                         la            $a0, col_inp             # Display "col_inp".
                         syscall
                         
                         li            $v0, 5                   # Get column number.
                         syscall
                         
                         move          $t8, $v0                 # Reduce the input
                         subi          $t8, $t8, 1              # value by one.
                         
                         li            $v0, 4                   # Reset base address.
                         la            $a0, col_inp
                         syscall
                         
                         li            $v0, 5                   # Get column number.
                         syscall
                         
                         move          $t9, $v0                 # Reduce the input
                         subi          $t9, $t9, 1              # value by one.
                         
                         la            $t0, arr_Addr            # Reset base address.
                         lw            $s7, col_Incr            # Load col increment.
                         
                         mul           $t8, $t8, 4              # Address = [Base
                         add           $t0, $t0, $t8            # + 4(COL #)]
                         
                         sw            $t0, temp_Var1           # Save 1st address.
                         
                         jal           transfer_to_MEM          # Jump to this func.
                         
                         la            $t0, arr_Addr            # Reset base address.
                         la            $t1, arr_Temp            # Reset temp address.
                         li            $s0, 0                   # Reset counter.
                         
                         mul           $t9, $t9, 4              # Address = [Base
                         add           $t0, $t0, $t9            # + 4(COL #)]
                         
                         sw            $t0, temp_Var2           # Save 2nd address.
                         lw            $t2, temp_Var1           # Load 1st address.
                         
                         jal           transfer_in_MID          # Jump to this func.
                         
                         li            $s0, 0                   # Reset the counter.
                         
                         lw            $t0, temp_Var2           # Load 2nd address.
                         lw            $t2, temp_Var1           # Load 1st address.
                         la            $t1, arr_Temp            # Reset temp address.
                         
                         jal           transfer_fr_MEM          # Jump to this func.
                         
                         la            $t0, arr_Addr            # Reset base address.
                         la            $t1, arr_Temp            # Reset temp address.
                         li            $s0, 0                   # Reset counter.
                         
                         li            $v0, 4                   # Display "switch1".
                         la            $a0, switch1
                         syscall
                         
                         la            $a0, switch2             # Display "switch2".
                         syscall
                         
                         j             menu_LOOP                # Go back to menu.
                         
        transfer_to_MEM:
                         lw            $t7, ($t0)               # Transfer the value
                         sw            $t7, ($t1)               # to memory.
                         
                         add           $t0, $t0, $s7            # Increase array.
                         addi          $t1, $t1, 4              # Increase temp.
                         addi          $s0, $s0, 1              # Increase counter.
                         
                         bne           $s0, 5, transfer_to_MEM  # Loop the function.
                         
                         jr            $ra                      # Jump register.
                         
        transfer_in_MID:
                         lw            $t7, ($t0)               # Transfer the value
                         sw            $t7, ($t2)               # to other row/col.
                         
                         add           $t2, $t2, $s7            # Increase array.
                         add           $t0, $t0, $s7            # Increase array.
                         addi          $s0, $s0, 1              # Increase counter.
                         
                         bne           $s0, 5, transfer_in_MID  # Loop the function.
                         
                         jr            $ra                      # Jump register.
                         
        transfer_fr_MEM:
                         lw            $t7, ($t1)               # Transfer the value
                         sw            $t7, ($t0)               # from memory.
                         
                         add           $t0, $t0, $s7            # Increase array.
                         add           $t1, $t1, 4              # Increase temp.
                         addi          $s0, $s0, 1              # Increase counter.
                         
                         bne           $s0, 5, transfer_fr_MEM  # Loop the function.
                         
                         jr            $ra                      # Jump register.
                         
        disp:
                         li            $v0, 4                   # Display "col...".
                         la            $a0, col_LABEL
                         syscall
                         
                         la            $a0, border1             # Display "border1".
                         syscall
                         
                         la            $t0, arr_Addr            # Reset Base address.
                         
                         li            $s1, 0                   # Create out counter.
                         li            $s2, 0                   # Create in counter.
                         
        disp_outer_LOOP:
                         li            $v0, 4                   # Create a new line.
                         la            $a0, newLine
                         syscall
                         
                         li            $v0, 1                   # Display row label.
                         addi          $a0, $s1, 1
                         syscall
                         
                         li            $v0, 4                   # Display "border2".
                         la            $a0, border2
                         syscall
                         
                         li            $v0, 4                   # Display "space".
                         la            $a0, space
                         syscall
                         
                         li            $s2, 0                   # Reset in counter.
                         
                         jal           disp_inner_LOOP          # Jump to this func.
                         
                         addi          $s1, $s1, 1              # Incr. out counter.
                         
                         bne           $s1, 5, disp_outer_LOOP  # Loop the function.
                         
                         li            $v0, 4                   # Create a new line.
                         la            $a0, newLine
                         syscall
                         
                         j             menu_LOOP                # Go back to menu.
                         
        disp_inner_LOOP:
                         li            $v0, 1                   # Display array
                         lw            $a0, ($t0)               # contents from
                         syscall                                # memory.
                         
                         li            $v0, 4                   # Display "space".
                         la            $a0, space
                         syscall
                         
                         addi          $t0, $t0, 4              # Incr. base address.
                         
                         addi          $s2, $s2, 1              # Incr. in counter.
                         
                         bne           $s2, 5, disp_inner_LOOP  # Loop the function.
                         
                         jr            $ra                      # Jump register.
                         
        repeat:
                         li            $v0, 4                   # Display "again1".
                         la            $a0, again1
                         syscall
                         
                         la            $a0, again2              # Display "again2".
                         syscall
                         
                         la            $a0, again3              # Display "again3".
                         syscall
                         
                         j            menu_LOOP                 # Go back to menu.
