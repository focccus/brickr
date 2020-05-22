'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "250a61389003a0cc4744789826005b37",
"assets/FontManifest.json": "5302e675fbcf65407ba2cd881da1ba04",
"assets/fonts/Lato-Black.ttf": "1233fdf19c04333c7f58af4eb8698452",
"assets/fonts/Lato-BlackItalic.ttf": "e0d428e2113a119814da366401ad3362",
"assets/fonts/Lato-Bold.ttf": "eb9532033c2adf99b1314611b5e9cd0e",
"assets/fonts/Lato-BoldItalic.ttf": "01577cc25f44d5cd3451a5e0da715917",
"assets/fonts/Lato-Hairline.ttf": "a2e8f8eef2ec2047a32e2d6a152a0311",
"assets/fonts/Lato-HairlineItalic.ttf": "2bbb788763716d2d716cfcb5bc3e92f1",
"assets/fonts/Lato-Heavy.ttf": "093466c99afdd5e38cfe3062dbcbba6b",
"assets/fonts/Lato-HeavyItalic.ttf": "bafcb4e83847db36fa96602c4abca98d",
"assets/fonts/Lato-Italic.ttf": "e0867c8fb91d45453b9d3a578b66dca8",
"assets/fonts/Lato-Light.ttf": "90e1d3559ac52f7f0f77a86e1bfd632d",
"assets/fonts/Lato-LightItalic.ttf": "7e9668b13f86893fb0a4a6e35965c107",
"assets/fonts/Lato-Medium.ttf": "863b7dcd5ec2c3923122af25ce0f7e4c",
"assets/fonts/Lato-MediumItalic.ttf": "ba4dbd0809f13b78b621a042efaed7d5",
"assets/fonts/Lato-Regular.ttf": "3b9b99039cc0a98dd50c3cbfac57ccb2",
"assets/fonts/Lato-Semibold.ttf": "3c6cfb1aebd888a0eb4c8fba94140fa6",
"assets/fonts/Lato-SemiboldItalic.ttf": "c969278938eaacc998eab23bce2a1d0c",
"assets/fonts/Lato-Thin.ttf": "eb1635403cd764912ca1e0af78735797",
"assets/fonts/Lato-ThinItalic.ttf": "29f53f3450c6691e4195d082647aa8ca",
"assets/fonts/LiquidIcons.ttf": "231c34dd27bba6b43abe0f66b9dcd5a0",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "3636b4a3028a716a5172e302f6b1988d",
"assets/packages/fluix/fonts/Lato-Black.ttf": "1233fdf19c04333c7f58af4eb8698452",
"assets/packages/fluix/fonts/Lato-BlackItalic.ttf": "e0d428e2113a119814da366401ad3362",
"assets/packages/fluix/fonts/Lato-Bold.ttf": "eb9532033c2adf99b1314611b5e9cd0e",
"assets/packages/fluix/fonts/Lato-BoldItalic.ttf": "01577cc25f44d5cd3451a5e0da715917",
"assets/packages/fluix/fonts/Lato-Hairline.ttf": "a2e8f8eef2ec2047a32e2d6a152a0311",
"assets/packages/fluix/fonts/Lato-HairlineItalic.ttf": "2bbb788763716d2d716cfcb5bc3e92f1",
"assets/packages/fluix/fonts/Lato-Heavy.ttf": "093466c99afdd5e38cfe3062dbcbba6b",
"assets/packages/fluix/fonts/Lato-HeavyItalic.ttf": "bafcb4e83847db36fa96602c4abca98d",
"assets/packages/fluix/fonts/Lato-Italic.ttf": "e0867c8fb91d45453b9d3a578b66dca8",
"assets/packages/fluix/fonts/Lato-Light.ttf": "90e1d3559ac52f7f0f77a86e1bfd632d",
"assets/packages/fluix/fonts/Lato-LightItalic.ttf": "7e9668b13f86893fb0a4a6e35965c107",
"assets/packages/fluix/fonts/Lato-Medium.ttf": "863b7dcd5ec2c3923122af25ce0f7e4c",
"assets/packages/fluix/fonts/Lato-MediumItalic.ttf": "ba4dbd0809f13b78b621a042efaed7d5",
"assets/packages/fluix/fonts/Lato-Regular.ttf": "3b9b99039cc0a98dd50c3cbfac57ccb2",
"assets/packages/fluix/fonts/Lato-Semibold.ttf": "3c6cfb1aebd888a0eb4c8fba94140fa6",
"assets/packages/fluix/fonts/Lato-SemiboldItalic.ttf": "c969278938eaacc998eab23bce2a1d0c",
"assets/packages/fluix/fonts/Lato-Thin.ttf": "eb1635403cd764912ca1e0af78735797",
"assets/packages/fluix/fonts/Lato-ThinItalic.ttf": "29f53f3450c6691e4195d082647aa8ca",
"assets/packages/fluix/fonts/LiquidIcons.ttf": "231c34dd27bba6b43abe0f66b9dcd5a0",
"favicon.png": "d0e448f298699e5be51c25b8817420e4",
"icons/Icon-192.png": "5f01e78190812bec8d5028cac6462eb8",
"icons/Icon-512.png": "a848085081d522502b8cd9a33f283f15",
"index.html": "42a23f636f083d549a7a1d2b35d29334",
"/": "42a23f636f083d549a7a1d2b35d29334",
"main.dart.js": "56689e9a9ff4e561d51c0bea0a7280a0",
"manifest.json": "4308c465410048feb55e2772388062d2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"/",
"index.html",
"assets/LICENSE",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(CORE);
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

