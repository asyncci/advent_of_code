const std = @import("std");
const ArrayList = std.ArrayList;
const fs = std.fs;

pub fn main() !void {
    var buffer: [7001]u8 = undefined;
    const string = try fs.cwd().readFile("data/2015/day1/data2.txt", &buffer);
    var floor: i32 = 0;

    const pos = for (string, 0..) |c, i| {
        if (c == 0 or c == 10) continue;

        if (c == '(') {
            floor += 1;
        } else {
            floor -= 1;
        }

        if (floor == -1) {
            break i + 1;
        }
    } else 0;
    std.debug.print("{}\n", .{pos});
}
