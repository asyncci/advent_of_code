const std = @import("std");
const fs = std.fs;

pub fn main() !void {
    var buffer: [100001]u8 = undefined;
    const string: []u8 = try fs.cwd().readFile("data/2015/day2/data.txt", &buffer);

    var token = std.mem.tokenizeAny(u8, string, "x\n");
    var i: u8 = 2;
    var totalSum: u32 = 0;
    var arr: [3]u32 = undefined;
    var second: u32 = 0;
    while (token.next()) |word| : (i -= 1) {
        var numb = try std.fmt.parseInt(u32, word, 10);
        std.debug.print("{} ", .{numb});
        arr[i] = numb;

        if (i == 0) {
            var sum = 2 * arr[0] * arr[1] + 2 * arr[1] * arr[2] + 2 * arr[2] * arr[0];
            var min = @min(@min(arr[0] * arr[1], arr[1] * arr[2]), arr[2] * arr[0]);
            std.debug.print("= {} \n", .{sum + min});
            totalSum += sum + min;
            second += arr[0] * arr[1] * arr[2];
            var min_2 = @min(@min(arr[0], arr[1]), arr[2]);
            var middle = @max(@min(arr[0], arr[1]), @min(@max(arr[0], arr[1]), arr[2]));
            std.debug.print("{}\n", .{middle});
            var perimeter = min_2 * 2 + middle * 2;
            second += perimeter;
            i = 3;
            sum = 0;
            min = 0;
        }
    }
    std.debug.print("{}\n", .{second});
}
