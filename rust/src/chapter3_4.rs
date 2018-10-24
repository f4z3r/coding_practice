//! n the classic problem of the Towers of Hanoi, you have 3 rods and N disks of different sizes which can slide onto
//! any tower. The puzzle starts with disks sorted in ascending order of size from top to bottom (e.g. each disk sits on
//! top of an even larger one). You have the following constraints:
//!
//! (A) Only one disk can be moved at a time
//! (B) A disk is slid off the top of one rod onto the next rod
//! (C) A disk can only be placed on top of a larger disk
//!
//! Write a program to move the disks from the first rod to the last using Stacks.

struct HanoiProgram {
    tower1: Tower,
    tower2: Tower,
    tower3: Tower,
    size: usize
}

impl HanoiProgram {
    pub fn new(size: usize) -> HanoiProgram {
        if size < 1 { panic!("Size should be larger than 1"); }
        let tower1 = Tower::new_filled(1, size);
        let tower2 = Tower::with_capacity(2, size);
        let tower3 = Tower::with_capacity(3, size);
        HanoiProgram { tower1, tower2, tower3, size }
    }

    pub fn run(&mut self) -> String {
        self.tower1.move_disks(self.size, &mut self.tower3, &mut self.tower2)
    }
}

struct Tower {
    index: usize,
    disks: Vec<usize>,
}

impl Tower {
    pub fn new(index: usize) -> Tower {
        Tower { index: index, disks: Vec::new() }
    }

    pub fn with_capacity(index: usize, capacity: usize) -> Tower {
        Tower { index: index, disks: Vec::with_capacity(capacity) }
    }

    pub fn new_filled(index: usize, capacity: usize) -> Tower {
        Tower { index: index, disks: (1..capacity+1).rev().collect() }
    }

    pub fn index(&self) -> usize {
        self.index
    }

    pub fn add(&mut self, disk: usize) {
        if let Some(&d) = self.disks.last() {
            if d <= disk {
                panic!("Cannot stack larger disks on top of smaller ones");
            }
        }
        self.disks.push(disk);
    }

    pub fn move_top_to(&mut self, dest: &mut Tower) -> String {
        let disk = self.disks.pop().unwrap();
        dest.add(disk);
        format!("moving disk {} from tower {} to tower {}\n", disk, self.index(), dest.index())
    }

    pub fn move_disks(&mut self, disk_count: usize, dest: &mut Tower, buffer: &mut Tower) -> String {
        if disk_count > 0 {
            let mut movements = self.move_disks(disk_count - 1, buffer, dest);
            movements.push_str(&self.move_top_to(dest));
            movements.push_str(&buffer.move_disks(disk_count - 1, dest, self));
            return movements;
        }
        "".to_owned()
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let mut program = HanoiProgram::new(3);
        let output = program.run();
        let mut expected = "moving disk 1 from tower 1 to tower 3\n".to_owned();
        expected.push_str("moving disk 2 from tower 1 to tower 2\n");
        expected.push_str("moving disk 1 from tower 3 to tower 2\n");
        expected.push_str("moving disk 3 from tower 1 to tower 3\n");
        expected.push_str("moving disk 1 from tower 2 to tower 1\n");
        expected.push_str("moving disk 2 from tower 2 to tower 3\n");
        expected.push_str("moving disk 1 from tower 1 to tower 3\n");
        assert_eq!(output, expected);
    }
}
