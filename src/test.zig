const std = @import("std");

const Route = struct {
    x: u32,

    pub fn get() Route {
        return .{
            .x = 10,
        };
    }
};

pub const routes = [_]Route{
    Route.get(),
    Route.get(),
};

test "test" {
    std.debug.print("\n{any}\n", .{routes});
}
