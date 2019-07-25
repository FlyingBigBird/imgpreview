# imgpreview
图片预览、横竖屏切换

注意要先修改itemSize再修改collectionView的布局，避免出现：
  the item height must be less than the height of the UICollectionView minus the section insets top and bottom values,
  minus the content insets top and bottom values.

另外
  Make a symbolic breakpoint at UICollectionViewFlowLayoutBreakForInvalidSizes to catch this in the debugger.
  需要在全局断点中添加 UICollectionViewFlowLayoutBreakForInvalidSizes 
  并添加action：  po [[UIWindow keyWindow] _autolayoutTrace]
  追溯layout.
