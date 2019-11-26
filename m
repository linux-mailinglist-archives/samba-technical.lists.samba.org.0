Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440110A4AA
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 20:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zK27Ft4Sn264NFCBMMD9dhMRnCLmPQkhp02kBsERTA8=; b=EFR6sV5mqQAy9Hzr3oh6d0QES1
	Dh/RlSggHHOhRknLCx3yUJzBmwo/RmsgsQjElZams1sjnIyMjNAhmNoetgWE936eg0Eb1RfvdaIon
	afftAR5XISr8lGXAwkxdOWBQipYD7e9sURLB5ZKukvSbSRIZhaJ/RpVjfK2tzT4fUxbY4y1SnkP0H
	hkz8RX/QfnMpiLcv7EzIlGoZJIA43wBlUmvTcaoQvbrF7I61yFwHPsNnvaQ9zYMHroIaeCQc1d7Iu
	gpoc7Bzum+A4n4Zrglvb9ad9z7x1JYm55t+6TXvOO5OuQJiE0Ukamnbr0BmHvX2QpSISE5nhf25Ir
	NlgHTNkw==;
Received: from localhost ([::1]:32440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZgiv-002WN7-9I; Tue, 26 Nov 2019 19:42:09 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:50746) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iZgim-002WMt-S9
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 19:42:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id E2BEAD4ECA66E;
 Tue, 26 Nov 2019 22:41:57 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mYHtHFoEnfEO; Tue, 26 Nov 2019 22:41:56 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id A7F7ED4ECA66F;
 Tue, 26 Nov 2019 22:41:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru A7F7ED4ECA66F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1574797316;
 bh=zK27Ft4Sn264NFCBMMD9dhMRnCLmPQkhp02kBsERTA8=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=f+aFNlZ+GT9q2KJP47sFwE16IvXI00e6uCoJxq2WhVWXhMxigKQ/c5iqDfLIKvSMx
 ie25nfw4Bjxjb2kTjgxH+gclgDrqJa2L0Sh5F0+yHedlIzYZmQ0YUIqD/LQ/mxjXLA
 c7HT/5+cqbyDCKrtuwQOyU6J/NjuFk2gNFUK+8ejFdfMUwyomCh2+O3WNmXyOXW5+A
 r0YLCmEfGI89NspGjbosYRzeiKQ/IxJg8ODkR5e1jQp3NKL+Z1D7kFJOE3ebDlH5Zv
 F2M2BFDPSPTaZufOh5hl3DVzEeK8nbAZvxEa42tFQHHpwvUMM1z+yTZ8Xvx+izeoIp
 QcVu5wzSt8Yfg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id avxFpozQJgg4; Tue, 26 Nov 2019 22:41:56 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-14.ip.moscow.rt.ru
 [90.154.70.14])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 467FFD4ECA66E;
 Tue, 26 Nov 2019 22:41:56 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
Message-ID: <bff9668a-604b-ffb1-d8e4-1ceaf51ded81@rosalinux.ru>
Date: Tue, 26 Nov 2019 22:41:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1925046.vXGPc2B9mm@magrathea>
Content-Type: multipart/mixed; boundary="------------04CFCF085F0B9899CCB9577F"
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------04CFCF085F0B9899CCB9577F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

26.11.2019 19:20, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via samba-
>> I have tested those 4 patches (2 yours, Andreas, and 2 mine that I sen=
t
>> here previously). Behaviour of /usr/lib/cups/backend/smb symlinked to
>> patched smbspool_krb5_wrapper seems to be correct: it passes printing
>> tasks from printers without "AuthInfoRequired negotiate" directly to
>> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
>> "AuthInfoRequired negotiate", where UID is a local ID of a domain user=
.
>> I clearly see this in /var/log/cups/error_log when it is "LogLevel
>> debug2" in /etc/cups/cupsd.conf.
>>
>> So, these patches are ready to be merged, I think.
>
> I'm not able to apply your patches. Could you please send patches creat=
ed with
> 'git format-patch' or point me to a git repo where I could pick them?
>
>
> Thanks!
>
Attached the patches

--------------04CFCF085F0B9899CCB9577F
Content-Type: text/x-patch; charset=UTF-8;
 name="0004-smbspool-print-a-hint-about-smbspool_krb5_wrapper.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0004-smbspool-print-a-hint-about-smbspool_krb5_wrapper.patch"

From 90dec7767aa6aecd303164eaea22656b9fa4e959 Mon Sep 17 00:00:00 2001
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Date: Sun, 3 Nov 2019 01:47:51 +0300
Subject: [PATCH 4/4] smbspool: print a hint about smbspool_krb5_wrapper

