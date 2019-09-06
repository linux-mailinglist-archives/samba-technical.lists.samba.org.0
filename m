Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63DAB099
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 04:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3yDVHMtPwnaYLn5Ddgq78RvmNaf/kV0m5TAESd1ZtDo=; b=BD4PeqLRnCVRK0GSfH1Sm8H3gO
	AyNB59BFcNjHKDa2opHi8A5R+S1hlWwwuMGjeLeWVKFuHPx/yHDZiOLnFnf+J+hoPzRXsjISOdGmZ
	qP16mhKlAnUhxjH8hvzEZbq7E4xg07nmMvkcYlxEZbjULJEide9j9igINPuBpI4FLk3/lCRCYtZ2R
	9Ed3XwYRtEBhV+y3MPrmHxHW9/FQHg79+/IuDoS2b9lc+Zmjstux9LJ1NWeAD8GQ8axnziN8cBQbM
	YO3Ms67lu0+QXPKgHLjuqVga40wJKlUqDHLYrxjW5lvrq4saiW3TBVDLMKLcETsmDmjkt11TgdiB1
	7OV+p9Bg==;
Received: from localhost ([::1]:32172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i63rJ-003qgR-He; Fri, 06 Sep 2019 02:20:21 +0000
Received: from mailout4.samsung.com ([203.254.224.34]:62752) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i63r9-003qgK-ND
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 02:20:18 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190906020152epoutp04f6c14a1f6a0b3c6782ca5b6e873c061b~BtvXvdem60409704097epoutp04I
 for <samba-technical@lists.samba.org>; Fri,  6 Sep 2019 02:01:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190906020152epoutp04f6c14a1f6a0b3c6782ca5b6e873c061b~BtvXvdem60409704097epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1567735312;
 bh=3yDVHMtPwnaYLn5Ddgq78RvmNaf/kV0m5TAESd1ZtDo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=AFxlqDpLVpRQ1qxPyjG4hxKmkwTTWlFR7HXE5IDGfQ6aOEvujvUit8XSJfTMRhPEV
 y5luTuKiC/4axnRAlXjWVMIjtXMQUiLUWmuAHr8f0pw1a+afn4kO8Wn6sW2ApY7ew+
 aeLcj48ZWbev/VPqzv5D/ZgVszBpfqDQisCoQgYw=
Received: from epsnrtp6.localdomain (unknown [182.195.42.167]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190906020152epcas1p231a0176e6841a7cc1b23fb97cb8e13b1~BtvXglAy_0348903489epcas1p2w;
 Fri,  6 Sep 2019 02:01:52 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.162]) by
 epsnrtp6.localdomain (Postfix) with ESMTP id 46Pglz6Pn6zMqYkc; Fri,  6 Sep
 2019 02:01:51 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 2D.90.04085.F0EB17D5; Fri,  6 Sep 2019 11:01:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd~BtvWXra4F1052510525epcas1p4V;
 Fri,  6 Sep 2019 02:01:51 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190906020151epsmtrp1af4c14112e7df2d52f8924132c38daf9~BtvWXFPsf3233932339epsmtrp1d;
 Fri,  6 Sep 2019 02:01:51 +0000 (GMT)
X-AuditID: b6c32a39-d03ff70000000ff5-96-5d71be0f701e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 52.35.03638.F0EB17D5; Fri,  6 Sep 2019 11:01:51 +0900 (KST)
Received: from DONAMJAEJEO06 (unknown [10.88.104.63]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190906020151epsmtip111e31335c0e6c87d9cdc399f2afe37f4~BtvWRdYPO0523805238epsmtip1G;
 Fri,  6 Sep 2019 02:01:51 +0000 (GMT)
To: <samba-technical@lists.samba.org>
Subject: samba performance difference between old and the latest ?
Date: Fri, 6 Sep 2019 11:01:51 +0900
Message-ID: <006701d56457$0c77fc60$2567f520$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdVkUSkhfQkGNaYhS6Gdf6Wv3rqMcQ==
Content-Language: ko
X-CMS-MailID: 20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: sergey.senozhatsky@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I found something strange during measuring performance with samba these days.
I checked the performance of samba 4.7.6 and 4.10.6. 
There seems to be about 20% performance difference between the two versions.

Test environment
 1. use iozone and dd utils
 2. share is tmpfs
 3. smb client is kernel cifs client
 4. oplock disable, oplock = no
 4. command : ./iozone -s1g -r4 -e -i 0 -t 1 -b 24m.xls -+u

with samba 4.7.6
	Children see throughput for  1 initial writers 	=   11248.48 kB/sec
	Parent sees throughput for  1 initial writers 	=   11248.28 kB/sec
	Min throughput per process 			=   11248.48 kB/sec 
	Max throughput per process 			=   11248.48 kB/sec
	Avg throughput per process 			=   11248.48 kB/sec
	Min xfer 					= 1048576.00 kB
	CPU Utilization: Wall time   93.219    CPU time   29.517    CPU
utilization  

with samba 4.10.6 
Children see throughput for  1 initial writers 	=    9018.82 kB/sec
	Parent sees throughput for  1 initial writers 	=    9018.70 kB/sec
	Min throughput per process 			=    9018.82 kB/sec 
	Max throughput per process 			=    9018.82 kB/sec
	Avg throughput per process 			=    9018.82 kB/sec
	Min xfer 					= 1048576.00 kB
	CPU Utilization: Wall time  116.265    CPU time   33.182    CPU
utilization  


================================================================================
========
dd test result is same with iozone result. 

samba 4.7.6 : 11.6MB/s
samba 4.10.6 : 9.5MB/s

with samba 4.7.6 :
root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt bs=4096
count=1024
1024+0 records in
1024+0 records out
4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.360991 s, 11.6 MB/s

with samba 4.10.6 :
root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt bs=4096
count=1024
1024+0 records in
1024+0 records out
4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.442567 s, 9.5 MB/s

Am I missing something? or real issue ?

Thanks!


