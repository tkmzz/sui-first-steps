module contador::contador{
    use std::debug::print;

    public struct Counter has drop {
        current: u64,
        target: u64
    }

    #[error]
    const COUNTER_OVERFLOW: u8 = 1;

    fun new(target: u64): Counter {
        Counter {current: 0, target: target}
    }

    fun increment(counter: &mut Counter){
        assert!(counter.current < counter.target, COUNTER_OVERFLOW);
        counter.current = counter.current + 1;
    }

    fun getCurrent(counter: &Counter): u64 {
        print(&counter.current);
        counter.current
    }

    fun isCompleted(counter: &Counter): bool {
        counter.current == counter.target
    }

    fun reset(counter: &mut Counter) {
        counter.current = 0
    }

    fun playCounter(counter: &mut Counter): () {
        while(!isCompleted(counter)){
            getCurrent(counter);
            increment(counter);
        };
        reset(counter);
    }

    #[test]
    fun test_main(){
        let mut counter = new(25);
        playCounter(&mut counter)
  }
}



