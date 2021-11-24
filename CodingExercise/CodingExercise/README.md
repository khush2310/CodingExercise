## Description

For this coding exercise, you must fetch data from a REST API and populate a list on screen. While the scope of this task is small, imagine your solution will be applied to a full scale application.
Please keep in mind how to order events if all events are schedule same start date, it will take rank in consideration.

Add however much flair and polish you think appropriately showcases your talents as a mobile developer. Be sure to use Swift for your solution.

Clear separation of concerns,good software architecture
Comments with:
○ Brief descriptions of the algorithm
○ Trade-offs or assumptions you made in your design 



## API Details

Example request:

```
Method: POST
Scheme: https
Path: /rest/mobile/v2/recommendations/cards 
Host: ios.vividseats.com 
Content-Type: application/json 
X-Mobile-Platform: iOS

Body:
{ 
	"startDate": "2020-05-19", \<- This should be today's date 
	"endDate": "2020-10-18”, \<- this should be some arbitrary date in the future
	"includeSuggested": true 
}
```

Example results:

```
[{
    "topLabel": "The Book Of Mormon",
    "middleLabel": "ASU Gammage - Tempe, AZ",
    "bottomLabel": "Fri, May 19 - Sun, May 28",
    "eventCount": 13,
    "image": "https://a.vsstatic.com/mobile/app/theater/book-of-mormon.jpg
    "targetId": 25373,
    "targetType": "PERFORMER",
    "entityId": 25373,
    "entityType": "PERFORMER",
    "startDate": 1495240200000,
    "rank": 270
}, {
    "topLabel": "Finding Neverland",
    "middleLabel": "Fabulous Fox Theatre - Atlanta - Atlanta, GA",
    "bottomLabel": "Fri, May 19 - Sun, May 21",
    "eventCount": 5,
    "targetId": 26058,
    "targetType": "PERFORMER",
    "entityId": 26058,
    "entityType": "PERFORMER",
    "startDate": 1495242000000,
    "rank": 230
}, {
    "topLabel": "Eric Church",
    "middleLabel": "Verizon Center - Washington, DC",
    "bottomLabel": "Fri, May 19, 8:00PM",
    "eventCount": 1,
    "image": "https://a.vsstatic.com/mobile/app/concerts/eric-church.jpg",
    "targetId": 2119461,
    "targetType": "EVENT",
    "entityId": 9420,
    "entityType": "PERFORMER",
    "startDate": 1495242000000,
    "rank": 260
}]
```

Implement API client functionality to retrieve data from this endpoint
and use it populate the provided collection view.
