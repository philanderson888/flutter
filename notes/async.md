# async

## futures

see street pastors for a practical implementation of this code, which is a simulated 3-second delay in order to simulate a delayed asynchronous web call

```java
/// This implementation is just to simulate a load data behavior
/// from a data base sqlite or from a API
Future<void> _getValue() async {
await Future.delayed(const Duration(seconds: 3), () {
    setState(() {
    dateController.text = DateTime.now().toString();
    });
});
}
```