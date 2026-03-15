//! this module implements a basic HashMap and functions that can
//! interact with it.
//!
//! It's very bare bones. The first draft is going to only have
//! a fixed size. It's not really an actual HashMap yet.
const std = @import("std");

/// this is basically the item we store in the HashMap
/// struct. It just holds an optional key and value.
///
/// Having both values optional feels kinda dumb, but I'm also
/// assigning just a null value to them when initializing
/// the HashMap struct, so it's whatever for now...
const Item = struct {
    key: ?[]const u8,
    value: ?[]const u8,
};

/// The HashMap struct currently just holds a single bucket of items
/// that has a set size. There's no need to do any memory allocations
/// right now, but this should obviously have a dynamic size later.
const HashMap = struct {
    items: [16]?Item,

    /// initializes the HashMap with an array of 16 items, with null values.
    pub fn init() HashMap {
        return HashMap{ .items = [_]?Item{null} ** 16 };
    }

    /// this currently doesn't work as it's supposed to, but I just want
    /// to set values.
    ///
    /// we take a pointer to the map, then manually add an index and then give the
    /// function two string literals as the key and value. It then replaces the
    /// Item in the HashMap in the appropriate index. Not really how a HashMap
    /// is supposed to work, but we'll get the hashing done eventually.
    pub fn set(s: *HashMap, index: u8, key: []const u8, value: []const u8) void {
        s.items[index] = Item{ .key = key, .value = value };
    }
};

test "Create HashMap and print items..." {
    var s = HashMap.init();

    HashMap.set(&s, 1, "key", "value");
    HashMap.set(&s, 4, "other", "value");

    for (0..s.items.len) |i| {
        std.debug.print("item: {any}; {any}\n", .{ i, s.items[i] });
    }
}
