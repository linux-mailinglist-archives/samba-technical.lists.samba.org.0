Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE0A28E49
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 02:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NT9LP8imZYqiIRwLw2X+anwJ1JM/wm0vlD6nDKI7X6o=; b=HYtI33pj31ZFaCX49imClZjMRG
	s+PCHwT2e56pHqJM/ILRcLe/FBQyKsu742umoimWSrwkNU4tojTFl2U8QDfFdjVVyjq6hZ8hW2NB8
	Xlk5PVSIX+Snn6MQh9EyaeXrBhAdaqY6kB/wLiryXa2qvYh+HaVB2WKqMHIP9AAXXZuljNNUBmg2R
	JQyzDvQwUXTSACkRVZY5ohzID/bru1OPLap31YkfgW2XYDUmbHL6PlB3TYgrULUba+NksGRjzvpah
	St/wciKHmhpdpAqicPUKjrCV/8wA1E0hwgMp5JUkz4HpUPvHmjsoD0gJsfDnRzT/1aw104prEPZ8B
	fjKsjpIA==;
Received: from localhost ([::1]:29516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTxv5-001Vz8-El; Fri, 24 May 2019 00:18:47 +0000
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:47392) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTxv0-001Vz1-W8
 for samba-technical@lists.samba.org; Fri, 24 May 2019 00:18:45 +0000
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4O05K0Q029539; Thu, 23 May 2019 17:18:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=NT9LP8imZYqiIRwLw2X+anwJ1JM/wm0vlD6nDKI7X6o=;
 b=0RnRWbFEuUMlKYXI6WFBjkrAm2x3WwlHuJb8dV1oSTNNkFqTBp0GnSVGrHsiZdbQkfxn
 Ov0PGpOb5ZA56nIUQhYgM8+6DH9C8csG16raCJFdce08L56qltmm0JfiH82Sqxv59iiV
 sgjy4F2THlSMCfEXkbjvcBdlcogU125x+xQTRC48kRuzCkrKK7saVGeaPIajvr+AjGvh
 7SkEMBGooiZjwm9INZjgDdODvCiv7xwhw7Dn5Dd4urpe3FIcc+pqO3aIxIMOlHqNzOHl
 9xzTuOYQF0eNc8NO7qEj4Mgc3LQG+1qAuCPrnZ0dFCO217gcZRTjqONBWdjIsc+e3Fh4 3A== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
 by mx0b-002c1b01.pphosted.com with ESMTP id 2snc47af61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2019 17:18:38 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3675.namprd02.prod.outlook.com (52.132.177.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 00:18:36 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1%5]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 00:18:36 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Topic: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Index: AQHVDe0Ppb3GodJEUkiYbq337KQOmKZ5bIyA//+OswA=
