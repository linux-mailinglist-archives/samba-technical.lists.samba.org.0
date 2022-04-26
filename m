Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AE50F8D0
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 11:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1i923IECzJikwfJFN7hHFpvAOqkg1mCdcnRvXZzW+O0=; b=gsMVDBv0AKQ/nOmIO9D+yLRkxb
	Nz5BAOyIoO75w7VC47cp7shUJu19DQPNvLvqRTE7/da+TBBHahFT9fuZryM2KXfqxlnKSjWA6wy9K
	vYC7aGghY3rVNdzFZ7hqqUVVmPfVRZ9ZaeAiy0NxIoeR7wcg46Hg6leLmG3tLSYpeN+dWTKrfNq3S
	xZhDxpROTRsDXtQjmnetyn3VsYW85wF4tLOf+kSrqTKbfh/Z9SB0khKXCp9ov8iVZynoCS0ZO6Oy4
	WUvom2OVTbQtErFflamRxfT3VcJqSC5pGBrDI05Q5SgUGydUHchhu0Kd1C5ktCN9hd6KWudUD5spi
	YyerzYoA==;
Received: from ip6-localhost ([::1]:27860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njHih-002ENL-VB; Tue, 26 Apr 2022 09:42:56 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49063) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njHie-002ENA-4U
 for samba-technical@lists.samba.org; Tue, 26 Apr 2022 09:42:54 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4B6B94078B
 for <samba-technical@lists.samba.org>; Tue, 26 Apr 2022 12:42:49 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id DC9DC39C
 for <samba-technical@lists.samba.org>; Tue, 26 Apr 2022 12:37:34 +0300 (MSK)
Content-Type: multipart/mixed; boundary="------------mLIIhDK22xquOE0oOAqCS3tb"
Message-ID: <ff4e3861-adca-cb4e-55ed-2fc7471dc0f5@msgid.tls.msk.ru>
Date: Tue, 26 Apr 2022 12:42:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: pid_directory error in testparm?
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------mLIIhDK22xquOE0oOAqCS3tb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

I noticed testparm is failing when samba pid directory does not exist.
However, some samba daemons do create this directory automatically, and
as far as I can see, samba can be started just fine without this directory
(maybe not all daemons do this, I'm not sure yet).

How about something like the attached change for testparam.c, to denote
this condition from being ERROR to a mere WARNING instead?

Thanks,

/mjt
--------------mLIIhDK22xquOE0oOAqCS3tb
Content-Type: text/x-patch; charset=UTF-8;
 name="testparm-do-not-fail-if-pid-dir-does-not-exists.patch"
Content-Disposition: attachment;
 filename="testparm-do-not-fail-if-pid-dir-does-not-exists.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdXJjZTMvdXRpbHMvdGVzdHBhcm0uYyBiL3NvdXJjZTMvdXRpbHMv
dGVzdHBhcm0uYwppbmRleCAyZDcxN2YxOTc1Ni4uNmQ2ZTQ2MmQwODQgMTAwNjQ0Ci0tLSBh
L3NvdXJjZTMvdXRpbHMvdGVzdHBhcm0uYworKysgYi9zb3VyY2UzL3V0aWxzL3Rlc3RwYXJt
LmMKQEAgLTI4Myw5ICsyODMsOCBAQCBzdGF0aWMgaW50IGRvX2dsb2JhbF9jaGVja3Modm9p
ZCkKIAl9CiAKIAlpZiAoIWRpcmVjdG9yeV9leGlzdF9zdGF0KGxwX3BpZF9kaXJlY3Rvcnko
KSwgJnN0KSkgewotCQlmcHJpbnRmKHN0ZGVyciwgIkVSUk9SOiBwaWQgZGlyZWN0b3J5ICVz
IGRvZXMgbm90IGV4aXN0XG5cbiIsCisJCWZwcmludGYoc3RkZXJyLCAiV0FSTklORzogcGlk
IGRpcmVjdG9yeSAlcyBkb2VzIG5vdCBleGlzdFxuXG4iLAogCQkgICAgICAgbHBfcGlkX2Rp
cmVjdG9yeSgpKTsKLQkJcmV0ID0gMTsKIAl9CiAKIAlpZiAobHBfcGFzc2RiX2V4cGFuZF9l
eHBsaWNpdCgpKSB7Cg==

--------------mLIIhDK22xquOE0oOAqCS3tb--

