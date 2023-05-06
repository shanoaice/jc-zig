const std = @import("std");
const utils = @import("../utils.zig");

const string = utils.string;

pub const TripPoints = struct {
	id: i32,
	switches_to_mode: string,
	temperature: f64,
	temperature_unit: string
};

pub const AcpiEntry = struct {
	type: string,
	id: i32,
	state: ?string,
	charge_precent: ?i32,
	until_charged: ?string,
	until_charged_hours: ?i32,
	until_charged_minutes: ?i32,
	until_charged_seconds: ?i32,
	until_charged_total_seconds: ?i32,
	charge_remaining: ?string,
	charge_remaining_hours: ?i32,
	charge_remaining_minutes: ?i32,
	charge_remaining_seconds: ?i32,
	charge_remaining_total_seconds: ?i32,
	design_capacity_mah: ?i32,
	last_full_capacity: ?i32,
	last_full_capacity_precent: ?i32,
	@"on-line": ?bool,
	mode: ?string,
	temperature: ?f64,
	temperature_unit: ?string,
	trip_points: ?[]TripPoints,
	messages: ?[]string
};

pub fn parse(raw: string) AcpiEntry {

	var raw_entries = std.mem.split(u8, raw, "\n");

	var curr_entry: ?[]const u8 = raw_entries.first();

	while (curr_entry != null) {
		defer {
			curr_entry = raw_entries.next();
		}
		var tokens = std.mem.tokenize(u8, curr_entry.?, " ");

		const entry_type = tokens.first();
		const entry_id = std.fmt.parseInt(i32, tokens.next().?, 10);

		if (std.mem.eql(u8, entry_type, "Battery")) {
			var state = std.mem.split(u8, tokens.next().?, ",").first();
			_ = state;
			var charge_prcent = std.fmt.parseInt(i32, tokens.next().?, 10);
			_ = charge_prcent;
		}
		_ = entry_id;
	}
}
