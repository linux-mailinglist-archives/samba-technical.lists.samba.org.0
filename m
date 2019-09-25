Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4ABBD5F4
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 03:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CV7Tyud94cRbj2xQwtiIbtbhviTDclrwF5APzvyLaMQ=; b=XCh1n2Bsgwecrz7CX4ZmeCw9PM
	nTWYHGYuReCDhHV5iy6/CT0YiYANvs0kwtst0FYz5ttE/XCQ6DGJUOwBpY+SWeOsZSI3Rm/LeB1iX
	C/EJSaRXuDw5EBFdKeFHc3dHed48wvo2lPqq3e0BXQx/gOeZrBcq8p4ofh1VuQ3WOhzEvXCX+HicM
	yZe/Vf1XgxuLPf45KKMuEdUz9SoQvH4NOXHkQwMPX5ZyLz9r2oOx1vB9uK2IFL0sT/4MEFdhf55pH
	NnwZbGW91jMg+/4ZaxmZ3e3d5CoCV43bl7o64ZZtP7CO3CncLblYxWpHeFSPGK2LVnTXgi693TSl9
	YGdVwp5g==;
Received: from localhost ([::1]:39726 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCvhw-008Lzt-SO; Wed, 25 Sep 2019 01:03:04 +0000
Received: from mx1.redhat.com ([209.132.183.28]:39884) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iCvhs-008Lzm-PA
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 01:03:03 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 08B0230224AC
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 01:02:57 +0000 (UTC)
Received: from ovpn-116-115.phx2.redhat.com (ovpn-116-115.phx2.redhat.com
 [10.3.116.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB7D85C220
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 01:02:56 +0000 (UTC)
Message-ID: <da7740f52f13864f02253ff0ea959cab878717f9.camel@redhat.com>
Subject: [PATCH 2/2] s3:tests/smbspool.sh: Add tests with sanitized Device
 URI in argv[0]
To: samba-technical@lists.samba.org
Date: Tue, 24 Sep 2019 18:02:56 -0700
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 25 Sep 2019 01:02:57 +0000 (UTC)
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
From: Bryan Mason via samba-technical <samba-technical@lists.samba.org>
Reply-To: bmason@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This patch uses smbspool_argv_wrapper to test when argv[0] is set to a
sanitized Device URI, as CUPS does.  I've verified that the tests pass
when the fix for https://bugzilla.samba.org/show_bug.cgi?id=14128
(commit d65b17c) is included, and they fail if that commit is reverted.

Please review and comment.  Thanks!

[PATCH 2/2] s3:tests/smbspool.sh: Add tests with sanitized Device URI
in argv[0]

Use smbspool_argv_wrapper to test when a sanitized Device URI is in
argv[0] and the DEVICE_URI contains the Device URI with
username/password credentials.

Signed-off-by: Bryan Mason <bmason@redhat.com>
---
 source3/script/tests/test_smbspool.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/source3/script/tests/test_smbspool.sh
b/source3/script/tests/test_smbspool.sh
index f28c0909334..7ba03f01fc7 100755
--- a/source3/script/tests/test_smbspool.sh
+++ b/source3/script/tests/test_smbspool.sh
@@ -22,6 +22,7 @@ incdir=`dirname $0`/../../../testprogs/blackbox
 samba_bindir="$BINDIR"
 samba_vlp="$samba_bindir/vlp"
 samba_smbspool="$samba_bindir/smbspool"
+samba_argv_wrapper="$samba_bindir/smbspool_argv_wrapper"
 samba_smbtorture3="$samba_bindir/smbtorture3"
 samba_smbspool_krb5="$samba_bindir/smbspool_krb5_wrapper"
 
@@ -224,6 +225,28 @@ testit "smbspool print DEVICE_URI example.ps via
stdin" \
 	failed=$(expr $failed + 1)
 unset DEVICE_URI
 
+testit "vlp verify example.ps" \
+	test_vlp_verify \
+	|| failed=$(expr $failed + 1)
+
+DEVICE_URI="smb://$USERNAME:$PASSWORD@$SERVER_IP/print1"
+export DEVICE_URI
+testit "smbspool print sanitized Device URI in argv0 example.ps" \
+	$smbspool_argv_wrapper $samba_smbspool smb://$SERVER_IP/print1
200 $USERNAME "Testprint" 1 "options"
$SRCDIR/testdata/printing/example.ps || \
+	failed=$(expr $failed + 1)
+unset DEVICE_URI
+
+testit "vlp verify example.ps" \
+	test_vlp_verify \
+	|| failed=$(expr $failed + 1)
+
+DEVICE_URI="smb://$USERNAME:$PASSWORD@$SERVER_IP/print1"
+export DEVICE_URI
+testit "smbspool print sanitized Device URI in argv0 example.ps via
stdin" \
+	$smbspool_argv_wrapper $samba_smbspool smb://$SERVER_IP/print1
200 $USERNAME "Testprint" 1 "options" <
$SRCDIR/testdata/printing/example.ps || \
+	failed=$(expr $failed + 1)
+unset DEVICE_URI
+
 testit "vlp verify example.ps" \
 	test_vlp_verify \
 	|| failed=$(expr $failed + 1)
-- 
2.18.1



