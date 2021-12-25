# MultiPage05

This project clicks through to `Page5` where an item may be clicked on.  After a 2-second delay the user is taken either to `Page6` or `Page7` depending on which index is clicked.  Clicking on items index 0 or 1 takes to `Page6` which is `stateless` and clicking on any other index takes to `Page7` which is `stateful`

On `Page7` we can do the full `CRUD` operations

- lists the item with given index chosen on `Page5`
- allows for creating a new record using all of the details on the screen, creating a new record with `id` of `101`
- allows for editing existing record
- allows for deleting existing record