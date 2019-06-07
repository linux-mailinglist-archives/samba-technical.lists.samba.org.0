Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668C3881F
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2019 12:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=C96wBevB0sNbBmRX0nhMEx4f0Uy/URRUIj5JVF/1SGc=; b=X/jhjhaWPH1DcrJtACpQa1490C
	AKK7uymwrXEIkGhrxQRKbmcznfmYmrCnga+ZTqd/ZownnDU/QalII7/UzB5bhTdoaeUG7txih5u5G
	NPLbXiSfNm0ObfS1T3T+00kOkjyUmPARpYR7wYMsi0j3+h8HEFOwhU8G1H9wlTndvNpalQ9xW37gu
	eryKX+86fSNGEHpnRw2FVPsNKSvixfPXCbeZaCuL3OEVKit1T8+rEMkLd992kTbaJ9SRPgGawkffV
	WG9FOCJGJHlhLlKlWhhCm2ujTXMRMQS5IM3UcHaBLcfsrG2+++W0+Wc3L+YBCTS+nmt9cdo76IURP
	VYpn3ArA==;
Received: from localhost ([::1]:44514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZCL2-000NT5-WB; Fri, 07 Jun 2019 10:43:13 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:55900) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZCKx-000NSy-0p
 for samba-technical@lists.samba.org; Fri, 07 Jun 2019 10:43:11 +0000
Received: from [172.20.16.52] (unknown [80.155.4.82])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 65D7A81197
 for <samba-technical@lists.samba.org>; Fri,  7 Jun 2019 22:42:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1559904176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C96wBevB0sNbBmRX0nhMEx4f0Uy/URRUIj5JVF/1SGc=;
 b=vBynOn2caJ3iqGhQRWOSf2dw9sZzXJvYljHd4ROsZgMF48YG9ej/SWo4JBd2G4cy0YvDHJ
 sqcb+N0WB9drLE75//sjOqnwf/iiHQvcKyK/Wtmjm4/WCgLI/TgsZUJD6JTTQ8/S1Ttubw
 Ji2TwbdGSNGO9YsR1QwAESHjpPqKjQXFgNgeGd4MmCo26pkJzgqehpHitQVvI1nlDn4EyW
 8tVIvdsWmGT2czkQT5G5sn9HCkpl4Kd6C+h8iOo9HitwToJUL3tnZ+s3OFrbqY/qjg+CUz
 8yVWkxV4Lhtdnt2WpMlPW6umsScqEf78MW0/0HCyoccTyNx0Zt9C6CDJEYdHqw==
To: samba-technical <samba-technical@lists.samba.org>
Subject: recent flapping tests
Message-ID: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
Date: Fri, 7 Jun 2019 22:42:49 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1559904176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C96wBevB0sNbBmRX0nhMEx4f0Uy/URRUIj5JVF/1SGc=;
 b=YUG4mJuyb+mZaXgMaKEeJFS79i2d29eXCLij0rnITJI8TeI1EBO/nlrsmkLbrvY3GbLS1K
 O+xuF38S2Ea7Daty1bEVscX6IA6saHncQVnsAzLFWLBnGBjoC7uonAYMoTTybWQ1vlgMXN
 qGd5pGfIHbNpO5lWHb+fV/29qTJiU6jlzsEYaE53X11nUIXQVuClBn6k4qk3EFAVWRQHZB
 pq+MBdGvYrgFE8XISOb2iFzojP5DuUfqlUG9AyJQGjk9UuG9atzSRAbmHKO3wLd0XfxC8H
 4/1zYTDmbdmDTLqCiK2ktMprmGtAeKpqYtfo+gmHtxbmfUMg3yEjFQi8CzXCpw==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1559904176; a=rsa-sha256;
 cv=none;
 b=i6nzj5gO+CLzqSzNh8VzYG18RWNF69VrDAgbHDDof8ZIsJfvcWCw1zZqFK1yJCw5+w/Wm/
 kP7hxbcxT2XcXxHIk3vgYfWqQuIABJHKucFo4ESdoR8HVMBg4M+bNQoHLLYOIfOgsVIVq9
 5uPQq8+EmzBEiZFfjvsIOzVK7GPgNFze942jidK/kvI18VsxUN/rt9MACfxSU7xkMIFi3a
 36xrYfZ7ZFkV5PpA4cZrNLz09bXDFOOtdVrI84C8k1W1CTHUbacptmdq+uGc2xnY951Zc8
 lG8Fa4/mQ+BBR9IsOQ7FmKhb7w5Ti7XoPI0hkEcBo/10x2xWNuxD6ScXPqvgaA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For a while this year we ran tests on both Ubuntu 14.04 and 18.04.
