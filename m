Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5A5931B8
	for <lists+samba-technical@lfdr.de>; Mon, 15 Aug 2022 17:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=0st8YVUaSQr2/Wkfn8skH4jl++RaUk5/QfDmfHj1q44=; b=wj21WrrvUnhFvhDZQ6jBfOJNds
	Ce7GF/oYvJ6N6JsSL/b5bU9psxK/fntp8pgdBgf1S6hJEMOqoAEHssrwBBDcp7QW+kPHU45Fe02eB
	9uI8q84KC7xxukVM+p+G+H+6T+H+YfmICm30bHj614R+gwqYYmHuJUn3wAIDgFVFvkoUEM6nyNYu2
	Qncsc/g1FmM5RSvPUe3Z9Az6EqetDGGT1gsdtev8uCSnHwmYCjR3z2/MrqaZgTZ8uR6VoTcFWiRO4
	O78QaO4zrw8QIJoH1d9JKi/1XGlbEYKh4WixxA/en+MCpV0AHQ3K6r7y0VSROfQrttjyd04SfyhlQ
	9zCco+/g==;
Received: from ip6-localhost ([::1]:45928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oNbvE-0006Bg-FR; Mon, 15 Aug 2022 15:22:32 +0000
Received: from [104.200.28.160] (port=45104 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1oNbv6-0006BX-2w
 for samba-technical@lists.samba.org; Mon, 15 Aug 2022 15:22:30 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id B83A01508
 for <samba-technical@lists.samba.org>; Mon, 15 Aug 2022 15:06:05 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: WHATSNEW: add section for new smbconf python api
Date: Mon, 15 Aug 2022 11:06:05 -0400
Message-ID: <11549021.eNJFYEL58v@edfu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart23187184.4csPzL39Zc"
Content-Transfer-Encoding: 7Bit
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

--nextPart23187184.4csPzL39Zc
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Sorry for the late update, but here's a patch for WHATSNEW related to the 
smbconf python APIs I added a few months ago.

Thanks!
--nextPart23187184.4csPzL39Zc
Content-Disposition: attachment; filename="0001-WHATSNEW-add-section-for-new-smbconf-python-api.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-WHATSNEW-add-section-for-new-smbconf-python-api.patch"

From 2b780e1d0c4e1dab6e7441b0b47b34bdf16e25cb Mon Sep 17 00:00:00 2001
From: John Mulligan <jmulligan@redhat.com>
Date: Thu, 11 Aug 2022 14:04:27 -0400
Subject: [PATCH] WHATSNEW: add section for new smbconf python api

Signed-off-by: John Mulligan <jmulligan@redhat.com>
---
 WHATSNEW.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/WHATSNEW.txt b/WHATSNEW.txt
index d39748f0587..9bbdf53a76a 100644
--- a/WHATSNEW.txt
+++ b/WHATSNEW.txt
@@ -147,6 +147,16 @@ can cause the Kerberos password salt to change.  This means that after
 *both* an account rename and a password change, only the current
 password will be recognised for password history purposes.
 
+Python API for smbconf
+----------------------
+
+Samba's smbconf library provides a generic frontend to various
+configuration backends (plain text file, registry) as a C library. A
+new Python wrapper, importable as 'samba.smbconf' is available.  An
+additional module, 'samba.samba3.smbconf', is also available to enable
+registry backend support. These libraries allow Python programs to
+read, and optionally write, Samba configuration natively.
+
 
 REMOVED FEATURES
 ================
-- 
2.37.1


--nextPart23187184.4csPzL39Zc--




