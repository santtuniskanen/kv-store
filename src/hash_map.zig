//! this module implements a basic HashMap and functions that can
//! interact with it.
//!
//! It's very bare bones. The first draft is going to only have
//! a fixed size. It's not really an actual HashMap yet.
const std = @import("std");

/// The HashMap struct currently just holds a single bucket of items
/// that has a set size. There's no need to do any memory allocations
/// right now, but this should obviously have a dynamic size later.
const HashMap = struct {
    items: [16]?Item,

    /// initializes the HashMap with an array of 16 items, with null values.
    pub fn init() HashMap {
        return HashMap{ .items = [_]?Item{null} ** 16 };
    }
};

/// this is basically the item we store in the HashMap
/// struct. It just holds an optional key and value.
///
/// Having both values optional feels kinda dumb, but I'm also
/// assigning just a null value to them when initializing
/// the HashMap struct, so it's whatever for now...
const Item = struct {
    key: ?[]const u32,
    value: ?[]const u32,
};

test "Create HashMap and print items..." {
    const s = HashMap.init();

    for (0..s.items.len) |i| {
        std.debug.print("item: {any}; {any}\n", .{ i, s.items[i] });
    }
}
