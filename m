Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 141564FA574
	for <lists+samba-technical@lfdr.de>; Sat,  9 Apr 2022 08:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/cmZa2JrkoXVUz2f02WEWqlD817WPcHXO7FezygOYCU=; b=0vUWM/9I5ypfRgi09KLo0n3UCC
	43ngEKcGL8GTNEaQlyjUxRrDPVSzxV6Wp/wQT7C/9NbZKkTIM4qegZCegwwPzbbPZMJYTJ2DpwX5W
	LGOZswEF2pEdd8r1qkFePnLco81MglFzfUPVgaFvjMTX5zuV7tei/w7YgzWMzoKshgo7+MriiVqYr
	LI8Hb0o0SHkMDLDSFxOU7t9VzBjojVQY9rSEEKfF7vNpz0biUrpS2IRZpHpp/XGLGEEiC7rJ50f/Z
	aUe28M9+CnqIDAqUAs2BZerA8Ibr9o3tninGbZC76q19yoQKa8TEqs89RRZyo+zGtB+NYCwD7bjXV
	cA4+Ij6g==;
Received: from ip6-localhost ([::1]:35324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nd4mq-00BH1r-Rs; Sat, 09 Apr 2022 06:41:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:34317) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nd4mc-00BH1h-Sp
 for samba-technical@lists.samba.org; Sat, 09 Apr 2022 06:41:21 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 66F1B40161
 for <samba-technical@lists.samba.org>; Sat,  9 Apr 2022 09:41:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1AB13352
 for <samba-technical@lists.samba.org>; Sat,  9 Apr 2022 09:37:30 +0300 (MSK)
Message-ID: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
Date: Sat, 9 Apr 2022 09:41:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: waf, PYTHONHASHSEED & -I order on other architectures
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

I'm having a build failure of samba on sparc64.  It fails due to finding
wrong include for <gssapi/gssapi.h>, as it has already seen before due to
PYTHONHASHSEED not being set, having python hashes in random order so -I
includes were unpredictable.

The good -I order is this:

  -Ithird_party/heimdal/lib/gssapi
  -Ithird_party/heimdal/lib

the bad is:

  -Ithird_party/heimdal/lib
  -Ithird_party/heimdal/lib/gssapi

(I picked up only the -I options for dirs where <gssapi/gssapi.h> exists).

This is stable on sparc64, all builds of samba-4.16 are failing due to
this very issue.

How to work around this?

The complete example command lines for both cases (compiling randomly picked
file krb5tgs.c) are below, the good and the bad ones.

Thanks,

/mjt

---
good:
/usr/bin/gcc -D_SAMBA_BUILD_=4 -DHAVE_CONFIG_H=1 -g -O2 -ffile-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security 
-MMD -D_GNU_SOURCE=1 -D_XOPEN_SOURCE_EXTENDED=1 -DHAVE_CONFIG_H=1 -fPIC -D__STDC_WANT_LIB_EXT1__=1 -D_REENTRANT 
-DCTDB_HELPER_BINDIR="/usr/libexec/ctdb" -DLOGDIR="/var/log/ctdb" -DCTDB_DATADIR="/usr/share/ctdb" -DCTDB_ETCDIR="/etc/ctdb" 
-DCTDB_VARDIR="/var/lib/ctdb" -DCTDB_RUNDIR="/var/run/ctdb" -fstack-protector-strong -fstack-clash-protection -Wno-error=discarded-qualifiers 
-Wno-error=cast-qual -Wno-error=missing-field-initializers -Wno-error=shadow -Wno-error=implicit-fallthrough -Wno-error=enum-compare 
-Wno-error=unused-but-set-variable -Wno-error=unused-const-variable -Wno-error=unused-variable -Wno-error=unused-result -DSTATIC_kdc_MODULES=NULL 
-DSTATIC_kdc_MODULES_PROTO=extern void __kdc_dummy_module_proto(void) -Ithird_party/heimdal_build -I../../third_party/heimdal_build 
-Ithird_party/heimdal/kdc -I../../third_party/heimdal/kdc -Iinclude/public -I../../include/public -Isource4 -I../../source4 -Ilib -I../../lib 
-Isource4/lib -I../../source4/lib -Isource4/include -I../../source4/include -Iinclude -I../../include -Ilib/replace -I../../lib/replace -Ictdb/include 
-I../../ctdb/include -Ictdb -I../../ctdb -I. -I../.. -Ithird_party/heimdal/lib/asn1 -I../../third_party/heimdal/lib/asn1 
-Ithird_party/heimdal/lib/gss_preauth -I../../third_party/heimdal/lib/gss_preauth -Ithird_party/heimdal/lib/base -I../../third_party/heimdal/lib/base 
-Ithird_party/heimdal/include -I../../third_party/heimdal/include -Ithird_party/heimdal/lib/krb5 -I../../third_party/heimdal/lib/krb5 
-Ithird_party/heimdal/lib/gssapi -I../../third_party/heimdal/lib/gssapi -Ithird_party/heimdal/lib/wind -I../../third_party/heimdal/lib/wind 
-Ithird_party/heimdal/lib/hx509 -I../../third_party/heimdal/lib/hx509 -Ithird_party/heimdal/lib/hdb -I../../third_party/heimdal/lib/hdb 
-Ithird_party/heimdal/lib/ntlm -I../../third_party/heimdal/lib/ntlm -Ithird_party/heimdal/lib/roken -I../../third_party/heimdal/lib/roken 
-Ithird_party/heimdal_build/include -I../../third_party/heimdal_build/include -Ithird_party/heimdal/lib/gssapi/gssapi 
-I../../third_party/heimdal/lib/gssapi/gssapi -Ithird_party/heimdal/lib/gssapi/spnego -I../../third_party/heimdal/lib/gssapi/spnego 
-Ithird_party/heimdal/lib/gssapi/krb5 -I../../third_party/heimdal/lib/gssapi/krb5 -Ithird_party/heimdal/lib/gssapi/mech 
-I../../third_party/heimdal/lib/gssapi/mech -Ithird_party/heimdal/lib/hcrypto -I../../third_party/heimdal/lib/hcrypto -Ithird_party/heimdal/lib 
-I../../third_party/heimdal/lib -Ithird_party/heimdal/lib/hcrypto/libtommath -I../../third_party/heimdal/lib/hcrypto/libtommath 
-Ithird_party/heimdal/lib/com_err -I../../third_party/heimdal/lib/com_err -Ithird_party/heimdal/lib/ipc -I../../third_party/heimdal/lib/ipc 
../../third_party/heimdal/kdc/krb5tgs.c -c -o/<<PKGBUILDDIR>>/bin/default/third_party/heimdal/kdc/krb5tgs.c.14.o -Wdate-time -D_FORTIFY_SOURCE=2


