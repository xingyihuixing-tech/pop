// Service Worker for PWA support
const CACHE_NAME = 'beat-player-v1';
const urlsToCache = [
  './',
  './index.html',
  './css/style.css',
  './js/main.js',
  './js/audio-processor.js',
  './js/metronome.js',
  './js/image-manager.js',
  './js/transition.js',
  './js/sync-controller.js',
  './manifest.json'
];

// 安装Service Worker
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        return cache.addAll(urlsToCache);
      })
  );
});

// 激活Service Worker
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

// 拦截请求，使用缓存
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request)
      .then((response) => {
        // 如果在缓存中找到，返回缓存版本
        if (response) {
          return response;
        }
        // 否则从网络获取
        return fetch(event.request);
      })
  );
});