When I first met with the situation that Kerberos kredentials cache of root
user was looked for instead of the one of the printing task creator,
it took a lot of time to understand that smbspool_krb5_wrapper will resolve this.

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
 source3/client/smbspool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source3/client/smbspool.c b/source3/client/smbspool.c
index 34def0c91a9..5e2d230ab8b 100644
--- a/source3/client/smbspool.c
+++ b/source3/client/smbspool.c
@@ -699,8 +699,8 @@ smb_connect(struct cli_state **output_cli,
 	if (strcmp(auth_info_required, "negotiate") == 0) {
 		if (!kerberos_ccache_is_valid()) {
 			fprintf(stderr,
-				"ERROR: No valid Kerberos credential cache "
-				"found!\n");
+				"ERROR: No valid Kerberos credential cache found! "
+				"Using smbspool_krb5_wrapper may help.\n");
 			return NT_STATUS_LOGON_FAILURE;
 		}
 		user = jobusername;
-- 
2.20.1


--------------04CFCF085F0B9899CCB9577F
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-s3-smbspool_krb5_wrapper-ignore-unknown-values-of-AU.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-s3-smbspool_krb5_wrapper-ignore-unknown-values-of-AU.pa";
 filename*1="tch"

From b2581f0ecc1253fa4d805b962ac8c7191f92e278 Mon Sep 17 00:00:00 2001
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Date: Sun, 3 Nov 2019 01:28:13 +0300
Subject: [PATCH 3/4] s3:smbspool_krb5_wrapper: ignore unknown values of
 AUTH_INFO_REQUIRED

To make smbspool_krb5_wrapper usable as a default destination for symlink
/usr/lib/cups/backend/smb in Linux ditros, it has to be well-prepared
for any possible values of AUTH_INFO_REQUIRED set by cupsd and correctly
pass printing tasks to smbspool if it sees that Kerberos authentication
is not needed.

Discussed here: https://lists.samba.org/archive/samba-technical/2019-October/134470.html

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
 source3/client/smbspool_krb5_wrapper.c | 34 ++++++++++++++++++++------
 source3/script/tests/test_smbspool.sh  | 28 +++++++++++++++++++++
 2 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/source3/client/smbspool_krb5_wrapper.c b/source3/client/smbspool_krb5_wrapper.c
index bd6319ca9c3..a2851d7fbc1 100644
--- a/source3/client/smbspool_krb5_wrapper.c
+++ b/source3/client/smbspool_krb5_wrapper.c
@@ -145,36 +145,56 @@ int main(int argc, char *argv[])
 		snprintf(device_uri, sizeof(device_uri), "%s", env);
 	}
 
-	/* Check if AuthInfoRequired is set to negotiate */
+	/* We must handle the following values of AUTH_INFO_REQUIRED:
+	 *  none: Anonymous/guest printing
+	 *  username,password: A username (of the form "username" or "DOMAIN\username")
+	 *                     and password are required
+	 *  negotiate: Kerberos authentication
+	 *  NULL (not set): will never happen when called from cupsd
+	 * https://www.cups.org/doc/spec-ipp.html#auth-info-required
+	 * https://github.com/apple/cups/issues/5674
+	 */
 	env = getenv("AUTH_INFO_REQUIRED");
 
         /* If not set, then just call smbspool. */
 	if (env == NULL || env == "none" || env[0] == 0) {
 		CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
-			       "execute smbspool");
+			       "executing smbspool");
+		/* Pass this printing task to smbspool without Kerberos auth */
 		goto smbspool;
 	} else {
 		CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED=%s", env);
 
+		/* First test the value of AUTH_INFO_REQUIRED
+		 * against known possible values
+		 */
 		cmp = strcmp(env, "none");
 		if (cmp == 0) {
 			CUPS_SMB_DEBUG("Authenticate using none (anonymous) - "
-				       "execute smbspool");
+				       "executing smbspool");
 			goto smbspool;
 		}
 
 		cmp = strcmp(env, "username,password");
 		if (cmp == 0) {
 			CUPS_SMB_DEBUG("Authenticate using username/password - "
-				       "execute smbspool");
+				       "executing smbspool");
 			goto smbspool;
 		}
 
