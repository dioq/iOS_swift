import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "Button-Highlighted" asset catalog image resource.
    static let buttonHighlighted = ImageResource(name: "Button-Highlighted", bundle: resourceBundle)

    /// The "Button-Normal" asset catalog image resource.
    static let buttonNormal = ImageResource(name: "Button-Normal", bundle: resourceBundle)

    /// The "arrow" asset catalog image resource.
    static let arrow = ImageResource(name: "arrow", bundle: resourceBundle)

    /// The "arrow_down" asset catalog image resource.
    static let arrowDown = ImageResource(name: "arrow_down", bundle: resourceBundle)

    /// The "arrow_up" asset catalog image resource.
    static let arrowUp = ImageResource(name: "arrow_up", bundle: resourceBundle)

    /// The "com_arrow_vc_back" asset catalog image resource.
    static let comArrowVcBack = ImageResource(name: "com_arrow_vc_back", bundle: resourceBundle)

    /// The "contact" asset catalog image resource.
    static let contact = ImageResource(name: "contact", bundle: resourceBundle)

    /// The "head" asset catalog image resource.
    static let head = ImageResource(name: "head", bundle: resourceBundle)

    /// The "hg_image_not_selected" asset catalog image resource.
    static let hgImageNotSelected = ImageResource(name: "hg_image_not_selected", bundle: resourceBundle)

    /// The "hg_image_selected" asset catalog image resource.
    static let hgImageSelected = ImageResource(name: "hg_image_selected", bundle: resourceBundle)

    /// The "iw_nilPic" asset catalog image resource.
    static let iwNilPic = ImageResource(name: "iw_nilPic", bundle: resourceBundle)

    /// The "iw_selected" asset catalog image resource.
    static let iwSelected = ImageResource(name: "iw_selected", bundle: resourceBundle)

    /// The "iw_unselected" asset catalog image resource.
    static let iwUnselected = ImageResource(name: "iw_unselected", bundle: resourceBundle)

    /// The "mainImage_cn" asset catalog image resource.
    static let mainImageCn = ImageResource(name: "mainImage_cn", bundle: resourceBundle)

    /// The "mainImage_en" asset catalog image resource.
    static let mainImageEn = ImageResource(name: "mainImage_en", bundle: resourceBundle)

    /// The "mainImage_tr" asset catalog image resource.
    static let mainImageTr = ImageResource(name: "mainImage_tr", bundle: resourceBundle)

    /// The "more icon" asset catalog image resource.
    static let moreIcon = ImageResource(name: "more icon", bundle: resourceBundle)

    /// The "mqz_nav_add" asset catalog image resource.
    static let mqzNavAdd = ImageResource(name: "mqz_nav_add", bundle: resourceBundle)

    /// The "pageControlCurrentDot" asset catalog image resource.
    static let pageControlCurrentDot = ImageResource(name: "pageControlCurrentDot", bundle: resourceBundle)

    /// The "pageControlDot" asset catalog image resource.
    static let pageControlDot = ImageResource(name: "pageControlDot", bundle: resourceBundle)

    /// The "right_menu_QR" asset catalog image resource.
    static let rightMenuQR = ImageResource(name: "right_menu_QR", bundle: resourceBundle)

    /// The "right_menu_QR_white" asset catalog image resource.
    static let rightMenuQRWhite = ImageResource(name: "right_menu_QR_white", bundle: resourceBundle)

    /// The "right_menu_addFri" asset catalog image resource.
    static let rightMenuAddFri = ImageResource(name: "right_menu_addFri", bundle: resourceBundle)

    /// The "right_menu_addFri_white" asset catalog image resource.
    static let rightMenuAddFriWhite = ImageResource(name: "right_menu_addFri_white", bundle: resourceBundle)

    /// The "right_menu_facetoface" asset catalog image resource.
    static let rightMenuFacetoface = ImageResource(name: "right_menu_facetoface", bundle: resourceBundle)

    /// The "right_menu_facetoface_white" asset catalog image resource.
    static let rightMenuFacetofaceWhite = ImageResource(name: "right_menu_facetoface_white", bundle: resourceBundle)

    /// The "right_menu_multichat" asset catalog image resource.
    static let rightMenuMultichat = ImageResource(name: "right_menu_multichat", bundle: resourceBundle)

    /// The "right_menu_multichat_white" asset catalog image resource.
    static let rightMenuMultichatWhite = ImageResource(name: "right_menu_multichat_white", bundle: resourceBundle)

    /// The "right_menu_payMoney" asset catalog image resource.
    static let rightMenuPayMoney = ImageResource(name: "right_menu_payMoney", bundle: resourceBundle)

    /// The "right_menu_payMoney_white" asset catalog image resource.
    static let rightMenuPayMoneyWhite = ImageResource(name: "right_menu_payMoney_white", bundle: resourceBundle)

    /// The "right_menu_sendvideo" asset catalog image resource.
    static let rightMenuSendvideo = ImageResource(name: "right_menu_sendvideo", bundle: resourceBundle)

    /// The "right_menu_sendvideo_white" asset catalog image resource.
    static let rightMenuSendvideoWhite = ImageResource(name: "right_menu_sendvideo_white", bundle: resourceBundle)

    /// The "selected_off" asset catalog image resource.
    static let selectedOff = ImageResource(name: "selected_off", bundle: resourceBundle)

    /// The "selected_on" asset catalog image resource.
    static let selectedOn = ImageResource(name: "selected_on", bundle: resourceBundle)

    /// The "tab_c2c_00" asset catalog image resource.
    static let tabC2C00 = ImageResource(name: "tab_c2c_00", bundle: resourceBundle)

    /// The "tab_c2c_01" asset catalog image resource.
    static let tabC2C01 = ImageResource(name: "tab_c2c_01", bundle: resourceBundle)

    /// The "tab_c2c_02" asset catalog image resource.
    static let tabC2C02 = ImageResource(name: "tab_c2c_02", bundle: resourceBundle)

    /// The "tab_c2c_03" asset catalog image resource.
    static let tabC2C03 = ImageResource(name: "tab_c2c_03", bundle: resourceBundle)

    /// The "tab_c2c_04" asset catalog image resource.
    static let tabC2C04 = ImageResource(name: "tab_c2c_04", bundle: resourceBundle)

    /// The "tab_c2c_05" asset catalog image resource.
    static let tabC2C05 = ImageResource(name: "tab_c2c_05", bundle: resourceBundle)

    /// The "tab_c2c_06" asset catalog image resource.
    static let tabC2C06 = ImageResource(name: "tab_c2c_06", bundle: resourceBundle)

    /// The "tab_c2c_07" asset catalog image resource.
    static let tabC2C07 = ImageResource(name: "tab_c2c_07", bundle: resourceBundle)

    /// The "tab_c2c_08" asset catalog image resource.
    static let tabC2C08 = ImageResource(name: "tab_c2c_08", bundle: resourceBundle)

    /// The "tab_c2c_09" asset catalog image resource.
    static let tabC2C09 = ImageResource(name: "tab_c2c_09", bundle: resourceBundle)

    /// The "tab_c2c_10" asset catalog image resource.
    static let tabC2C10 = ImageResource(name: "tab_c2c_10", bundle: resourceBundle)

    /// The "tab_c2c_11" asset catalog image resource.
    static let tabC2C11 = ImageResource(name: "tab_c2c_11", bundle: resourceBundle)

    /// The "tab_c2c_12" asset catalog image resource.
    static let tabC2C12 = ImageResource(name: "tab_c2c_12", bundle: resourceBundle)

    /// The "tab_c2c_13" asset catalog image resource.
    static let tabC2C13 = ImageResource(name: "tab_c2c_13", bundle: resourceBundle)

    /// The "tab_c2c_14" asset catalog image resource.
    static let tabC2C14 = ImageResource(name: "tab_c2c_14", bundle: resourceBundle)

    /// The "tab_c2c_15" asset catalog image resource.
    static let tabC2C15 = ImageResource(name: "tab_c2c_15", bundle: resourceBundle)

    /// The "tab_c2c_16" asset catalog image resource.
    static let tabC2C16 = ImageResource(name: "tab_c2c_16", bundle: resourceBundle)

    /// The "tab_c2c_17" asset catalog image resource.
    static let tabC2C17 = ImageResource(name: "tab_c2c_17", bundle: resourceBundle)

    /// The "tab_c2c_18" asset catalog image resource.
    static let tabC2C18 = ImageResource(name: "tab_c2c_18", bundle: resourceBundle)

    /// The "tab_c2c_19" asset catalog image resource.
    static let tabC2C19 = ImageResource(name: "tab_c2c_19", bundle: resourceBundle)

    /// The "tab_c2c_20" asset catalog image resource.
    static let tabC2C20 = ImageResource(name: "tab_c2c_20", bundle: resourceBundle)

    /// The "tab_c2c_21" asset catalog image resource.
    static let tabC2C21 = ImageResource(name: "tab_c2c_21", bundle: resourceBundle)

    /// The "tab_c2c_22" asset catalog image resource.
    static let tabC2C22 = ImageResource(name: "tab_c2c_22", bundle: resourceBundle)

    /// The "tab_c2c_23" asset catalog image resource.
    static let tabC2C23 = ImageResource(name: "tab_c2c_23", bundle: resourceBundle)

    /// The "tab_c2c_24" asset catalog image resource.
    static let tabC2C24 = ImageResource(name: "tab_c2c_24", bundle: resourceBundle)

    /// The "tab_c2c_25" asset catalog image resource.
    static let tabC2C25 = ImageResource(name: "tab_c2c_25", bundle: resourceBundle)

    /// The "tab_c2c_26" asset catalog image resource.
    static let tabC2C26 = ImageResource(name: "tab_c2c_26", bundle: resourceBundle)

    /// The "tab_c2c_27" asset catalog image resource.
    static let tabC2C27 = ImageResource(name: "tab_c2c_27", bundle: resourceBundle)

    /// The "tab_c2c_28" asset catalog image resource.
    static let tabC2C28 = ImageResource(name: "tab_c2c_28", bundle: resourceBundle)

    /// The "tab_c2c_29" asset catalog image resource.
    static let tabC2C29 = ImageResource(name: "tab_c2c_29", bundle: resourceBundle)

    /// The "tab_c2c_30" asset catalog image resource.
    static let tabC2C30 = ImageResource(name: "tab_c2c_30", bundle: resourceBundle)

    /// The "tab_c2c_31" asset catalog image resource.
    static let tabC2C31 = ImageResource(name: "tab_c2c_31", bundle: resourceBundle)

    /// The "tab_c2c_32" asset catalog image resource.
    static let tabC2C32 = ImageResource(name: "tab_c2c_32", bundle: resourceBundle)

    /// The "tab_c2c_33" asset catalog image resource.
    static let tabC2C33 = ImageResource(name: "tab_c2c_33", bundle: resourceBundle)

    /// The "tab_c2c_34" asset catalog image resource.
    static let tabC2C34 = ImageResource(name: "tab_c2c_34", bundle: resourceBundle)

    /// The "tab_c2c_35" asset catalog image resource.
    static let tabC2C35 = ImageResource(name: "tab_c2c_35", bundle: resourceBundle)

    /// The "tab_c2c_36" asset catalog image resource.
    static let tabC2C36 = ImageResource(name: "tab_c2c_36", bundle: resourceBundle)

    /// The "tab_c2c_37" asset catalog image resource.
    static let tabC2C37 = ImageResource(name: "tab_c2c_37", bundle: resourceBundle)

    /// The "tab_c2c_38" asset catalog image resource.
    static let tabC2C38 = ImageResource(name: "tab_c2c_38", bundle: resourceBundle)

    /// The "tab_c2c_39" asset catalog image resource.
    static let tabC2C39 = ImageResource(name: "tab_c2c_39", bundle: resourceBundle)

    /// The "tab_c2c_40" asset catalog image resource.
    static let tabC2C40 = ImageResource(name: "tab_c2c_40", bundle: resourceBundle)

    /// The "tab_c2c_41" asset catalog image resource.
    static let tabC2C41 = ImageResource(name: "tab_c2c_41", bundle: resourceBundle)

    /// The "tab_c2c_42" asset catalog image resource.
    static let tabC2C42 = ImageResource(name: "tab_c2c_42", bundle: resourceBundle)

    /// The "tab_c2c_43" asset catalog image resource.
    static let tabC2C43 = ImageResource(name: "tab_c2c_43", bundle: resourceBundle)

    /// The "tab_c2c_44" asset catalog image resource.
    static let tabC2C44 = ImageResource(name: "tab_c2c_44", bundle: resourceBundle)

    /// The "tab_c2c_45" asset catalog image resource.
    static let tabC2C45 = ImageResource(name: "tab_c2c_45", bundle: resourceBundle)

    /// The "tab_c2c_46" asset catalog image resource.
    static let tabC2C46 = ImageResource(name: "tab_c2c_46", bundle: resourceBundle)

    /// The "tab_c2c_47" asset catalog image resource.
    static let tabC2C47 = ImageResource(name: "tab_c2c_47", bundle: resourceBundle)

    /// The "tab_c2c_48" asset catalog image resource.
    static let tabC2C48 = ImageResource(name: "tab_c2c_48", bundle: resourceBundle)

    /// The "tab_c2c_49" asset catalog image resource.
    static let tabC2C49 = ImageResource(name: "tab_c2c_49", bundle: resourceBundle)

    /// The "tab_c2c_50" asset catalog image resource.
    static let tabC2C50 = ImageResource(name: "tab_c2c_50", bundle: resourceBundle)

    /// The "tab_c2c_normal" asset catalog image resource.
    static let tabC2CNormal = ImageResource(name: "tab_c2c_normal", bundle: resourceBundle)

    /// The "tab_home_00" asset catalog image resource.
    static let tabHome00 = ImageResource(name: "tab_home_00", bundle: resourceBundle)

    /// The "tab_home_01" asset catalog image resource.
    static let tabHome01 = ImageResource(name: "tab_home_01", bundle: resourceBundle)

    /// The "tab_home_02" asset catalog image resource.
    static let tabHome02 = ImageResource(name: "tab_home_02", bundle: resourceBundle)

    /// The "tab_home_03" asset catalog image resource.
    static let tabHome03 = ImageResource(name: "tab_home_03", bundle: resourceBundle)

    /// The "tab_home_04" asset catalog image resource.
    static let tabHome04 = ImageResource(name: "tab_home_04", bundle: resourceBundle)

    /// The "tab_home_05" asset catalog image resource.
    static let tabHome05 = ImageResource(name: "tab_home_05", bundle: resourceBundle)

    /// The "tab_home_06" asset catalog image resource.
    static let tabHome06 = ImageResource(name: "tab_home_06", bundle: resourceBundle)

    /// The "tab_home_07" asset catalog image resource.
    static let tabHome07 = ImageResource(name: "tab_home_07", bundle: resourceBundle)

    /// The "tab_home_08" asset catalog image resource.
    static let tabHome08 = ImageResource(name: "tab_home_08", bundle: resourceBundle)

    /// The "tab_home_09" asset catalog image resource.
    static let tabHome09 = ImageResource(name: "tab_home_09", bundle: resourceBundle)

    /// The "tab_home_10" asset catalog image resource.
    static let tabHome10 = ImageResource(name: "tab_home_10", bundle: resourceBundle)

    /// The "tab_home_11" asset catalog image resource.
    static let tabHome11 = ImageResource(name: "tab_home_11", bundle: resourceBundle)

    /// The "tab_home_12" asset catalog image resource.
    static let tabHome12 = ImageResource(name: "tab_home_12", bundle: resourceBundle)

    /// The "tab_home_13" asset catalog image resource.
    static let tabHome13 = ImageResource(name: "tab_home_13", bundle: resourceBundle)

    /// The "tab_home_14" asset catalog image resource.
    static let tabHome14 = ImageResource(name: "tab_home_14", bundle: resourceBundle)

    /// The "tab_home_15" asset catalog image resource.
    static let tabHome15 = ImageResource(name: "tab_home_15", bundle: resourceBundle)

    /// The "tab_home_16" asset catalog image resource.
    static let tabHome16 = ImageResource(name: "tab_home_16", bundle: resourceBundle)

    /// The "tab_home_17" asset catalog image resource.
    static let tabHome17 = ImageResource(name: "tab_home_17", bundle: resourceBundle)

    /// The "tab_home_18" asset catalog image resource.
    static let tabHome18 = ImageResource(name: "tab_home_18", bundle: resourceBundle)

    /// The "tab_home_19" asset catalog image resource.
    static let tabHome19 = ImageResource(name: "tab_home_19", bundle: resourceBundle)

    /// The "tab_home_20" asset catalog image resource.
    static let tabHome20 = ImageResource(name: "tab_home_20", bundle: resourceBundle)

    /// The "tab_home_21" asset catalog image resource.
    static let tabHome21 = ImageResource(name: "tab_home_21", bundle: resourceBundle)

    /// The "tab_home_22" asset catalog image resource.
    static let tabHome22 = ImageResource(name: "tab_home_22", bundle: resourceBundle)

    /// The "tab_home_23" asset catalog image resource.
    static let tabHome23 = ImageResource(name: "tab_home_23", bundle: resourceBundle)

    /// The "tab_home_24" asset catalog image resource.
    static let tabHome24 = ImageResource(name: "tab_home_24", bundle: resourceBundle)

    /// The "tab_home_25" asset catalog image resource.
    static let tabHome25 = ImageResource(name: "tab_home_25", bundle: resourceBundle)

    /// The "tab_home_26" asset catalog image resource.
    static let tabHome26 = ImageResource(name: "tab_home_26", bundle: resourceBundle)

    /// The "tab_home_27" asset catalog image resource.
    static let tabHome27 = ImageResource(name: "tab_home_27", bundle: resourceBundle)

    /// The "tab_home_28" asset catalog image resource.
    static let tabHome28 = ImageResource(name: "tab_home_28", bundle: resourceBundle)

    /// The "tab_home_29" asset catalog image resource.
    static let tabHome29 = ImageResource(name: "tab_home_29", bundle: resourceBundle)

    /// The "tab_home_30" asset catalog image resource.
    static let tabHome30 = ImageResource(name: "tab_home_30", bundle: resourceBundle)

    /// The "tab_home_31" asset catalog image resource.
    static let tabHome31 = ImageResource(name: "tab_home_31", bundle: resourceBundle)

    /// The "tab_home_32" asset catalog image resource.
    static let tabHome32 = ImageResource(name: "tab_home_32", bundle: resourceBundle)

    /// The "tab_home_33" asset catalog image resource.
    static let tabHome33 = ImageResource(name: "tab_home_33", bundle: resourceBundle)

    /// The "tab_home_34" asset catalog image resource.
    static let tabHome34 = ImageResource(name: "tab_home_34", bundle: resourceBundle)

    /// The "tab_home_35" asset catalog image resource.
    static let tabHome35 = ImageResource(name: "tab_home_35", bundle: resourceBundle)

    /// The "tab_home_36" asset catalog image resource.
    static let tabHome36 = ImageResource(name: "tab_home_36", bundle: resourceBundle)

    /// The "tab_home_37" asset catalog image resource.
    static let tabHome37 = ImageResource(name: "tab_home_37", bundle: resourceBundle)

    /// The "tab_home_38" asset catalog image resource.
    static let tabHome38 = ImageResource(name: "tab_home_38", bundle: resourceBundle)

    /// The "tab_home_39" asset catalog image resource.
    static let tabHome39 = ImageResource(name: "tab_home_39", bundle: resourceBundle)

    /// The "tab_home_40" asset catalog image resource.
    static let tabHome40 = ImageResource(name: "tab_home_40", bundle: resourceBundle)

    /// The "tab_home_41" asset catalog image resource.
    static let tabHome41 = ImageResource(name: "tab_home_41", bundle: resourceBundle)

    /// The "tab_home_42" asset catalog image resource.
    static let tabHome42 = ImageResource(name: "tab_home_42", bundle: resourceBundle)

    /// The "tab_home_43" asset catalog image resource.
    static let tabHome43 = ImageResource(name: "tab_home_43", bundle: resourceBundle)

    /// The "tab_home_44" asset catalog image resource.
    static let tabHome44 = ImageResource(name: "tab_home_44", bundle: resourceBundle)

    /// The "tab_home_45" asset catalog image resource.
    static let tabHome45 = ImageResource(name: "tab_home_45", bundle: resourceBundle)

    /// The "tab_home_46" asset catalog image resource.
    static let tabHome46 = ImageResource(name: "tab_home_46", bundle: resourceBundle)

    /// The "tab_home_47" asset catalog image resource.
    static let tabHome47 = ImageResource(name: "tab_home_47", bundle: resourceBundle)

    /// The "tab_home_48" asset catalog image resource.
    static let tabHome48 = ImageResource(name: "tab_home_48", bundle: resourceBundle)

    /// The "tab_home_49" asset catalog image resource.
    static let tabHome49 = ImageResource(name: "tab_home_49", bundle: resourceBundle)

    /// The "tab_home_50" asset catalog image resource.
    static let tabHome50 = ImageResource(name: "tab_home_50", bundle: resourceBundle)

    /// The "tab_home_normal" asset catalog image resource.
    static let tabHomeNormal = ImageResource(name: "tab_home_normal", bundle: resourceBundle)

    /// The "tab_mine_00" asset catalog image resource.
    static let tabMine00 = ImageResource(name: "tab_mine_00", bundle: resourceBundle)

    /// The "tab_mine_01" asset catalog image resource.
    static let tabMine01 = ImageResource(name: "tab_mine_01", bundle: resourceBundle)

    /// The "tab_mine_02" asset catalog image resource.
    static let tabMine02 = ImageResource(name: "tab_mine_02", bundle: resourceBundle)

    /// The "tab_mine_03" asset catalog image resource.
    static let tabMine03 = ImageResource(name: "tab_mine_03", bundle: resourceBundle)

    /// The "tab_mine_04" asset catalog image resource.
    static let tabMine04 = ImageResource(name: "tab_mine_04", bundle: resourceBundle)

    /// The "tab_mine_05" asset catalog image resource.
    static let tabMine05 = ImageResource(name: "tab_mine_05", bundle: resourceBundle)

    /// The "tab_mine_06" asset catalog image resource.
    static let tabMine06 = ImageResource(name: "tab_mine_06", bundle: resourceBundle)

    /// The "tab_mine_07" asset catalog image resource.
    static let tabMine07 = ImageResource(name: "tab_mine_07", bundle: resourceBundle)

    /// The "tab_mine_08" asset catalog image resource.
    static let tabMine08 = ImageResource(name: "tab_mine_08", bundle: resourceBundle)

    /// The "tab_mine_09" asset catalog image resource.
    static let tabMine09 = ImageResource(name: "tab_mine_09", bundle: resourceBundle)

    /// The "tab_mine_10" asset catalog image resource.
    static let tabMine10 = ImageResource(name: "tab_mine_10", bundle: resourceBundle)

    /// The "tab_mine_11" asset catalog image resource.
    static let tabMine11 = ImageResource(name: "tab_mine_11", bundle: resourceBundle)

    /// The "tab_mine_12" asset catalog image resource.
    static let tabMine12 = ImageResource(name: "tab_mine_12", bundle: resourceBundle)

    /// The "tab_mine_13" asset catalog image resource.
    static let tabMine13 = ImageResource(name: "tab_mine_13", bundle: resourceBundle)

    /// The "tab_mine_14" asset catalog image resource.
    static let tabMine14 = ImageResource(name: "tab_mine_14", bundle: resourceBundle)

    /// The "tab_mine_15" asset catalog image resource.
    static let tabMine15 = ImageResource(name: "tab_mine_15", bundle: resourceBundle)

    /// The "tab_mine_16" asset catalog image resource.
    static let tabMine16 = ImageResource(name: "tab_mine_16", bundle: resourceBundle)

    /// The "tab_mine_17" asset catalog image resource.
    static let tabMine17 = ImageResource(name: "tab_mine_17", bundle: resourceBundle)

    /// The "tab_mine_18" asset catalog image resource.
    static let tabMine18 = ImageResource(name: "tab_mine_18", bundle: resourceBundle)

    /// The "tab_mine_19" asset catalog image resource.
    static let tabMine19 = ImageResource(name: "tab_mine_19", bundle: resourceBundle)

    /// The "tab_mine_20" asset catalog image resource.
    static let tabMine20 = ImageResource(name: "tab_mine_20", bundle: resourceBundle)

    /// The "tab_mine_21" asset catalog image resource.
    static let tabMine21 = ImageResource(name: "tab_mine_21", bundle: resourceBundle)

    /// The "tab_mine_22" asset catalog image resource.
    static let tabMine22 = ImageResource(name: "tab_mine_22", bundle: resourceBundle)

    /// The "tab_mine_23" asset catalog image resource.
    static let tabMine23 = ImageResource(name: "tab_mine_23", bundle: resourceBundle)

    /// The "tab_mine_24" asset catalog image resource.
    static let tabMine24 = ImageResource(name: "tab_mine_24", bundle: resourceBundle)

    /// The "tab_mine_25" asset catalog image resource.
    static let tabMine25 = ImageResource(name: "tab_mine_25", bundle: resourceBundle)

    /// The "tab_mine_26" asset catalog image resource.
    static let tabMine26 = ImageResource(name: "tab_mine_26", bundle: resourceBundle)

    /// The "tab_mine_27" asset catalog image resource.
    static let tabMine27 = ImageResource(name: "tab_mine_27", bundle: resourceBundle)

    /// The "tab_mine_28" asset catalog image resource.
    static let tabMine28 = ImageResource(name: "tab_mine_28", bundle: resourceBundle)

    /// The "tab_mine_29" asset catalog image resource.
    static let tabMine29 = ImageResource(name: "tab_mine_29", bundle: resourceBundle)

    /// The "tab_mine_30" asset catalog image resource.
    static let tabMine30 = ImageResource(name: "tab_mine_30", bundle: resourceBundle)

    /// The "tab_mine_31" asset catalog image resource.
    static let tabMine31 = ImageResource(name: "tab_mine_31", bundle: resourceBundle)

    /// The "tab_mine_32" asset catalog image resource.
    static let tabMine32 = ImageResource(name: "tab_mine_32", bundle: resourceBundle)

    /// The "tab_mine_33" asset catalog image resource.
    static let tabMine33 = ImageResource(name: "tab_mine_33", bundle: resourceBundle)

    /// The "tab_mine_34" asset catalog image resource.
    static let tabMine34 = ImageResource(name: "tab_mine_34", bundle: resourceBundle)

    /// The "tab_mine_35" asset catalog image resource.
    static let tabMine35 = ImageResource(name: "tab_mine_35", bundle: resourceBundle)

    /// The "tab_mine_36" asset catalog image resource.
    static let tabMine36 = ImageResource(name: "tab_mine_36", bundle: resourceBundle)

    /// The "tab_mine_37" asset catalog image resource.
    static let tabMine37 = ImageResource(name: "tab_mine_37", bundle: resourceBundle)

    /// The "tab_mine_38" asset catalog image resource.
    static let tabMine38 = ImageResource(name: "tab_mine_38", bundle: resourceBundle)

    /// The "tab_mine_39" asset catalog image resource.
    static let tabMine39 = ImageResource(name: "tab_mine_39", bundle: resourceBundle)

    /// The "tab_mine_40" asset catalog image resource.
    static let tabMine40 = ImageResource(name: "tab_mine_40", bundle: resourceBundle)

    /// The "tab_mine_41" asset catalog image resource.
    static let tabMine41 = ImageResource(name: "tab_mine_41", bundle: resourceBundle)

    /// The "tab_mine_42" asset catalog image resource.
    static let tabMine42 = ImageResource(name: "tab_mine_42", bundle: resourceBundle)

    /// The "tab_mine_43" asset catalog image resource.
    static let tabMine43 = ImageResource(name: "tab_mine_43", bundle: resourceBundle)

    /// The "tab_mine_44" asset catalog image resource.
    static let tabMine44 = ImageResource(name: "tab_mine_44", bundle: resourceBundle)

    /// The "tab_mine_45" asset catalog image resource.
    static let tabMine45 = ImageResource(name: "tab_mine_45", bundle: resourceBundle)

    /// The "tab_mine_46" asset catalog image resource.
    static let tabMine46 = ImageResource(name: "tab_mine_46", bundle: resourceBundle)

    /// The "tab_mine_47" asset catalog image resource.
    static let tabMine47 = ImageResource(name: "tab_mine_47", bundle: resourceBundle)

    /// The "tab_mine_48" asset catalog image resource.
    static let tabMine48 = ImageResource(name: "tab_mine_48", bundle: resourceBundle)

    /// The "tab_mine_49" asset catalog image resource.
    static let tabMine49 = ImageResource(name: "tab_mine_49", bundle: resourceBundle)

    /// The "tab_mine_50" asset catalog image resource.
    static let tabMine50 = ImageResource(name: "tab_mine_50", bundle: resourceBundle)

    /// The "tab_mine_normal" asset catalog image resource.
    static let tabMineNormal = ImageResource(name: "tab_mine_normal", bundle: resourceBundle)

    /// The "tab_team_00" asset catalog image resource.
    static let tabTeam00 = ImageResource(name: "tab_team_00", bundle: resourceBundle)

    /// The "tab_team_01" asset catalog image resource.
    static let tabTeam01 = ImageResource(name: "tab_team_01", bundle: resourceBundle)

    /// The "tab_team_02" asset catalog image resource.
    static let tabTeam02 = ImageResource(name: "tab_team_02", bundle: resourceBundle)

    /// The "tab_team_03" asset catalog image resource.
    static let tabTeam03 = ImageResource(name: "tab_team_03", bundle: resourceBundle)

    /// The "tab_team_04" asset catalog image resource.
    static let tabTeam04 = ImageResource(name: "tab_team_04", bundle: resourceBundle)

    /// The "tab_team_05" asset catalog image resource.
    static let tabTeam05 = ImageResource(name: "tab_team_05", bundle: resourceBundle)

    /// The "tab_team_06" asset catalog image resource.
    static let tabTeam06 = ImageResource(name: "tab_team_06", bundle: resourceBundle)

    /// The "tab_team_07" asset catalog image resource.
    static let tabTeam07 = ImageResource(name: "tab_team_07", bundle: resourceBundle)

    /// The "tab_team_08" asset catalog image resource.
    static let tabTeam08 = ImageResource(name: "tab_team_08", bundle: resourceBundle)

    /// The "tab_team_09" asset catalog image resource.
    static let tabTeam09 = ImageResource(name: "tab_team_09", bundle: resourceBundle)

    /// The "tab_team_10" asset catalog image resource.
    static let tabTeam10 = ImageResource(name: "tab_team_10", bundle: resourceBundle)

    /// The "tab_team_11" asset catalog image resource.
    static let tabTeam11 = ImageResource(name: "tab_team_11", bundle: resourceBundle)

    /// The "tab_team_12" asset catalog image resource.
    static let tabTeam12 = ImageResource(name: "tab_team_12", bundle: resourceBundle)

    /// The "tab_team_13" asset catalog image resource.
    static let tabTeam13 = ImageResource(name: "tab_team_13", bundle: resourceBundle)

    /// The "tab_team_14" asset catalog image resource.
    static let tabTeam14 = ImageResource(name: "tab_team_14", bundle: resourceBundle)

    /// The "tab_team_15" asset catalog image resource.
    static let tabTeam15 = ImageResource(name: "tab_team_15", bundle: resourceBundle)

    /// The "tab_team_16" asset catalog image resource.
    static let tabTeam16 = ImageResource(name: "tab_team_16", bundle: resourceBundle)

    /// The "tab_team_17" asset catalog image resource.
    static let tabTeam17 = ImageResource(name: "tab_team_17", bundle: resourceBundle)

    /// The "tab_team_18" asset catalog image resource.
    static let tabTeam18 = ImageResource(name: "tab_team_18", bundle: resourceBundle)

    /// The "tab_team_19" asset catalog image resource.
    static let tabTeam19 = ImageResource(name: "tab_team_19", bundle: resourceBundle)

    /// The "tab_team_20" asset catalog image resource.
    static let tabTeam20 = ImageResource(name: "tab_team_20", bundle: resourceBundle)

    /// The "tab_team_21" asset catalog image resource.
    static let tabTeam21 = ImageResource(name: "tab_team_21", bundle: resourceBundle)

    /// The "tab_team_22" asset catalog image resource.
    static let tabTeam22 = ImageResource(name: "tab_team_22", bundle: resourceBundle)

    /// The "tab_team_23" asset catalog image resource.
    static let tabTeam23 = ImageResource(name: "tab_team_23", bundle: resourceBundle)

    /// The "tab_team_24" asset catalog image resource.
    static let tabTeam24 = ImageResource(name: "tab_team_24", bundle: resourceBundle)

    /// The "tab_team_25" asset catalog image resource.
    static let tabTeam25 = ImageResource(name: "tab_team_25", bundle: resourceBundle)

    /// The "tab_team_26" asset catalog image resource.
    static let tabTeam26 = ImageResource(name: "tab_team_26", bundle: resourceBundle)

    /// The "tab_team_27" asset catalog image resource.
    static let tabTeam27 = ImageResource(name: "tab_team_27", bundle: resourceBundle)

    /// The "tab_team_28" asset catalog image resource.
    static let tabTeam28 = ImageResource(name: "tab_team_28", bundle: resourceBundle)

    /// The "tab_team_29" asset catalog image resource.
    static let tabTeam29 = ImageResource(name: "tab_team_29", bundle: resourceBundle)

    /// The "tab_team_30" asset catalog image resource.
    static let tabTeam30 = ImageResource(name: "tab_team_30", bundle: resourceBundle)

    /// The "tab_team_31" asset catalog image resource.
    static let tabTeam31 = ImageResource(name: "tab_team_31", bundle: resourceBundle)

    /// The "tab_team_32" asset catalog image resource.
    static let tabTeam32 = ImageResource(name: "tab_team_32", bundle: resourceBundle)

    /// The "tab_team_33" asset catalog image resource.
    static let tabTeam33 = ImageResource(name: "tab_team_33", bundle: resourceBundle)

    /// The "tab_team_34" asset catalog image resource.
    static let tabTeam34 = ImageResource(name: "tab_team_34", bundle: resourceBundle)

    /// The "tab_team_35" asset catalog image resource.
    static let tabTeam35 = ImageResource(name: "tab_team_35", bundle: resourceBundle)

    /// The "tab_team_36" asset catalog image resource.
    static let tabTeam36 = ImageResource(name: "tab_team_36", bundle: resourceBundle)

    /// The "tab_team_37" asset catalog image resource.
    static let tabTeam37 = ImageResource(name: "tab_team_37", bundle: resourceBundle)

    /// The "tab_team_38" asset catalog image resource.
    static let tabTeam38 = ImageResource(name: "tab_team_38", bundle: resourceBundle)

    /// The "tab_team_39" asset catalog image resource.
    static let tabTeam39 = ImageResource(name: "tab_team_39", bundle: resourceBundle)

    /// The "tab_team_40" asset catalog image resource.
    static let tabTeam40 = ImageResource(name: "tab_team_40", bundle: resourceBundle)

    /// The "tab_team_41" asset catalog image resource.
    static let tabTeam41 = ImageResource(name: "tab_team_41", bundle: resourceBundle)

    /// The "tab_team_42" asset catalog image resource.
    static let tabTeam42 = ImageResource(name: "tab_team_42", bundle: resourceBundle)

    /// The "tab_team_43" asset catalog image resource.
    static let tabTeam43 = ImageResource(name: "tab_team_43", bundle: resourceBundle)

    /// The "tab_team_44" asset catalog image resource.
    static let tabTeam44 = ImageResource(name: "tab_team_44", bundle: resourceBundle)

    /// The "tab_team_45" asset catalog image resource.
    static let tabTeam45 = ImageResource(name: "tab_team_45", bundle: resourceBundle)

    /// The "tab_team_46" asset catalog image resource.
    static let tabTeam46 = ImageResource(name: "tab_team_46", bundle: resourceBundle)

    /// The "tab_team_47" asset catalog image resource.
    static let tabTeam47 = ImageResource(name: "tab_team_47", bundle: resourceBundle)

    /// The "tab_team_48" asset catalog image resource.
    static let tabTeam48 = ImageResource(name: "tab_team_48", bundle: resourceBundle)

    /// The "tab_team_49" asset catalog image resource.
    static let tabTeam49 = ImageResource(name: "tab_team_49", bundle: resourceBundle)

    /// The "tab_team_50" asset catalog image resource.
    static let tabTeam50 = ImageResource(name: "tab_team_50", bundle: resourceBundle)

    /// The "tab_team_normal" asset catalog image resource.
    static let tabTeamNormal = ImageResource(name: "tab_team_normal", bundle: resourceBundle)

    /// The "weichat" asset catalog image resource.
    static let weichat = ImageResource(name: "weichat", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif