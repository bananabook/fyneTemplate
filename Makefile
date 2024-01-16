l:
	go run template

L:
	go build -o build/ template

a: A
	adb install build/template.apk

A:
	ANDROID_NDK_HOME=<path to your ndk> fyne package -os android -name template -appID com.example.clock -icon icon.png
	mv template.apk build

W:
	sudo fyne-cross windows -app-id app.id -icon "icon.png"
	sudo chown $(whoami): fyne-cross -R
	rm build/fyne-cross -rf
	mv fyne-cross build

b: L A W

i:
	rm -f go.mod
	go mod init template
	go mod tidy