Date: Fri, 24 May 2019 00:18:36 +0000
Message-ID: <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
In-Reply-To: <20190524000405.GJ244578@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b37e080c-6d84-4520-ddbc-08d6dfdd5d67
x-ms-traffictypediagnostic: MW2PR02MB3675:
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OBAV6oYen34HuJ0jzNj2jWYyeUNg5qqOgVSPLB71NliVmfddp0InDfXIIOeuR/3U32dsHaxIyCFCbs6SHcyUSus2yEbsONn+DCoGht7hVEraMs5PsuECacaQJEEqD5DX1ymmWWWJj+MmC/CfgLDxm2cJVDsTIHUu+2jNpxm2jw2OEM5745ZgEu9rpnVC6Ky48AiiPlMKXlelepIfU+iKZrkZ58FJlXHuigY4Ab8kD2Pn1TUp5v4r/lTCW5EaYbBfpEgOCju7xppSPsm9wRnvV7w/JZ2aAvFfHjcFsKsnGIv5KXwI19m7xjQlo8QRrOCGenU4QBf+501L3isEN9aYN483UrSGQu2Aou3HRSyhSjnxAThQXb0Zk7WQ7r3AOjVwKXb4dUosMyiX7qIdYz62nuuv8DBHxC/0COVA2QXOY6M=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6712DF7E6E808747AC5457F7281F067F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37e080c-6d84-4520-ddbc-08d6dfdd5d67
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shyam.rathi@nutanix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3675
X-Proofpoint-Spam-Reason: safe
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Shyam Rathi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Rathi <shyam.rathi@nutanix.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmtzIGZvciB0aGUgcmV2aWV3IEplcmVteS4gUmVzcG9uc2VzIGlubGluZSBiZWxvdy4NCg0K
DQpSZWdhcmRzLA0KLVNoeWFtDQoNCkZyb206IEplcmVteSBBbGxpc29uIDxqcmFAc2FtYmEub3Jn
Pg0KUmVwbHktVG86IEplcmVteSBBbGxpc29uIDxqcmFAc2FtYmEub3JnPg0KRGF0ZTogVGh1cnNk
YXksIE1heSAyMywgMjAxOSBhdCA1OjA0IFBNDQpUbzogU2h5YW0gUmF0aGkgPHNoeWFtLnJhdGhp
QG51dGFuaXguY29tPg0KQ2M6ICJzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnIiA8c2Ft
YmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHMzOm5v
dGlmeWQ6IEhhbmRsZSBzaWd1cCBpbiBub3RpZnlkIHRvIHJlcGFyc2Ugc21iLmNvbmYNCg0KT24g
U3VuLCBNYXkgMTksIDIwMTkgYXQgMDI6NDY6MjlBTSArMDAwMCwgU2h5YW0gUmF0aGkgdmlhIHNh
bWJhLXRlY2huaWNhbCB3cm90ZToNCkhlbGxvLA0KQXQgcHJlc2VudCwgU0lHSFVQIGlzIGJsb2Nr
ZWQgb24gbm90aWZ5ZC4gU28sIGlmIHBhcmVudCBzbWJkDQppcyBzdGFydGVkIHdpdGggImxvZyBs
ZXZlbCIgMTAgaW4gc21iLmNvbmYsIGFuZCBsYXRlciBjaGFuZ2VkDQp0byAwLCB0aGUgU0lHSFVQ
IHdpbGwgbm90IGNoYW5nZSB0aGUgbG9nIGxldmVsIHRvIDAgaW4gbm90aWZ5DQpzbWJkIHByb2Nl
c3MgYW5kIGl0IHdpbGwga2VlcCBwcmludGluZyB2ZXJib3NlIGxvZ3MgaW4gdGhlDQpjb3JyZXNw
b25kaW5nIGxvZyBmaWxlcy4NClByb3Bvc2VkIGZpeCBpcyB0byB3cml0ZSBhIFNJR0hVUCBoYW5k
bGVyIGZvciBub3RpZnlkIGFuZCBzZXQNCml0IHRvIHJlbG9hZCBzZXJ2aWNlcy4NClBsZWFzZSBy
ZXZpZXcgdGhlIGF0dGFjaGVkIHBhdGNoIGZvciBzdWdnZXN0aW9ucyBhbmQgY29tbWVudHMuDQoN
CkhpIFNoeWFtc3VuZGVyLA0KDQpBIGZldyBjb21tZW50cy4NCg0KSW4gbm90aWZ5ZF9zaWdfaHVw
X2hhbmRsZXIoKS4NCg0KK8KgwqDCoMKgwqDCoCBERUJVRygyLCgibm90aWZ5ZDogUmVsb2FkaW5n
IHNlcnZpY2VzIGFmdGVyIFNJR0hVUFxuIikpOw0KDQoJXl5eXg0KCVBsZWFzZSB1c2UgZWl0aGVy
IHRoZSBEQkdfV0FSTklORyBvciBEQkdfTk9USUNFIG1hY3Jvcw0KCXRvIGVuc3VyZSBjb25zaXN0
ZW5jeSBpbiBuZXcgZGVidWcgaW5mbyBsZXZlbHMuDQoNCgkJLS0tLSBJJ2xsIG1ha2UgdGhlIGNo
YW5nZS4NCg0KK8KgwqDCoMKgwqDCoCBiZWNvbWVfcm9vdCgpOw0KK8KgwqDCoMKgwqDCoCByZWxv
YWRfc2VydmljZXMoTlVMTCwgTlVMTCwgZmFsc2UpOw0KK8KgwqDCoMKgwqDCoCB1bmJlY29tZV9y
b290KCk7DQoNCgleXl5eXl5eDQoNCkRvZXMgbm90aWZ5ZCBuZWVkIGJlY29tZV9yb290KCkvdW5i
ZWNvbWVfcm9vdCgpDQpwYWlycyA/IElzbid0IGl0IGFsd2F5cyBpbnZva2VkIHdoZW4gc21iZCBp
cyByb290DQphbmQgc3RheXMgYXMgc3VjaCA/DQoNCgkJLS0tLSBUaGUgc2lnaHVwIGhhbmRsZXIg
Zm9yIHBhcmVudCBzbWJkIGNhbGxzDQoJCQkiY2hhbmdlX3RvX3Jvb3RfdXNlcigpIiBiZWZvcmUg
Y2FsbGluZw0KCQkJcmVsb2FkX3NlcnZpY2VzKCkuIEZvciBtYW55IG90aGVyIGJpbmFyaWVzLA0K
CQkJZWl0aGVyIHJlbG9hZF9zZXJ2aWNlcygpIG9yICh1biliZWNvbWVfcm9vdA0KCQkJaXMgY2Fs
bGVkIGZpcnN0LiBJIG1haW5seSBrZXB0IHRoZSBzYW1lDQoJCQliZWhhdmlvci4gSSdtIG5vdCBm
dWxseSBzdXJlIGFib3V0IGl0cyBwdXJwb3NlDQoJCQlhdCB0aGlzIHBsYWNlLg0KDQpUaGUgcmVz
dCBvZiB0aGlzIGxvb2tzIGZpbmUgISBUaGFua3MgYSAqbG90Kg0KZm9yIHlvdXIgaGVscC4NCg0K
SmVyZW15Lg0KDQoNCg==