Comparing the two might reveal tests whose flappingness is sensitive
to the underlying environment.

Looking at the ones that flapped more than once, first on 14.04, then
18.04:

$ ./parse-email/parse-autobuild-email --file-regex sn-devel-144 --since
2019-03-01 --until 2019-04-26
found 44 lines matching '(?:^(?:UNEXPECTED|\\*FAILED\\*))|(?:No space left
on device)' in 52 files matching 'sn-devel-144'
   6 UNEXPECTED(failure):
samba.wbinfo_simple.check-secret.domain=SAMBA-TEST.wbinfo(nt4_member:local)
   5 UNEXPECTED(failure): samba3.smb2.notify.valid-req(nt4_dc)
   5 UNEXPECTED(failure):
samba4.ldap.notification.python(ad_dc_ntvfs).__main__.LDAPNotificationTest.test_simple_search(ad_dc_ntvfs)
   4 *FAILED* tests/simple/18_ctdb_reloadips.sh
   3 UNEXPECTED(failure): samba3.smb2.notify.mask(nt4_dc)
   2 UNEXPECTED(failure): samba3.raw.notify.mask(nt4_dc)
   2 *FAILED* tests/simple/60_recoverd_missing_ip.sh
   2 UNEXPECTED(failure):
samba3.smb2.notify-inotify.inotify-rename(fileserver)
   2 UNEXPECTED(failure):
samba4.winbind.struct.lookup_name_sid(nt4_member:local)
   2 UNEXPECTED(failure):
samba.tests.samba_tool.user_wdigest.samba.tests.samba_tool.user_wdigest.UserCmdWdigestTestCase.test_Wdigest01(ad_dc_default:local)


$ ./parse-email/parse-autobuild-email --file-regex sn-devel-184 --since
2019-03-01 --until 2019-04-26
found 47 lines matching '(?:^(?:UNEXPECTED|\\*FAILED\\*))|(?:No space left
on device)' in 53 files matching 'sn-devel-184'
  10 UNEXPECTED(failure):
samba.wbinfo_simple.check-secret.domain=SAMBA-TEST.wbinfo(nt4_member:local)
   5 UNEXPECTED(failure):
samba4.ldap.password_lockout.python(ad_dc_slowtests).__main__.PasswordTestsWithSleep.test_login_lockout_krb5(ad_dc_slowtests)
   4 UNEXPECTED(failure): samba3.smb2.notify.valid-req(nt4_dc)
   3 UNEXPECTED(failure):
samba4.ldap.notification.python(ad_dc_ntvfs).__main__.LDAPNotificationTest.test_simple_search(ad_dc_ntvfs)
   2 UNEXPECTED(failure): samba3.smb2.notify.mask(nt4_dc)
   2 *FAILED* tests/simple/60_recoverd_missing_ip.sh
   2 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh
   2 UNEXPECTED(failure): samba3.raw.notify.mask(nt4_dc)
   2 *FAILED* tests/simple/27_ctdb_detach.sh


The metric of significance in this comparison is that I notice
something. I notice:

* password_lockout...PasswordTestsWithSleep fails 5 times in 18.04
  but only once in 14.04.

* 18_ctdb_reloadips.sh fails less with 18.04.

Everything else (and possibly these two) can be written off as noise.


Now I'm switching to looking at all our 18.04 bugs since March 1,
not just the ones that overlap with the final days of 14.04.


We had 17 wbinfo related failures:

  17 UNEXPECTED(failure):
samba.wbinfo_simple.check-secret.domain=SAMBA-TEST.wbinfo(nt4_member:local)

16 notify related:

   5 UNEXPECTED(failure): samba3.raw.notify.mask(nt4_dc)
   4 UNEXPECTED(failure): samba3.smb2.notify.valid-req(nt4_dc)
   3 UNEXPECTED(failure): samba3.smb2.notify.mask(nt4_dc)
   2 UNEXPECTED(failure): samba3.raw.notify.dir(nt4_dc)
   2 UNEXPECTED(failure): samba3.smb2.notify.dir(nt4_dc)

