    include lib/thread.s

; self-replicate once; print thread-id every tick
self_replicate::main():
    call thread::next()
    push self_replicate::main()
    call thread::spawn(fn()*)->Thread*
    dec rs
.loop:
    read r0 CURR_THREAD
    dbg r0
    call thread::next()
    jmp .loop