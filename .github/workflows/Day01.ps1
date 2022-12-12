$stopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
$stopWatch.Start()

$current_elf_cals=0
$all_elves_cals=@()
get-clipboard | foreach {                   # Copy input to clipboard and run through all rows
    if($_ -eq ''){                          # If empty row
        $all_elves_cals+=$current_elf_cals  #   add total of current elf to array of sums
        $current_elf_cals=0                 #   reset counter
        }
    else {
        $current_elf_cals+=$_               # Else add current row to total of current elf
        }                                   # (doesn't really need an else-clause, since $current_elf_cals=0 
    }                                       # if it has passed through the if-clause)

#$all_elves_cals | sort -descending | select -first 1 | measure -sum
$all_elves_cals | sort -descending | select -first 3 | measure -sum

$stopWatch.Stop()
$stopWatch