16 that had something to so with ctdb:

   5 *FAILED* tests/simple/27_ctdb_detach.sh
   4 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh
   2 *FAILED* tests/simple/60_recoverd_missing_ip.sh
   2 *FAILED* tests/simple/18_ctdb_reloadips.sh
   1 *FAILED* tests/simple/32_ctdb_disable_enable.sh
   1 *FAILED* tests/cunit/run_event_001.sh
   1 *FAILED* tests/simple/91_version_check.sh

16 auth_log_winbind failures:

  10 UNEXPECTED(failure):
samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTestsWinbind.test_wbinfo(ad_member:local)
   6 UNEXPECTED(failure):
samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTestsWinbind.test_wbinfo_ntlmv1(ad_member:local)

Nine password lockout related:

   6 UNEXPECTED(failure):
samba4.ldap.password_lockout.python(ad_dc_slowtests).__main__.PasswordTestsWithSleep.test_login_lockout_krb5(ad_dc_slowtests)
   3 UNEXPECTED(failure):
samba4.ldap.password_lockout.python(ad_dc_slowtests).__main__.PasswordTestsWithSleep.test_pso_login_lockout_krb5(ad_dc_slowtests)

Five of these:

   5 UNEXPECTED(failure):
samba4.ldap.notification.python(ad_dc_ntvfs).__main__.LDAPNotificationTest.test_simple_search(ad_dc_ntvfs)

Five claiming to be about audit:

   2 UNEXPECTED(failure):
lib.audit_logging.audit_logging.test_audit_get_timestamp(none)
   1 UNEXPECTED(failure):
samba4.dsdb.samdb.ldb_modules.group_audit.test_audit_group_json(none)
   1 UNEXPECTED(failure):
samba4.dsdb.samdb.ldb_modules.group_audit.test_audit_group_json_no_event(none)
   1 UNEXPECTED(failure):
samba4.dsdb.samdb.ldb_modules.group_audit.test_audit_group_json_error(none)

Five RPC failures:

   1 UNEXPECTED(failure): samba4.rpc.backupkey with
seal.backupkey.server_wrap_encrypt_decrypt_wrong_key(ad_dc_default)
   1 UNEXPECTED(failure): samba4.rpc.altercontext on ncalrpc with
validate.altercontext(ad_dc_default:local)
   1 UNEXPECTED(failure): samba4.rpc.altercontext on ncalrpc with
bigendian.altercontext(ad_dc_default:local)
   1 UNEXPECTED(failure): samba4.rpc.altercontext on ncalrpc with
seal,padcheck.altercontext(ad_dc_default:local)
   1 UNEXPECTED(failure): samba4.rpc.backupkey with
seal.backupkey.server_wrap_decrypt_wrong_r2(ad_dc_default)

And six others:

   2 UNEXPECTED(failure):
samba4.drs.getnc_schema.python(schema_pair_dc).getnc_schema.SchemaReplicationTests.test_schema_linked_attributes(schema_pair_dc)
   2 UNEXPECTED(error):
samba4.drs.samba_tool_drs.python(vampire_dc).samba_tool_drs.SambaToolDrsTests.test_samba_tool_kcc(vampire_dc:local)
   1 UNEXPECTED(failure):
samba4.winbind.struct.lookup_name_sid(nt4_member:local)
   1 UNEXPECTED(failure):
samba4.ldap.rodc_rwdc.python(rodc).__main__.RodcRwdcCachedTests.test_login_lockout_krb5(rodc:local)


Last time I did this (2019-02-22) I found:
> So at the crudest level we have:
> 
> wbinfo:         11
> replica_sync:   10
> notify:          8
> samba_kcc:       3
> all others:      5

Now we have:

wbinfo:            17
notify:            16
ctdb:              16
auth_log_winbind:  16
password_lockout:   9
ldap.notification:  5
audit:              5
rpc:                5
others:             6

which looks worse if you don't take into account the periods of time.

The to 2019-02-22 numbers are looking at ~53 days or 212 test runs,
while today's numbers look at ~99 days or 396 tests. Converting to
percentage chance of failure per test:

wbinfo:             4.3
notify:             4.0
ctdb:               4.0
auth_log_winbind:   4.0
password_lockout:   2.3
ldap.notification:  1.3
audit:              1.3
rpc:                1.3
others:             1.5
in total:           24

That is, our flakey tests have been failing 24% of the time. In the
previous time period, they failed 17.5% of the time, so it is
unfortunately true that we made things worse.

cheers,
Douglas

