//! this module implements a basic HashMap and functions that can
//! interact with it.
//!
//! Some functions might be copied from existing libraries
//! (sqlite, redis, zig.std?), but I'll link to them if I do.
const std = @import("std");

/// HashMap struct currently just holds a single bucket of items
/// that has a set size. There's no need to do any memory allocations
/// right now, but this should obviously have a dynamic size.
const HashMap = struct {
    items: [16]?Item,
};

// The actual item, that gets stored in the "HashMap".
// Quotes because it's not really a HashMap yet...
const Item = struct {
    key: []const u32,
    value: []const u32,
};

pub fn init() *HashMap {
    return HashMap{};
}
pub fn deinit() void {}
// pub fn set(item: Item, key: u32, value: u32) void {}
pub fn get() void {}