bad:
/usr/bin/gcc -D_SAMBA_BUILD_=4 -DHAVE_CONFIG_H=1 -g -O2 -ffile-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security 
-MMD -D_GNU_SOURCE=1 -D_XOPEN_SOURCE_EXTENDED=1 -DHAVE_CONFIG_H=1 -fPIC -D__STDC_WANT_LIB_EXT1__=1 -D_REENTRANT 
-DCTDB_HELPER_BINDIR="/usr/libexec/ctdb" -DLOGDIR="/var/log/ctdb" -DCTDB_DATADIR="/usr/share/ctdb" -DCTDB_ETCDIR="/etc/ctdb" 
-DCTDB_VARDIR="/var/lib/ctdb" -DCTDB_RUNDIR="/var/run/ctdb" -fstack-protector-strong -fstack-clash-protection -Wno-error=discarded-qualifiers 
-Wno-error=cast-qual -Wno-error=missing-field-initializers -Wno-error=shadow -Wno-error=implicit-fallthrough -Wno-error=enum-compare 
-Wno-error=unused-but-set-variable -Wno-error=unused-const-variable -Wno-error=unused-variable -Wno-error=unused-result -DSTATIC_kdc_MODULES=NULL 
-DSTATIC_kdc_MODULES_PROTO=extern void __kdc_dummy_module_proto(void) -Ithird_party/heimdal_build -I../../third_party/heimdal_build 
-Ithird_party/heimdal/kdc -I../../third_party/heimdal/kdc -Iinclude/public -I../../include/public -Isource4 -I../../source4 -Ilib -I../../lib 
-Isource4/lib -I../../source4/lib -Isource4/include -I../../source4/include -Iinclude -I../../include -Ilib/replace -I../../lib/replace -Ictdb/include 
-I../../ctdb/include -Ictdb -I../../ctdb -I. -I../.. -Ithird_party/heimdal/lib/krb5 -I../../third_party/heimdal/lib/krb5 
-Ithird_party/heimdal/lib/asn1 -I../../third_party/heimdal/lib/asn1 -Ithird_party/heimdal/include -I../../third_party/heimdal/include 
-Ithird_party/heimdal/lib/gssapi/gssapi -I../../third_party/heimdal/lib/gssapi/gssapi -Ithird_party/heimdal/lib/gssapi/spnego 
-I../../third_party/heimdal/lib/gssapi/spnego -Ithird_party/heimdal/lib/gssapi/krb5 -I../../third_party/heimdal/lib/gssapi/krb5 
-Ithird_party/heimdal/lib/gssapi/mech -I../../third_party/heimdal/lib/gssapi/mech -Ithird_party/heimdal/lib/ntlm -I../../third_party/heimdal/lib/ntlm 
-Ithird_party/heimdal/lib/hcrypto/libtommath -I../../third_party/heimdal/lib/hcrypto/libtommath -Ithird_party/heimdal/lib/com_err 
-I../../third_party/heimdal/lib/com_err -Ithird_party/heimdal/lib/hcrypto -I../../third_party/heimdal/lib/hcrypto -Ithird_party/heimdal/lib 
-I../../third_party/heimdal/lib -Ithird_party/heimdal/lib/wind -I../../third_party/heimdal/lib/wind -Ithird_party/heimdal/lib/hdb 
-I../../third_party/heimdal/lib/hdb -Ithird_party/heimdal/lib/roken -I../../third_party/heimdal/lib/roken -Ithird_party/heimdal_build/include 
-I../../third_party/heimdal_build/include -Ithird_party/heimdal/lib/hx509 -I../../third_party/heimdal/lib/hx509 -Ithird_party/heimdal/lib/ipc 
-I../../third_party/heimdal/lib/ipc -Ithird_party/heimdal/lib/gssapi -I../../third_party/heimdal/lib/gssapi -Ithird_party/heimdal/lib/gss_preauth 
-I../../third_party/heimdal/lib/gss_preauth -Ithird_party/heimdal/lib/base -I../../third_party/heimdal/lib/base 
../../third_party/heimdal/kdc/krb5tgs.c -c -o/<<PKGBUILDDIR>>/bin/default/third_party/heimdal/kdc/krb5tgs.c.14.o -Wdate-time -D_FORTIFY_SOURCE=2

