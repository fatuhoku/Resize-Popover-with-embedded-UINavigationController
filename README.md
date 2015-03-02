How to have UIPopoverController containing a UINavigationController perform animated resizing based on view controllers being pushed
------------------------------------------------------------------------------------------------------------------------------------

Normally, setting preferredContentSize on a contained view controller is
sufficient to trigger the popover's animated resize.

When using a navigation controller however, the resize animation is performed
*after* the push transition.

The trick is to make sure the navigation controller is treated as a child view controller;
we then manipulate the `preferredContentSize` of is parentViewController. We do this every
time the navigation controller is about to present a new view controller through its
delegate.

See `MESViewController.m` for more details.
