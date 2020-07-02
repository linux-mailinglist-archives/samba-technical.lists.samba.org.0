Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45436212D24
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jul 2020 21:32:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=PXd1cb25xYgesPNLiHUExojSqxe8Jac46BYHyze9qoU=; b=Q0bhQxXN3Hf157gBbhm6igVQSU
	dxLppnb556BdJM0RAVslNPw32nbp0jhoOcdY+AeK2S81bMi4rvQCCDoY0Z6vRGMGiyO5EAihP4VTB
	HIfICejq+u7AeLeHMqe9JcgApJRUHNOZYwwGciNWSzSOGk3AE1/jx928TZiFlG23FGnNPD+8MpcYC
	854+nF+5RR0szFlaW8Z+y0Kp3pHCHpujncnRFy7ocx383QiM3JOHfslCDB8EMXucWYSZ+yzekZ9Dl
	tqaLiYChhdRwVG7vqWvI3VN1btzv8PJTSqwo/AeztA7tfscwHEoRS0VN9a3X9b6nfxEO6o1kjHXe5
	RgkspWgQ==;
Received: from localhost ([::1]:28748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jr4vP-0059zV-2F; Thu, 02 Jul 2020 19:31:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr4vI-0059zO-Hp
 for samba-technical@lists.samba.org; Thu, 02 Jul 2020 19:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=PXd1cb25xYgesPNLiHUExojSqxe8Jac46BYHyze9qoU=; b=VL/21vNvxcIyQ9Yx6egHlUeiX3
 D3ga/RpJjsPa73cMrBQzi8OdRv7h99YmGpzEOgTuXcLRXb+2Q24Xt7VqPs2KfKEhbTUolU0zs6j/V
 P2kF4ulW8GaNuSfiYesm3Q2UkEOJo27qggGjuYUqJgFjyP8T29fyGh7zzT9TEm1ZchAw/imDICEP9
 8zR+KLkj1k6Vn2QpZW6jmY8U7p8PNdhcbuORZQCGDGGuV6V+X66fISN1F0nB00+7Iu2TVirzQ5WLp
 INjRY4LtpgCCgYpZ79xgyv7gx7BeA5oHUA/QeLu9zo+gNB1MN7pEFJ7rITD26dr9QExOnQdll4qGl
 36cHDBM0ECCwfNvuFKY9cpA7ZR487mQ6u4RNYiEku/hs9IewAtC+hcutar+HpnERD+dbYIl/+hJDR
 i/Tfs1/bRdmquLd9TfNu0+qAE3pxaBg6ZnpGVkeYDgADzabw2Usdd105Iza1Fl39DubAnOIZK8HnV
 mLxzZ2OttwX1ONFBzWFUs/19;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr4vG-00029Z-S2; Thu, 02 Jul 2020 19:31:03 +0000
Message-ID: <4160624d8abe5a0d8d7a31573068746b3e19e439.camel@samba.org>
Subject: libwbclient (LGPLv3) linking to samba-util (GPLv3) in Samba 4.12
To: Swen Schillig <swen@linux.ibm.com>, Ralph =?ISO-8859-1?Q?B=F6hme?=
 <slow@samba.org>
Date: Fri, 03 Jul 2020 07:30:58 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Folks,

I just noticed this because debian failed to build due to an extra
symbol added to our internal samba-util library.

samba-util is a 'big ball of mud' library of Samba stuff, licensed
GPLv3 and very, very helpful for stuff in Samba.  Work is slowly
happening to try and pry it apart into a directed graph of smaller
libraries, but for now that is how it works.

Either way, it is GPLv3 and is therefore not permitted to be a
dependency of libwbclient, which is our tiny winbind client lib for
linking into OTHER PARTS of a running system, eg nss, pam and
potentially other tools.  It is LGPLv3, and important distinction.

I don't know why our ABI stuff didn't pick it up, but I know some on
the team have ideas about how to reinforce that.

We need to disconnect these two parts, then try and undo the damage in
the distributions due to the extra symbols. 

Andrew Bartlett

commit ea7231dcc0b50c535f913f0542d600d0b2119a21
Author: Swen Schillig <swen@linux.ibm.com>
Date:   Tue Jan 29 14:21:25 2019 +0100

    libwbclient: Use wrapper for string to integer conversion
    
    In order to detect an value overflow error during
    the string to integer conversion with strtoul/strtoull,
    the errno variable must be set to zero before the execution and
    checked after the conversion is performed. This is achieved by
    using the wrapper function strtoul_err and strtoull_err.
    
    Signed-off-by: Swen Schillig <swen@linux.ibm.com>
    Reviewed-by: Ralph Böhme <slow@samba.org>
    Reviewed-by: Jeremy Allison <jra@samba.org>

diff --git a/nsswitch/libwbclient/wscript
b/nsswitch/libwbclient/wscript
index 7bb612d670a..d926067df91 100644
--- a/nsswitch/libwbclient/wscript
+++ b/nsswitch/libwbclient/wscript
@@ -37,7 +37,7 @@ def build(bld):
                              wbc_pwd.c
                              wbc_sid.c
                              wbc_util.c''',
-                      deps='winbind-client',
+                      deps='winbind-client samba-util',
                       pc_files='wbclient.pc',
                       public_headers='wbclient.h',
                       abi_directory='ABI',

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




