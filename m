Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3A4EDEC6
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 18:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=aWzC6ZBrufG2v6Jgt4L+iq2caxddbG4FXhSMCCrRyfM=; b=WYMeyQ+ux7wPYwJpbqiX8drDw6
	AxneInt7dB4hz1W+vDwc4tJ64A9vaS/jIqxd/sFRbfCbl9qcI0qEmy/gg7TiqwUYU9dnv5pZRgzHb
	+DfgAeZDBMd+lfUFgDSLaIZyAy+ynvozRInDE97nUTmWIq8Fa1CilsgCZmtouVpN/RSAx8Mb4M0Op
	PZvOpQjB58f5EPd5yHfMYhHANwwggfFM26LwFDnaM79ga1OfteS/bJxc89L/bcgF2Dgiym1lK/H6M
	49X6XC2+PyTXTV9FSUD8SWjJpw6ZydbiACCM/dzgb7be8nlRTFYeiUrPlPaOV+jKTgxukv8MytF+H
	phNCI99g==;
Received: from ip6-localhost ([::1]:45436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZxby-007BIS-7n; Thu, 31 Mar 2022 16:25:26 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:55805) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZxbp-007BIJ-Jt
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 16:25:21 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4E8C140A4B
 for <samba-technical@lists.samba.org>; Thu, 31 Mar 2022 19:25:14 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CCA9136F
 for <samba-technical@lists.samba.org>; Thu, 31 Mar 2022 19:21:27 +0300 (MSK)
Message-ID: <d6c9f1d0-df3d-b75b-af5a-edef130c309f@msgid.tls.msk.ru>
Date: Thu, 31 Mar 2022 19:25:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: https://bugzilla.samba.org/show_bug.cgi?id=14583 : weak crypto is
 allowed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi!

I come across this too, quite some time, each
time tying to find error my smb.conf file, even
trying to tweak protocol settings.

I don't have bugzilla account (asked about it some days ago),
so here it goes.

How about this simple fix?

Thanks,

/mjt

diff --git a/source3/utils/testparm.c b/source3/utils/testparm.c
index 58ba46bc15f..4d419fd4805 100644
--- a/source3/utils/testparm.c
+++ b/source3/utils/testparm.c
@@ -875,7 +875,7 @@ static void do_per_share_checks(int s)
         } else {
                 weak_crypo_str = "disallowed";
         }
-       fprintf(stderr, "Weak crypto is %s\n", weak_crypo_str);
+       fprintf(stderr, "Weak crypto is %s by gnutls\n", weak_crypo_str);

         if (skip_logic_checks == 0) {
                 ret = do_global_checks();

