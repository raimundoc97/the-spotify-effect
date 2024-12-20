*-------------------------*
*	Music paper 	      *
*-------------------------*
* Authors: Raimundo Contreras & Vedran Razmilic
* Purpose: Make initial descriptive statistics

* Load Spotify dataset
version 15.1
import delimited $path_data_spotify/spotify.csv, clear

* Let's create a backup of the original dataset
preserve

* Assuming 'artists' is the strL variable
generate str new_artists = artists
replace artists = ""
compress artists
replace artists = new_artists
drop new_artists

* Remove brackets and single quotes from the artists variable, handling strL format
replace artists = subinstr(artists, "['", " ", .)
replace artists = subinstr(artists, "']", " ", .)
replace artists = subinstr(artists, "', '", " ", .) 

* Check the first 100 observations to confirm changes
list artists in 1/100
replace artists = subinstr(artists, "', '", " ", .)


* Merge with the metadata dataset on the artist name
merge m:m artists using $path_data_spotify/artist_metadata.dta

* Save the final dataset
save [path_to_final_merged_dataset], replace

* Optionally, if you want to replace the original artists variable with the cleaned version:
drop artists
rename clean_artists artists

gegen unique_key = nunique(key), by(artist)
collapse (mean) danceability duration_ms energy instrumentalness explicit key liveness loudness mode popularity speechiness tempo valence unique_key, by(year)



cd $path_data_fig_tmp
foreach var in danceability duration_ms energy instrumentalness explicit key liveness loudness mode popularity speechiness tempo valence unique_key {
    twoway (line `var' year), title("`var' over years")
    graph save "graph_`var'.gph", replace
}

// Combine all graphs into one figure
graph combine graph_danceability.gph graph_duration_ms.gph graph_energy.gph graph_instrumentalness.gph graph_explicit.gph graph_key.gph graph_liveness.gph graph_loudness.gph graph_mode.gph graph_popularity.gph graph_speechiness.gph graph_tempo.gph graph_valence.gph graph_unique_key.gph, cols(4)
cd $path_data_fig

graph export "trajectories.pdf", as(pdf) replace
