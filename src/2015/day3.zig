const std = @import("std");
const fs = std.fs;

const Position = struct {
    x: i32,
    y: i32,
};

pub fn main() !void {
    var buffer: [100001]u8 = undefined;
    const str: []u8 = try fs.cwd().readFile("data/2015/day3/data.txt", &buffer);

    const string = std.mem.trim(u8, str, "\n");

    var map = std.AutoHashMap(Position, u32).init(std.heap.page_allocator);
    defer map.deinit();

    var x: i32 = 0;
    var y: i32 = 0;

    var x1: i32 = 0;
    var y1: i32 = 0;

    try map.put(Position{ .x = 0, .y = 0 }, 2);

    for (string, 0..) |element, step| {
        var tempX: *i32 = undefined;
        var tempY: *i32 = undefined;

        if (@mod(step, 2) == 0) {
            tempX = &x;
            tempY = &y;
        } else {
            tempX = &x1;
            tempY = &y1;
        }

        tempX.* += switch (element) {
            '^' => 1,
            'v' => -1,
            else => 0,
        };
        tempY.* += switch (element) {
            '<' => -1,
            '>' => 1,
            else => 0,
        };

        std.debug.print("{}\n", .{step + 1});
        std.debug.print("first : x.{} y.{}\n", .{ x, y });
        std.debug.print("second : x.{} y.{}\n", .{ x1, y1 });

        var val = try map.getOrPut(Position{ .x = tempX.*, .y = tempY.* });
        val.value_ptr.* = if (val.found_existing) val.value_ptr.* + 1 else 1;
    }

    std.debug.print("result: {}\n", .{map.count()});
}

fn name() (fn (i32) i32) {
    return struct {
        fn namse() i32 {}
    }.namse;
}
