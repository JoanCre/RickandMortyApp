# Rick and Morty App

App that shows all the characters of the Rick and Morty series through its API https://rickandmortyapi.com.

## Functionalities

    · Clean architecture
    · List paginated characters
    · Search characters by name
    · Detail view of each character
    · Image Cache
    · Unit Test


## Libraries

### AlamofireImage

https://github.com/Alamofire/AlamofireImage

Library used for downloading images.

Using an image caching system with NSCache where it takes the URL as Key and checks if it is cached or not. If it is not cached it will download it using AlamofireImage and then cache it and if it is already cached it will pull it directly from cache.
