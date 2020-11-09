Q1.1 Disabling interrupt can only be used by kernel to create critical sections.

True. Disabling interrupt is a privileged operation that only kernel can perform.

Q1.2 Implementation of lock that uses test-and-set only works on a uniprocessor system.

False. Test-and-set also works on multi-core and multi-socket systems.

Q1.3 V() operation on a semaphore will awake all waiting threads.

False. V() operation will only wake up one waiting thread, if there is any.


Q2. Data races

```
int count = 0; // shared variable since its global

void twiddledee() {
  int i = 0;
  for (i = 0; i < 2; i++) {
    count = count * count; // assume count read from memory once
  }
}

void twiddledum() {
  int i = 0;
  for (i = 0; i < 2; i++) {
    count = count - 1;
  }
}

void main() {
  thread_fork(twiddledee);
  thread_fork(twiddledum);
  print count;
}
```

This problem is similar to the bank withdraw method we have discussed during the lecture.

First, statements like `count = count * count` and `count = count - 1` is actually done with three atomic operations:

1. Read out old `count` value from memory, say reg = load count;
2. Calculate the new value, say reg2 = reg * reg;
3. Write back the new value to `count` (i.e., update), say store reg2 to count

A thread can be interrupted between any of these atomic operations and the context can switch to another thread.
However, unlike the bank problem, here we have loops. To solve this, we can unroll the loop manually to show the executed instructions.
Note that unlike fork(), thread_fork(method) accepts a function/method as parameter
and the newly created thread will start executing the provided function instead of continue to the next instruction after thread_fork.
Therefore, we will have three threads. Next, we list the operations that will be executed.
For simplification, we only consider operations related to `count`:

```
main            twiddledee:       twiddledum:
 |               c1 = count        c5 = count
 |               c2 = c1 * c1      c6 = c5 - 1
 print count     count = c2        count = c6
                 c3 = count        c7 = count
                 c4 = c3 * c3      c8 = c7 - 1
                 count = c4        count = c8
```

To simulate all possible outputs, we can enumerate all permutations of the serialized operations by choosing one operation from each thread.
For example:

```
dum: c5 = count   // read count, c5 = 0
dum: c6 = c5 - 1  // c6 = -1
dee: c1 = count   // read count, c1 = 0
dum: count = c6   // write count, count = -1
dee: c2 = c1 * c1 // c2 = 0
dee: count = c2   // write count, count = 0
main: print count // read count, count = 0
...               // ignore the rest operations since we already have the printed output
```

To check your answer, just follow the serialized operations and track the value of `count`.

In summary, any update (or multiple updates) by one thread could be overwritten by a subsequent update in the second thread.
To get the max, the case where no updates are lost and dum runs all the way before dee, gives us 16 (-2*-2 = 4; 4*4 = 16).
To get min, do the opposite: dee runs first then dum giving us 0*0*0 -1 -1 = -2.
Note that neither of these requires us to lose updates.



Q3.1 Barrier. A group of us go to a restaurant; we wait until the last person arrives before we go in.

This problem is similar to the last reader thread exiting in the readers-writers pattern.

```
int group_count = N;  // initialized to the number of people in our party
Semaphore barrier(0); // initialized to 0
Mutex mutex;          // protect the counter from data races
arrive() {
  mutex.wait();
  group_count--;
  if (group_count == 0) {
    for (int i = 0; i < N; i++)
    barrier.signal();
  }
  mutex.signal();
  barrier.wait();
  //party time!
}
```


Q3.2 Bounded Buffer. A cake baking thread needs three ingredients: cake mix, filling, and ice to make a cake.
Each ingredient is made by a dedicated thread. Whenever we have one of each, we make a cake.
The bakery can store a maximum of three portions of each ingredient.

This is the producer-consumer problem.

```
Semaphore mix_e(3), filling_e(3), icing_e(3); // empty bucket for three ingredients
Semaphore mix(3), filling(3), icing(3);       // available portion for the three ingredients
Mutex     mix_lock, filling_lock, icing_lock; // mutex to protect accessing the buffer

// cake mix producer
cake_mix() {
  while (1) {
    // produce cake mix
    mix_e.wait();
    mix_lock.wait();
    // put cake mix in the bucket
    mix_lock.signal();
    mix.signal();
  }
}

// similar pattern for filling and icing producer

// cake maker thread, the consumer
cake_maker() {
  while (1) {
    // try to get cake mix
    mix.wait();
    mix_lock.wait();
    // get mix
    mix_lock.signal();
    mix_e.signal();

    // try to get filling
    filling.wait();
    filling_lock.wait();
    // get filling
    filling_lock.signal();
    filling_e.signal();

    // try to get icing
    icing.wait();
    icing_lock.wait();
    // get icing
    icing_lock.signal();
    icing_e.signal();

    // make a cake
  }
}

```


Q3.3 Voting Machine. You are writing code for the voting machines for an upcoming election.
A central display shows the counter of each candidate as results come from  different voting machines.
You can consider each machine as a thread and counters are shared between different threads.

This is similar to the bank withdraw problem, we have a set of shared global counter for candidates, we want to avoid data races.

```
Mutex mutex;

update() {
  mutex.wait();
  // updates the counters
  mutex.signal();
}
```

We can have different flavors. The first one, each machine/thread can update the counters after processing each ballot.
The benefit is we'll have more real-time update. But it will also cause frequent access to `mutex.wait()`, causing lock contention.
As a result, the performance will not be good.
The second flavor is to update after processing a batch of ballots.
This method has better turnaround time, but people have to wait for a while to know the new results.
For updating the counters, we can also use a single lock or separated locks for different counter.
The benefit of using separated locks is to allow concurrent updates (e.g., updating the votes for D candidates won't block updating votes for R candidates).


Q4. Deadlock.

We can first convert the RAG to WFG:

```
P1--->P4<---P3
^           ^
|           |
+-----P2----+
```

Since the WFG does not contain a cycle, there is no deadlock.
