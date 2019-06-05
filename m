Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3F35B68
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2019 13:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=lvk2Vh9SVCOqta661+OEks1yYRct8smkiuJMf3kKEqg=; b=m/z23fhORTiUKQJTH2sg5UH/Cl
	tA6hmBI0EcDqeQZkDXpfdTtbJGQ8qCVDFV82/mbHyoHPjjZn4X6lLyLUuLZvAEhy6X/zq8kgKltFl
	Q2l/176iPryXqj2QCJMY2GSTEoOmcl0mWuKGrVokqOQBld5n+N6iqC6JOK2w7JDsP0NYg2IJ5V9fe
	J4cPy2hM6x6G9dpuh3zdnRA2QihkIev+kgUw2fBwkRppxN5xtCJlHSvMiFRHySiE3LDdNqUngQNhb
	lSdUjLh/zIBR8Cl8QtmhSB4lC9jd8VRPNJlZDyULWN6phunRHSGuv997mRnyYJA575Gqw+OnrjbRB
	yBt8jR6w==;
Received: from localhost ([::1]:29024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYUHX-0005Hc-VD; Wed, 05 Jun 2019 11:40:40 +0000
Received: from mail-pg1-f172.google.com ([209.85.215.172]:42605) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hYUHS-0005GN-ED
 for samba-technical@lists.samba.org; Wed, 05 Jun 2019 11:40:37 +0000
Received: by mail-pg1-f172.google.com with SMTP id e6so10987448pgd.9
 for <samba-technical@lists.samba.org>; Wed, 05 Jun 2019 04:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=qA7exfDCsqLblyhEypBQ2lWnRy3x23y19EMsnSx9QNI=;
 b=clnKTBcM04waQmcUXY4U2abSjoZPFGgVvvABRQqtzTGrCti779Z13cTDPucQEY2jrg
 azEFWXfUW121BzqMWvrDT6KlXT3GevfpH5KO8/7jJ002P6OzpVQIp9gGGWpyc2N0AjY5
 /LLeHZcmALUL+0pAaR/TmC29QRBU/3U9xt/93QMcby1SH5BC0FXcxo33HO1XZTGkABUO
 quYvLUAjRtuS378hXEyyiLbk9oXhWvXq3ASfjn7Hd7AJiwVT+FpiziM/0L6yLQzGAO/4
 TDejLBFIItduEu46tAWR1AOsf4M3snz2/ovjJjVJYyWArPDL8Qmm5v4iW5wkp/hO8/JB
 ztKA==
X-Gm-Message-State: APjAAAVq1fea6DSasN9uy0Q3vWJTsgcBd3N5To2t2WThknMENARb8bXE
 P+c2AxEB6lAi6KNQz6PkQ4dqn2+RPPI=
X-Google-Smtp-Source: APXvYqz90BuiInl/X4CrsLFXpBEInmNdf5V5Z43nkWFSfZVka+/Ezpp5nk+kUlOeWqGjC0T5B57Rsg==
X-Received: by 2002:a62:198e:: with SMTP id 136mr43673891pfz.180.1559734831489; 
 Wed, 05 Jun 2019 04:40:31 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id y6sm36770pfo.38.2019.06.05.04.40.28
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 04:40:29 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [Patch] Addition of net ads gpo <commands> in man net
Message-ID: <1b05eb02-d234-1d70-ecba-3fc8b3da57dc@redhat.com>
Date: Wed, 5 Jun 2019 17:10:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------D1F77D56CDFECE2462A8C568"
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------D1F77D56CDFECE2462A8C568
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

:) Again, CI/CD pipeline failed for "samba-ad-dc-2"

/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
value                    : DATA_BLOB length=16
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                            
keys: struct secrets_domain_info1_kerberos_key
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
keytype                  : 0x00000017 (23)
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
iteration_count          : 0x00001000 (4096)
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
value                    : DATA_BLOB length=16
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                            
keys: struct secrets_domain_info1_kerberos_key
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
keytype                  : 0x00000003 (3)
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
iteration_count          : 0x00001000 (4096)
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
value                    : DATA_BLOB length=8
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                
old_password             : NULL
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                
older_password           : NULL
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
secrets_store_domain_info: SEC_CHAN_* not supported for SAMBADOMAIN
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
secrets_fetch_or_upgrade_domain_info: secrets_store_domain_info() failed
for SAMBADOMAIN - NT_STATUS_INTERNAL_ERROR
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
fill_mem_keytab_from_secrets:
secrets_fetch_or_upgrade_domain_info(SAMBADOMAIN) - NT_STATUS_INTERNAL_ERROR
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
../../source3/librpc/crypto/gse_krb5.c:591: Error! Unable to set mem
keytab - -1765328254
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd: Failed to start
GENSEC server mech gse_krb5: NT_STATUS_INTERNAL_ERROR
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
../../source3/libads/authdata.c:278Failed to start server-side GENSEC
krb5 to validate a Kerberos ticket: NT_STATUS_INTERNAL_ERROR
/tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd: kinit failed for
'Administrator@SAMBA.EXAMPLE.COM' with: Preauthentication failed
(-1765328360)

