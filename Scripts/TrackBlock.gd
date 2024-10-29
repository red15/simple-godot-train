class_name TrackBlock
extends Node

var track_sections: Array[Track]
var in_use: bool:
	get:
		for track in track_sections:
			for child in track.get_children():
				if child is Bogie:
					return true
		return false

func start(first: Track):
	track_sections.append(first)

func add_track(track: Track):
	if track.block != null:
		if track.block == self and track in track_sections:
			push_warning("Track was already in this block!")
			return
		else:
			push_warning("Track was already in another block!")
			return
	track_sections.append(track)
	track.block = self
	print_debug("Block %s now has %d sections" % [self, len(track_sections)])
