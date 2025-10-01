'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "daf53f5082d2ca04bae22b020936b443",
".git/config": "68b36788fd6a9fa02d50bf87f702b185",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ed7f7cfc295b81fc82103606263b77f9",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "f76656613fce8a588fa26ed925c8871e",
".git/logs/refs/heads/gh-pages": "79be2d7cbd7333128cbe2e30187e6844",
".git/logs/refs/remotes/origin/gh-pages": "0bec1300bcee94b9ff9d29b0ae141c00",
".git/objects/01/d6b83e8bf397fea12415408a6cd603a8a17e0f": "86bcf515584f8804b0b1dae454a2548c",
".git/objects/02/5413398656d1e1fef51105f410de65a1058045": "82a5c8f8332fb4936d869f6c0508a627",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/04/6747fbb74583527441b77f7ea5809c8192b4fe": "e089e1bae8c20829a6bb3da0b9ad99da",
".git/objects/25/98c00f7f8df069ed24bad086a237062a1dd1f9": "6c9bba4be0f842a4505891198268773e",
".git/objects/2c/87f5f2b8be4d71882ff8c2c1659d6dfeb64d54": "607f7e3d7d90a9cb7409e2fc8ac120be",
".git/objects/2c/fda39a76bbaaaf586548a5372a1323d86a337c": "2224c0a5082087a5d783630ec545292c",
".git/objects/2e/6fec9a83e8c41400a44070bc657821d9c54fa5": "e42f8c305cfadce0fed2dbeecd4bbfea",
".git/objects/33/31d9290f04df89cea3fb794306a371fcca1cd9": "e54527b2478950463abbc6b22442144e",
".git/objects/35/32b443e91473f8e17bfdafc9cec8fda0fa7402": "637f2e327f4a07de5daa24a915852575",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/40/4a71e09cef6aceaa449d024b545cb47581da15": "82326a4cd162244f3f8a24e30b5326de",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/47/1f938420ee03379be2af3ab35b01011e27d5cc": "3a33c50ba1b1ea4474057b14cc270928",
".git/objects/4c/1dd4831042252e95aafa194b251bf3dcd09b82": "631c6c87cbccf8d9dae8b418047cca72",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/52/f3edc6fe8e1f230d93c5aa7b122bdf32476076": "0bf19e99bfeb3257c654182ddf079c05",
".git/objects/53/40f5620b9874f8a857283a757dd08b9b3d2fa2": "c98952ffe45f2e1d7f12b03c13fe186c",
".git/objects/56/f976ee63d237213ef79fb2561bd37e9b071139": "707b0881e3a2c63c9c2052c667b9ceb7",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/5a/13bd5a18e506d22647433b1980295ce67bcebe": "50b077c2b68b737800ac0d99a322b746",
".git/objects/5d/d6ed8de707f184041469e446b1f0b7736b58de": "bf11789a2f761d9bc2d00bad709486b6",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/64/5116c20530a7bd227658a3c51e004a3f0aefab": "f10b5403684ce7848d8165b3d1d5bbbe",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6e/94c8deaf9943f43a3e2677c19bffa0cb210f89": "5f2bd4ab641f678bbd18ba0ce81bf4fa",
".git/objects/78/cdb8921744f6868c8e8f76cca8cb97b60c32b2": "83726fb4b3b6f39f2e4d1699bc6ffc45",
".git/objects/7b/bbb51d36e8e85d909b53c28136c35cb75a5b1c": "60b4d3e27cfbfd1dbb613acd6e2b48a4",
".git/objects/7d/54580a29e25eab3fceb3185f8f986e532103b1": "790afdc282eedb4a82075efb86dfd043",
".git/objects/83/fa9785819b0b99828e71617bfb8b834c3bcec3": "24fbe11c3cae5287396372ecc1c628b5",
".git/objects/86/6dfde64411ca3b2b731402c6e7c1f52a631d94": "989bfce3972af391fb50ce91ce3d73b3",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/47558724729da80c3b9094e73b3ebe9fd9853c": "2adaeb25abefac81d54039db936bee84",
".git/objects/8d/e9ab695d9c94531f14992520018fcb5b3f0c98": "2ee3140f0c4fbaa0288d20d4b044745f",
".git/objects/8e/d62febc3bad1bc374aaaa9c30e4e5b65830c07": "0b1c076523681e80624681385fd91542",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/9c/1b0337707e99b3fc6f3d50ea48d0c3da29b362": "1c733b56644d571694e3d76499bee4d5",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/808159c2048d592cc17e0845a178526ca6283f": "e287212fc0ef73fdf43351a379ba49ce",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c2/fd3eb1bd6355d219ee50513fb848d8ab64565d": "8d6ad79ee51015e8474c85483b105584",
".git/objects/cd/59a4d54db54a7226ed4209e83885479778175f": "a965b586b69978b98dd291501121f16d",
".git/objects/d1/9516e41a0816e2e1f9da64a32d635ff3612637": "f695b4326dcd46b19c26f00404047d8e",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/e1/8003b2041d8220f7a746887cc55886f591673a": "228aeb381a3e00caf99f14d4d514a637",
".git/objects/e3/47544a638061de3ccd589a63fcce9a5d01192f": "88999c210c8a280879746306550a6f91",
".git/objects/e7/24a22ba21ec504488371bb16b84e84a4d3c823": "f61e6136fcb7561ced4b0b26c2c0e3cb",
".git/objects/e8/8ceeaa9e58150be9027143156739fd1483cb7f": "e1f69ef391fc85ba1d954ed922e05023",
".git/objects/e9/8f680e022e97e21074d5d71cbf8b70f1e591dd": "30bc95ef48a8926e9fd844bc7a92ec34",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f1/492d76454560c726e5cea5eb2716eb5688a06c": "7e619915ac7b095810a1815a9206b2df",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/fb/d983f71b24b397414b10e6df84d1946c57775c": "06cc70985bcd6b2efd37eb3525ed1d25",
".git/objects/fb/fe47fa12a37211f50e5bba9ef3e111fbcbc4cf": "e5ef8fc6194e192ad1fb53d348eb06e2",
".git/refs/heads/gh-pages": "3a9a8a4a8be50b5e6d506245227ee1f3",
".git/refs/remotes/origin/gh-pages": "3a9a8a4a8be50b5e6d506245227ee1f3",
"assets/AssetManifest.bin": "44c9e67a7ce081eef067f6300c21d735",
"assets/AssetManifest.bin.json": "438a36a161266a7ff352f7ad1058af4d",
"assets/AssetManifest.json": "c7dd9058c849e4968f841ec8a77e11cb",
"assets/assets/image.jpg": "b243f173267e9f2831d432e65a49758e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e8f886abaa56d4c12a9b6dad28a98881",
"assets/NOTICES": "bb73824acb1726ac618187fdf11cc5fd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "b396aa253598ba4391854c25203ee16c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e1015c0d76e2b48989f8ad4187570344",
"/": "e1015c0d76e2b48989f8ad4187570344",
"main.dart.js": "ebae0007a22be95fbc62188ab6cbd9d3",
"manifest.json": "3f5cc1422384871cb04bfcbe05618047",
"version.json": "753a77ab84c26f016b75729c469df551"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