==> /builds/amitkuma/samba/samba-ad-dc-2.stdout <==
[60(451)/67 at 34m8s] samba4.krb5.kdc with account DENIED permission to
replicate to an RODC(rodc)

==> /builds/amitkuma/samba/samba-ad-dc-2.stderr <==
python3: WARNING: The "lsa over netlogon" option is deprecated
python3: WARNING: The "server schannel" option is deprecated

==> /builds/amitkuma/samba/samba-ad-dc-2.stdout <==
[61(748)/67 at 35m35s] samba4.krb5.kdc with account ALLOWED permission
to replicate to an RODC(rodc)
[62(1237)/67 at 37m10s] samba4.krb5.kdc with machine account(rodc:local)

==> /builds/amitkuma/samba/samba-ad-dc-2.stderr <==
python3: WARNING: The "lsa over netlogon" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "lsa over netlogon" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
Pulling docker image gitlab/gitlab-runner-helper:x86_64-ac2a293c ...
ERROR: Job failed: execution took longer than 1h0m0s seconds

--------------D1F77D56CDFECE2462A8C568
Content-Type: text/x-patch;
 name="0001-docs-Add-net-gpo-command-text-in-man-net.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-docs-Add-net-gpo-command-text-in-man-net.patch"

From a2b518cb2ff8616bae81c575fb7ea076c1784331 Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Thu, 6 Jun 2019 01:54:31 +0530
Subject: [PATCH] docs: Add 'net gpo command' text in man net

This change adds contents to man net for 'net ads gpo' command
set based on results got after executing:
'# net ads gpo help' and subcommands

Fixes: https://bugzilla.samba.org/show_bug.cgi?id=13986

Signed-off-by: Amit Kumar <amitkuma@redhat.com>
---
 docs-xml/manpages/net.8.xml | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/docs-xml/manpages/net.8.xml b/docs-xml/manpages/net.8.xml
index 37dfa2af694..892a33f38f9 100644
--- a/docs-xml/manpages/net.8.xml
+++ b/docs-xml/manpages/net.8.xml
@@ -1307,6 +1307,51 @@ against an NT4 Domain Controller.

 </refsect2>

+<refsect2>
+
+<title>ADS GPO</title>
+<refsect3>
+<title>ADS GPO APPLY [<replaceable>USERNAME</replaceable>] [<replaceable>MACHINENAME</replaceable>]</title>
+<para>Apply GPOs for user/machine.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO GETGPO [<replaceable>GPO</replaceable>]</title>
+<para>List specified GPO.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO LINKADD [<replaceable>LINKDN</replaceable>] [<replaceable>GPODN</replaceable>]</title>
+<para>Link a container to a GPO. <replaceable>LINKDN</replaceable> Container to link to a GPO. <replaceable>GPODN</replaceable> GPO to link container to. DNs must be provided properly escaped. See RFC 4514 for details.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO LINKADD [<replaceable>LINKDN</replaceable>] [<replaceable>GPODN</replaceable>]</title>
+<para>Link a container to a GPO. <replaceable>LINKDN</replaceable> Container to link to a GPO. <replaceable>GPODN</replaceable> GPO to link container to. DNs must be provided properly escaped. See RFC 4514 for details.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO LINKGET [<replaceable>CONTAINER</replaceable>]</title>
+<para>Lists gPLink of a containter.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO LIST [<replaceable>USERNAME</replaceable>] [<replaceable>MACHINENAME</replaceable>]</title>
+<para>Lists all GPOs for user/machine.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO LISTALL</title>
+<para>Lists all GPOs on a DC.</para>
+</refsect3>
+
+<refsect3>
+<title>ADS GPO REFRESH [<replaceable>USERNAME</replaceable>] [<replaceable>MACHINENAME</replaceable>]</title>
+<para>Lists all GPOs assigned to an account and download them. <replaceable>USERNAME</replaceable> User to refresh GPOs for. <replaceable>MACHINENAME</replaceable> Machine to refresh GPOs for.</para>
+</refsect3>
+
+</refsect2>
+
 <refsect2>
 <title>ADS LEAVE [--keep-account]</title>

-- 
2.17.1


--------------D1F77D56CDFECE2462A8C568--

