**How do I animate the resizing of UIPopoverController containing a UINavigationController based on the sizes of the view controllers being pushed?**

Normally, setting `preferredContentSize` on a view controller you want to
present with a `UIPopoverController` is enough to trigger the popover's
animated resize.

However when presenting a `UINavigationController` in a popover, setting
`preferredContentSize` causes the resize animation to be performed *after* the
push transition (see
[kylesluder/PopoverSizing](https://github.com/kylesluder/PopoverSizing)).

The solution is to use [view controller
containment](http://www.objc.io/issue-1/containment-view-controller.html) wrap
the `UINavigationController` in a containing `UIViewController` (i.e. make
UINavigationController), which we then manipulate the `preferredContentSize`
of. We can make sure this is done every time a view controller is pushed by
supplying a delegate to the navigation controller.

See `MESViewController.m` for more details.
