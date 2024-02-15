import Toybox.Lang;
using Toybox.WatchUi;
using Toybox.Graphics;

class PointPicker extends WatchUi.Picker {

	function initialize() {
		var factory = new PointPickerFactory();

		var title = new WatchUi.Text({
			:text => WatchUi.loadResource(Rez.Strings.how_many_point) as String,
			:locX => WatchUi.LAYOUT_HALIGN_CENTER,
			:locY => WatchUi.LAYOUT_VALIGN_BOTTOM,
			:color => Graphics.COLOR_WHITE
		});

        var default_number_of_point = Properties.getValue("maximum_points");
		if(default_number_of_point == null) {
			default_number_of_point = 0;
		}

		Picker.initialize({
			:title => title,
			:pattern => [factory],
			:defaults => [21]
		});
	}

	function onUpdate(dc) {
		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
		dc.clear();
		Picker.onUpdate(dc);
	}
}

class PointPickerDelegate extends WatchUi.PickerDelegate {

	function initialize() {
		PickerDelegate.initialize();
	}

	function onCancel() {
		InitialView.config.step--;
		//remove picker from view stack
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		return true;
	}

	function onAccept(values) {
		//update match configuration
		var value = values[0];
		InitialView.config.maximumPoints = value as Number;
		InitialView.config.step++;
		//remove picker from view stack to go back to initial view
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		return true;
	}
}
