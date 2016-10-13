const app = Application('iTunes')
const track = app.currentTrack()

if ( track !== null ) {
	'♫  ' + track.artist() + ' - ' + track.name()
}
