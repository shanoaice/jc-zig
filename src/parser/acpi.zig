const std = @import("std");

const string = []u8;

const TripPoints = struct {
	id: i32,
	switches_to_mode: string,
	temperature: f64,
	temperature_unit: string
};

const Acpi = struct {
	type: string,
	id: i32,
	state: string,
	charge_precent: i32,
	until_charged: string,
	until_charged_hours: i32,
	until_charged_minutes: i32,
	until_charged_seconds: i32,
	until_charged_total_seconds: i32,
	charge_remaining: string,
	charge_remaining_hours: i32,
	charge_remaining_minutes: i32,
	charge_remaining_seconds: i32,
	charge_remaining_total_seconds: i32,
	design_capacity_mah: i32,
	last_full_capacity: i32,
	last_full_capacity_precent: i32,
	online: bool,
	mode: string,
	temperature: f64,
	temperature_unit: string,
	trip_points: []TripPoints,
	messages: []string
};
