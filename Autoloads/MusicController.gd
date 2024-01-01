extends Node

# Load music files to variables
var main_menu_music = load("res://Music/Main Menu Song.wav")
var level1_music = load("res://Music/Level 1 Background Music.wav")
var level2_music = load("res://Music/Level 2 Background Music.wav")
var level3_music = load("res://Music/Level 3 Background Music.wav")

var game_over_music = load("res://Sound Effects/Loser.wav")
var try_again_music = load("res://Sound Effects/TryAgain.wav")

# Create unique functions for each song that are called in relevant scenes to stream and play music.
func play_main_menu_music():
	$Music.stream = main_menu_music
	$Music.play()

func play_level1_music():
	$Music.stream = level1_music
	$Music.play()
	
func play_level2_music():
	$Music.stream = level2_music
	$Music.play()
	
func play_level3_music():
	$Music.stream = level3_music
	$Music.play()
	
func play_try_again_music():
	$SoundEffects.stream = try_again_music
	$SoundEffects.play()

func play_game_over_music():
	$SoundEffects.stream = game_over_music
	$SoundEffects.play()
	
func stop_music():
	$Music.stop()