+		/* Now, if 'goto smbspool' still has not happened,
+		 * there are only two variants left:
+		 * 1) AUTH_INFO_REQUIRED is "negotiate" and then
+		 *    we have to continue working
+		 * 2) or it is something not known to us, then Kerberos
+		 *    authentication is not required, so just also pass
+		 *    this task to smbspool
+		 */
 		cmp = strcmp(env, "negotiate");
 		if (cmp != 0) {
-			CUPS_SMB_ERROR("Authentication unsupported");
-			fprintf(stderr, "ATTR: auth-info-required=negotiate\n");
-			return CUPS_BACKEND_AUTH_REQUIRED;
+			CUPS_SMB_DEBUG("Value of AUTH_INFO_REQUIRED is not known "
+				       "to smbspool_krb5_wrapper, executing smbspool");
+			goto smbspool;
 		}
 
 		snprintf(auth_info_required,
diff --git a/source3/script/tests/test_smbspool.sh b/source3/script/tests/test_smbspool.sh
index 01d72101615..c32ace6682e 100755
--- a/source3/script/tests/test_smbspool.sh
+++ b/source3/script/tests/test_smbspool.sh
@@ -66,6 +66,30 @@ test_smbspool_authinforequired_none()
 	return 0
 }
 
+test_smbspool_authinforequired_unknown()
+{
+	cmd='$samba_smbspool_krb5 smb://$SERVER_IP/print4 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps 2>&1'
+
+	# smbspool_krb5_wrapper must ignore AUTH_INFO_REQUIRED unknown to him and pass the task to smbspool
+	# smbspool must fail with NT_STATUS_ACCESS_DENIED (22)
+	# "jjf4wgmsbc0" is just a random string
+	AUTH_INFO_REQUIRED="jjf4wgmsbc0"
+	export AUTH_INFO_REQUIRED
+	eval echo "$cmd"
+	out=$(eval $cmd)
+	ret=$?
+	unset AUTH_INFO_REQUIRED
+
+	case "$ret" in
+		22 ) return 0 ;;
+		* )
+			echo "$out"
+			echo "failed to test $smbspool_krb5 against unknown value of AUTH_INFO_REQUIRED"
+			return 1
+		;;
+	esac
+}
+
 #
 # The test enviornment uses 'vlp' (virtual lp) as the printing backend.
 #
@@ -187,6 +211,10 @@ testit "smbspool_krb5_wrapper AuthInfoRequired=none" \
 	test_smbspool_authinforequired_none || \
 	failed=$(expr $failed + 1)
 
+testit "smbspool_krb5_wrapper AuthInfoRequired=(sth unknown)" \
+	test_smbspool_authinforequired_unknown || \
+	failed=$(expr $failed + 1)
+
 testit "smbspool print example.ps" \
 	$samba_smbspool smb://$USERNAME:$PASSWORD@$SERVER_IP/print1 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps || \
 	failed=$(expr $failed + 1)
-- 
2.20.1


--------------04CFCF085F0B9899CCB9577F
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-s3-smbspool_krb5_wrapper-Map-AUTH_INFO_REQUIRED-none.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-s3-smbspool_krb5_wrapper-Map-AUTH_INFO_REQUIRED-none.pa";
 filename*1="tch"

From 28bbb580dead3f4a523335f89f020ce522458571 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Mon, 28 Oct 2019 09:38:08 +0100
Subject: [PATCH 2/4] s3:smbspool_krb5_wrapper: Map AUTH_INFO_REQUIRED=none to
 anonymous

Signed-off-by: Andreas Schneider <asn@samba.org>
---
 selftest/target/Samba4.pm              |  3 +++
 source3/client/smbspool_krb5_wrapper.c | 18 ++++++++++++------
 source3/script/tests/test_smbspool.sh  | 10 +++-------
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
index 1310e2ff09f..23dafba1574 100755
--- a/selftest/target/Samba4.pm
+++ b/selftest/target/Samba4.pm
@@ -1845,6 +1845,9 @@ sub provision_ad_dc($$$$$$)
 	copy = print1
 [print3]
 	copy = print1
+[print4]
+	copy = print1
+	guest ok = yes
 [lp]
 	copy = print1
 ";
diff --git a/source3/client/smbspool_krb5_wrapper.c b/source3/client/smbspool_krb5_wrapper.c
index bff1df417e8..bd6319ca9c3 100644
--- a/source3/client/smbspool_krb5_wrapper.c
+++ b/source3/client/smbspool_krb5_wrapper.c
@@ -149,17 +149,19 @@ int main(int argc, char *argv[])
 	env = getenv("AUTH_INFO_REQUIRED");
 
         /* If not set, then just call smbspool. */
