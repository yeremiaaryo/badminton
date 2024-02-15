import Toybox.Lang;
using Toybox.Graphics;
using Toybox.WatchUi;

class PointPickerFactory extends WatchUi.PickerFactory {

	private const POINTS as Array<Number or Symbol> = [21, 25, 30] as Array<Number or Symbol>;
	private const POINTS_LABELS as Array<Symbol> = [Rez.Strings.point_21, Rez.Strings.point_25, Rez.Strings.point_30] as Array<Symbol>;

	function initialize() {
		PickerFactory.initialize();
	}

	function getDrawable(index, selected) {
		return new WatchUi.Text({
			:text => WatchUi.loadResource(POINTS_LABELS[index]) as String,
			:color => Graphics.COLOR_WHITE,
			:font=> Graphics.FONT_SMALL,
			:locX => WatchUi.LAYOUT_HALIGN_CENTER,
			:locY=> WatchUi.LAYOUT_VALIGN_CENTER
		});
	}

	function getValue(index) {
		return POINTS[index];
	}

	function getSize() {
		return POINTS.size();
	}
}
