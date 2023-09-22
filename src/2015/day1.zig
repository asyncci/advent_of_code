const std = @import("std");
const ArrayList = std.ArrayList;
const fs = std.fs;

pub fn main() !void {
    var buffer: [7001]u8 = undefined;
    const string = try fs.cwd().readFile("data/2015/day1/data.txt", &buffer);
    var floor: i32 = 0;

    for (string) |c| {
        if (c == 0 or c == 10) continue;

        if (c == '(') {
            floor += 1;
        } else {
            floor -= 1;
        }
    }
    std.debug.print("{}\n", .{floor});
}
