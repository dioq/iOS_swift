//
//  NativeNetworkVC.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/29.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class NativeNetworkVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func get_func(_ sender: UIButton) {
        let urlStr = "http://103.100.211.187:8848/getTest"
        DioNetwork.shareManager().doGet(urlStr: urlStr) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func post_func(_ sender: UIButton) {
        let urlStr = "http://www.anant.club:8848/getPost"
        var param_dict = Dictionary<String,Any>()
        param_dict["username"] = "Dio"
        param_dict["password"] = "1231313"
        param_dict["argot"] = "You are geat!"
        param_dict["num"] = 1999
        
        let param = DioNetwork.shareManager().dictToJsonStr(dict: param_dict)
        DioNetwork.shareManager().doPost(urlStr: urlStr, params: param) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func formdata_func(_ sender: UIButton) {
        let urlStr = "http://www.anant.club:8848/testFormdata"
        var param_dict = Dictionary<String,Any>()
        param_dict["username"] = "Dio"
        param_dict["area"] = "guiyang"
        param_dict["age"] = 20
        param_dict["action"] = "testaction"
        
        let param = DioNetwork.shareManager().dictToFormdataStr(dict: param_dict)
        DioNetwork.shareManager().submitFormdata(urlStr: urlStr, params: param) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func uploadImage_func(_ sender: UIButton) {
        let urlStr = "http://103.100.211.187:8848/upload"
        let image:UIImage = UIImage.init(named: "pingtaoge")!
        DioNetwork.shareManager().uploadImage(urlStr: urlStr, image: image, withName: "file", fileName: "0001") { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func uploadBinary_func(_ sender: UIButton) {
        let urlStr = "https://upload.gmugmu.com/api/v1/base/resource/image/upload?source_info=eyJhcHBpZCI6IjI2MDAwMyIsInVpZCI6IjMyNDk3MjMyIiwicGFnZSI6ImNvbS5lb21jaGF0Lm1vZHVsZS5ob21lLkhvbWVQYWdlQWN0aXZpdHkiLCJ0aW1lIjoiMTYwNjI0Mjc3MDA5NiJ9&cc=TG73257&dev_name=nubia&oaid=&cpu=[Adreno_(TM)_630][ARMv7_639_placeholder]&lc=37427d9d8660d3f7&osversion=android_22&sid=02Yok7jQeFpBTR+Uz1tDaONajE3oi6XdrdqPwUyM/joBe9tJRE6grYwCweYmrwWh&ndid=&conn=wifi&ram=3650129920&msid=363635333236303436313030303634&icc=89860081133720371180&statistics=9ad290c3317d39cc8be58b98f74c86e7&mtid=e6352e4b164246b8b0be20f9c36f5abe&atid=302e30&tourist=&ongd=302e30&mtxid=00812dc6db02&evid=3535303335643264616635632d343464382d626465332d373262342d3034366638353761&cv=GM4.6.30_Android&proto=&logid=2006201,2001902,2002202,201802,202101,204005,204401,2005402,2006102,2001701,2003301,2005601,2005502,2001501,2005202,204301,2001802,2005801,2003502,2004701,2000802,201007,2001602,2004901,2002101,2003802,2005902,204101,2006001,2004801,2001202&ua=nubiaNX629J&uid=32497232&vv=202010141815&meid=363834373537373230363631353638&smid=&aid=b35517406764bf51"
        let image:UIImage = UIImage.init(named: "pingtaoge")!
        DioNetwork.shareManager().uploadBinary(urlStr: urlStr, binaryFile: image) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
}