-	if (env == NULL || env[0] == 0) {
+	if (env == NULL || env == "none" || env[0] == 0) {
 		CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
 			       "execute smbspool");
 		goto smbspool;
 	} else {
 		CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED=%s", env);
 
-		snprintf(auth_info_required,
-			 sizeof(auth_info_required),
-			 "%s",
-			 env);
+		cmp = strcmp(env, "none");
+		if (cmp == 0) {
+			CUPS_SMB_DEBUG("Authenticate using none (anonymous) - "
+				       "execute smbspool");
+			goto smbspool;
+		}
 
 		cmp = strcmp(env, "username,password");
 		if (cmp == 0) {
@@ -168,13 +170,17 @@ int main(int argc, char *argv[])
 			goto smbspool;
 		}
 
-		/* if AUTH_INFO_REQUIRED=none */
 		cmp = strcmp(env, "negotiate");
 		if (cmp != 0) {
 			CUPS_SMB_ERROR("Authentication unsupported");
 			fprintf(stderr, "ATTR: auth-info-required=negotiate\n");
 			return CUPS_BACKEND_AUTH_REQUIRED;
 		}
+
+		snprintf(auth_info_required,
+			 sizeof(auth_info_required),
+			 "%s",
+			 env);
 	}
 
 	uid = getuid();
diff --git a/source3/script/tests/test_smbspool.sh b/source3/script/tests/test_smbspool.sh
index 7ba03f01fc7..01d72101615 100755
--- a/source3/script/tests/test_smbspool.sh
+++ b/source3/script/tests/test_smbspool.sh
@@ -48,7 +48,7 @@ test_smbspool_noargs()
 
 test_smbspool_authinforequired_none()
 {
-	cmd='$samba_smbspool_krb5 smb://$SERVER_IP/print1 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps 2>&1'
+	cmd='$samba_smbspool_krb5 smb://$SERVER_IP/print4 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps 2>&1'
 
 	AUTH_INFO_REQUIRED="none"
 	export AUTH_INFO_REQUIRED
@@ -60,14 +60,10 @@ test_smbspool_authinforequired_none()
 	if [ $ret != 0 ]; then
 		echo "$out"
 		echo "failed to execute $smbspool_krb5"
-	fi
-
-	echo "$out" | grep 'ATTR: auth-info-required=negotiate'
-	ret=$?
-	if [ $ret != 0 ] ; then
-		echo "$out"
 		return 1
 	fi
+
+	return 0
 }
 
 #
-- 
2.20.1


--------------04CFCF085F0B9899CCB9577F
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-smbspool-Map-AUTH_INFO_REQUIRED-none-to-anonymous-co.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-smbspool-Map-AUTH_INFO_REQUIRED-none-to-anonymous-co.pa";
 filename*1="tch"

From 3ad5ed9bc31d46360b6bf025773bf8ade4717bf8 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Mon, 28 Oct 2019 09:35:34 +0100
Subject: [PATCH 1/4] smbspool: Map AUTH_INFO_REQUIRED=none to anonymous
 connection

Signed-off-by: Andreas Schneider <asn@samba.org>
---
 source3/client/smbspool.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/source3/client/smbspool.c b/source3/client/smbspool.c
index 36f7f67ca94..34def0c91a9 100644
--- a/source3/client/smbspool.c
+++ b/source3/client/smbspool.c
@@ -287,7 +287,7 @@ main(int argc,			/* I - Number of command-line arguments */
 
 	auth_info_required = getenv("AUTH_INFO_REQUIRED");
 	if (auth_info_required == NULL) {
-		auth_info_required = "none";
+		auth_info_required = "samba";
 	}
 
 	/*
@@ -718,7 +718,9 @@ smb_connect(struct cli_state **output_cli,
 
 		fprintf(stderr,
 			"DEBUG: Try to connect using username/password ...\n");
-	} else {
+	} else if (strcmp(auth_info_required, "none") == 0) {
+		goto anonymous;
+	} else if (strcmp(auth_info_required, "samba") == 0) {
 		if (username != NULL) {
 			flags |= CLI_FULL_CONNECTION_FALLBACK_AFTER_KERBEROS;
 		} else if (kerberos_ccache_is_valid()) {
@@ -731,6 +733,8 @@ smb_connect(struct cli_state **output_cli,
 				"DEBUG: This backend requires credentials!\n");
 			return NT_STATUS_ACCESS_DENIED;
 		}
+	} else {
+		return NT_STATUS_ACCESS_DENIED;
 	}
 
 	nt_status = smb_complete_connection(&cli,
@@ -780,6 +784,7 @@ smb_connect(struct cli_state **output_cli,
          * last try. Use anonymous authentication
          */
 
+anonymous:
 	nt_status = smb_complete_connection(&cli,
 					    myname,
 					    server,
-- 
2.20.1


--------------04CFCF085F0B9899CCB9577F--

