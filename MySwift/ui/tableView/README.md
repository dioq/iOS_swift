# TableView 相关

## cell

//选中后背景颜色无变化
cell.selectionStyle = .none

//右边选中 状态的标记
cell?.accessoryType = .checkmark 

//自定 选中后的颜色
let view = UIView()
view.backgroundColor = UIColor.red
cell.selectedBackgroundView = view

//取消 选中
[tableView deselectRowAtIndexPath:indexPath animated:NO];

//cell分割线 左边不留空隙
cell.separatorInset = UIEdgeInsets.zero
cell.layoutMargins = UIEdgeInsets.zero
cell.preservesSuperviewLayoutMargins = false


//取到某个cell
let indexPath = IndexPath.init(row: indexPath.row - 1, section: indexPath.section)  //初始化一个IndexPath
let cell = tableView.cellForRow(at: indexPath)

## tableView

//全部刷新 cell
tableView.reloadData()

//局部刷新 cell
let indexPath = IndexPath.init(row: 0, section: 2)
tableView.reloadRows(at: [indexPath], with:.fade)

//刷新所有可见的 cell
tableview.beginUpdates()
tableview.reloadRows(at: tableview.indexPathsForVisibleRows!, with: .none)
tableview.endUpdates()
