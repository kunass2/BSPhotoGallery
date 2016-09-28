# BSPhotoGallery

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

BSPhotoGallery is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BSPhotoGallery"
```

If you used `use_framework` in your podfile just simply do:

```Swift
import BSPhotoGallery

```

for every file when you need to use it.

you may also use:

```Swift
@import BSPhotoGallery

```
within **bridging header** file and avoid to import framework for every needed file.

##Usage

######Simply create your gallery object using array of strings

```
let gallery = BSPhotoGallery(urls: urls).controller()
```

######or using array of images

```
let gallery = BSPhotoGallery(images: images).controller()
```

######then just present your gallery

```
present(gallery, animated: true)
```
