Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E84752D2081
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 03:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tsW8EVtIfJEsVRay2ffReeyRIpwFCJkqFcVGHliTOCQ=; b=SqLqHFap0cm2CIn6JLIeKbuIDb
	vbluaU9UyZBgXvhZ4xz0eDfnp/SKiIkys4SD5oBDTfWa0RIzvThpJe0wgGvsmeTErHEffdlY6S/yV
	gzMPBDoo63KOtSIF0zDDTy6RZA4kNEy22K+wYc3tp+znRb7P6Kx9ne0cUZOdhsoQBUcaV3M9nKtXN
	74gvenYsiZde7Q8Vl6vIljEkI53N9EWAXeM06m3R+LauQh1s/dKDe26H15S2QzHFXWrJAebQoVFe+
	PUUGtDVXwqSdBw3ITyBI0z2oF7pkWRwjc1+rDygNLPs9+Pjaz3sxVZv0QuqA0DM9DkEPwSonxryBG
	r6W0XMRQ==;
Received: from ip6-localhost ([::1]:64994 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmSTR-0009Da-Uw; Tue, 08 Dec 2020 02:11:30 +0000
Received: from mailout3.samsung.com ([203.254.224.33]:19235) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kmSTJ-0009DR-GX
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 02:11:27 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201208015430epoutp03e9f2706d48f0c3f2e98d37e1e53342c6~Omu97ksTu1161811618epoutp03S
 for <samba-technical@lists.samba.org>; Tue,  8 Dec 2020 01:54:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201208015430epoutp03e9f2706d48f0c3f2e98d37e1e53342c6~Omu97ksTu1161811618epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607392470;
 bh=tsW8EVtIfJEsVRay2ffReeyRIpwFCJkqFcVGHliTOCQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=kF71QTmKyQ1i20yFVK1VPGNHydiKC7whNb66fWKRikIIXELy05ig0/Ve6jRXeJEYi
 UOqJ0yIcgS7eiWIexSGyR10Z23WUiXbSSV2uY0omIZ6chQthO4DYnbi7MXDwkYYdO1
 fsPxDYwAr4uo/DwvKeZskuMsDEDkX5XDHw04vt+s=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201208015430epcas1p4c2bce057c788df529a7ec880a68532f6~Omu9nn6cS1080010800epcas1p4b;
 Tue,  8 Dec 2020 01:54:30 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.160]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Cqjsd11CfzMqYkn; Tue,  8 Dec
 2020 01:54:29 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 D2.D2.10463.3DCDECF5; Tue,  8 Dec 2020 10:54:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201208015427epcas1p302cb5e3f28f375df04d2e32a36609fc2~Omu7UPVUp2957829578epcas1p3b;
 Tue,  8 Dec 2020 01:54:27 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201208015427epsmtrp1c4693f9aca2f986f7c0bfeb8eddd87ad~Omu7TwMjr1472514725epsmtrp1T;
 Tue,  8 Dec 2020 01:54:27 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-57-5fcedcd3edef
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.58.08745.3DCDECF5; Tue,  8 Dec 2020 10:54:27 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201208015427epsmtip2bf9c06efe4e0b7947629d5225078fcf5~Omu7IAMCA2139421394epsmtip2V;
 Tue,  8 Dec 2020 01:54:27 +0000 (GMT)
To: "'Joseph'" <j@gget.it>
In-Reply-To: <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
Subject: RE: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Date: Tue, 8 Dec 2020 10:54:27 +0900
Message-ID: <008101d6cd05$0faa5500$2efeff00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHu2cU0iZpo/P4bT7dFAuRD2Fuj0QLjvbKYqaUt6pA=
Content-Language: ko
X-CMS-MailID: 20201208015427epcas1p302cb5e3f28f375df04d2e32a36609fc2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201208011550epcas1p26cebc8a4d2812fca862990739a059d43
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Hello,
> When sending a big file (for example 2 GB) from a Windows computer to a Linux computer (with Samba
> server), then:
> * if the destination FS is ext4, NTFS, no problem
> * if the destination FS is exfat, then there is a strange delay (~30
> seconds) during which the Windows Explorer waits, before actually copying the file It seems that the
> Samba server first "preallocates" the 2GB, before accepting to start the copy from Samba client.
> Thus, 2GB (of probably null bytes?) are first written, and then, the actual file is written.
> How to avoid this effect that doubles the number of gigabytes written and doubles the transfer time?
> 
> I have already tried:
> 
>     strict allocate = no
> 
> without any success in the exfat case.
> 
> Any idea?
Windows seems to send SMB_FILE_END_OF_FILE_INFORMATION smb2 setinfo request to pre-allocate space
as much as the file size before writing the file.
samba fallback to call ftruncate if fallocate is not support in local filesystem.
I personally think that it is possible to improve the problem if exFAT support
keep size flags of fallocate(). It doesn't support yet in linux kernel exFAT,
but I have a plan. exFAT can store the number of allocated cluster size and the current file
size in metadata of file.
Unlike FAT. so it seems that the fallocate can be implemented properly in exFAT.
> 
> PS:
> * I've already tried exfat-fuse, but also exfat-nofuse, and also exfat (non
> fuse) included in Kernel 5.7, and it's the same.
> * There are many forums posts with the same problem, e.g.
> https://www.raspberrypi.org/forums/viewtopic.php?t=206866
> 
> Thanks,
> Jo



