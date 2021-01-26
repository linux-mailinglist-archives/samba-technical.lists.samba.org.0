Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 217693046FD
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 19:49:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZTg58xDPALCxmsehOf6ac8ZkW+WC4Tej0+ChBIvLetw=; b=L18oMlvxa7shKxIf5boqh7vjzL
	4olLOzsL9oD19cfQl2Iz3nEzBRYUZj0bhmURb+0QtNulStAwIStCeTccQRSGEhIjxFFyk17Ek1jKF
	p401ff9tlhZm6MW18B4rYl6dvmx/prTiFAP43vMB1FzhjiMQAbVNoQ67pkh82M/8/uLpCej8+DF7N
	E+7VJL3GLpH9aHU4uNnRUlQJjAFZBNKVm6d66Wsteqs6irGVejyQQ4LBhLDakr09csoHv9sST9Bj2
	VxonpcLSnc8plIntF5U8It8ZEu3mmKof7bzFJFSR2Cld4936c1FgjKiWWSFQmFAXLiz6aC+9nz7s7
	9cVnyQtQ==;
Received: from ip6-localhost ([::1]:45228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4TNq-007HHg-HU; Tue, 26 Jan 2021 18:48:10 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13458) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l4TNl-007HHZ-12
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 18:48:07 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QI533D002583
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 13:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pp1;
 bh=ZdmLOFpmeN0W3NIdO5qx55d1+Fn9D2f8Dll1+6/ZW7s=;
 b=pQhkxmhJT0flCXmGkPgVvyQ2Z0MGml+NbbIO1j+QlT8tLB8gtBwLE8VmnEYev0yhWJAE
 XN0GFbEksWbioqEBwr5MsELExRINd8SA9mI8y6TlON6HjXE5DbIeIFF2sU7vu4zKPjpX
 r13OOMEQsKuBp3Zner9fiNM8QaspW5uUIUVAJmUaVS292ZezTSvh60gJVsyyvfXSNLq9
 gLs1eWVg1xtYSu0Zfw9OiLdI8TRYkzvZwjGeE+gQ8PqaBp/26+aWL5wih+Y4IXY1YzR8
 wzQPEGdoRlbXyPs2Ed8gJKPr1Q4q7OeGb9bhaaKtonfGjGJN+8k1ipxdwC1yr5CSFDoz KA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36amnnqd9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 13:15:51 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QIDAnk023869
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 18:15:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 36agvekds5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 18:15:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QIFnUH28901884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 18:15:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 737696A05A
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 18:15:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 493AE6A051
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 18:15:49 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.244.201])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 18:15:49 +0000 (GMT)
Received: from m01ex005-1.gmx.ibm.com (10.65.236.121) by m01ex008.gmx.ibm.com
 (10.183.153.167) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 26 Jan
 2021 13:15:48 -0500
Received: from m01ex005-1.gmx.ibm.com ([fe80::5ce2:1c72:6bd5:bfbb]) by
 m01ex005-1.gmx.ibm.com ([fe80::5ce2:1c72:6bd5:bfbb%4]) with mapi id
 15.01.2106.006; Tue, 26 Jan 2021 13:15:48 -0500
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Not sure how this slipped through
Thread-Topic: Not sure how this slipped through
Thread-Index: AQHW9A9FEfXtIm8bU0qikkxXy6pCWg==
Date: Tue, 26 Jan 2021 18:15:48 +0000
Message-ID: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [9.46.32.205]
Content-Type: multipart/mixed;
 boundary="_004_B93A6FFE2D854503BB15D2AFC270028Cibmcom_"
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: "Christopher O Cowan - Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_004_B93A6FFE2D854503BB15D2AFC270028Cibmcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TXkgYnVpbGRzIG9uIEFJWCBoYXZlIGJlZW4gZmFpbGluZyBiZWNhdXNlIG9mIHRoaXMgb2J2aW91
cyBlcnJvci4gIENhbiBzb21lb25lIHBsZWFzZSBhcHBseSBpdD8NCg0KSnVzdCB3b25kZXJpbmcs
IGFyZSBBSVggYnVpbGRzIHN0aWxsIHBhcnQgb2YgdGhlIENJL0NEIHN5c3RlbT8NCg0KUmVnYXJk
cywNCi0tDQpDaHJpcyBDb3dhbg0KDQoNCg==

--_004_B93A6FFE2D854503BB15D2AFC270028Cibmcom_
Content-Type: application/octet-stream; name="vfs_aixacl.c-return.patch"
Content-Description: vfs_aixacl.c-return.patch
Content-Disposition: attachment; filename="vfs_aixacl.c-return.patch";
	size=550; creation-date="Tue, 26 Jan 2021 18:15:47 GMT";
	modification-date="Tue, 26 Jan 2021 18:15:47 GMT"
Content-ID: <9D4E3142ADB456479B2CA210DAD70F9C@gmx.ibm.com>
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdXJjZTMvbW9kdWxlcy92ZnNfYWl4YWNsLmMgYi9zb3VyY2UzL21vZHVs
ZXMvdmZzX2FpeGFjbC5jCmluZGV4IGY3NDkzNzk0YTQ1Li5mYTY2MWZkNmY0ZiAxMDA2NDQKLS0t
IGEvc291cmNlMy9tb2R1bGVzL3Zmc19haXhhY2wuYworKysgYi9zb3VyY2UzL21vZHVsZXMvdmZz
X2FpeGFjbC5jCkBAIC0xNDksOSArMTQ5LDkgQEAgaW50IGFpeGFjbF9zeXNfYWNsX3NldF9mZCh2
ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxlLAogCQkvKgogCQkgKiBUaGlzIGlzIG5vIGxvbmdlciBh
IGhhbmRsZSBiYXNlZCBjYWxsLgogCQkgKi8KLQkJcmV0dXJuID0gY2hhY2woZnNwLT5mc3BfbmFt
ZS0+YmFzZV9uYW1lLAorCQlyZXR1cm4gKGNoYWNsKGZzcC0+ZnNwX25hbWUtPmJhc2VfbmFtZSwK
IAkJCSAgICAgICBmaWxlX2FjbCwKLQkJCSAgICAgICBmaWxlX2FjbC0+YWNsX2xlbik7CisJCQkg
ICAgICBmaWxlX2FjbC0+YWNsX2xlbikpOwogCX0KIAogCXJjID0gZmNoYWNsKGZzcF9nZXRfaW9f
ZmQoZnNwKSxmaWxlX2FjbCxmaWxlX2FjbC0+YWNsX2xlbik7Cg==

--_004_B93A6FFE2D854503BB15D2AFC270028Cibmcom_--


