Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AD396E1
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2019 22:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Uqj+y7MlGf+jr1v0zIWWiVduQFkkD0gJTcqGoONFlGQ=; b=cph29NwDgN8tlfbPVzXubmkefE
	F3blryDwDtbdhlVyeRvTUII/MskD/knbFIfnIuqi53t79RpJdhRTZklf9gUbC5aca6biOujwytLph
	q8WEGACXdw+oLA/jPD0rba1npiGGgJki4W1afg819Rk7G3NXHGqziLXHuscMGwui1FdblMIXhfSQv
	VIy3uysiYjFP6zJoC6YIim0EQM3gdOahwEdOLT5BaSIFAs8xBnAdtFKPqnBOGD2XI1SW5gdGtdwE3
	G8vmCDL3beg/Tq3X7avDEG94b99oOUpEQHIeYb2QQdrZq1lYHdw3fBQdgyTsukMzx6WmGN0fRweik
	X3B4GhBA==;
Received: from localhost ([::1]:60076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZLbY-000Rf6-8J; Fri, 07 Jun 2019 20:36:52 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:34810) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZLbS-000Rez-CV
 for samba-technical@lists.samba.org; Fri, 07 Jun 2019 20:36:50 +0000
Received: from [172.21.50.31] (unknown [80.155.4.82])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D2B7E812BA; 
 Sat,  8 Jun 2019 08:36:35 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1559939797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqj+y7MlGf+jr1v0zIWWiVduQFkkD0gJTcqGoONFlGQ=;
 b=fRZUzNuUyXP6AhgRAADHXUm+55QoUxUDeXEkrTMzNgvHaA5OtcRDqsRQJaCq5w9+h+HWF/
 R+ZFh27ivOIj2srbXmdi7b4zLmGSYG33fIAyaE6Fx1EAzFwDvgeu5bLJy0uvTe/FgMeVQ9
 92jgQcLolO93+dZXut762Fot9a7Ccs0plzHbhG4Q9QS8kXk1/+0qoYE4yaIsWCbh7z1FTu
 cjNVjAlD/2EEWtpGzGujw9uQ8zB0qoVMkQHSBgypVsFHq+pg44PSoKGJbiraZfqeX6pUKj
 VwsmA5zeRr5PLuJkapEIVFt8+ihW9Qk/A73hL3Vxa6hEZySLGsoZDNc/VdBh9g==
Subject: Re: recent flapping tests
To: Martin Schwenke <martin@meltin.net>, samba-technical@lists.samba.org
References: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
 <20190608012357.68de8832@martins.ozlabs.org>
Message-ID: <c58cec86-7177-18ac-ead1-7e5de351f330@catalyst.net.nz>
Date: Sat, 8 Jun 2019 08:36:29 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608012357.68de8832@martins.ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1559939797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqj+y7MlGf+jr1v0zIWWiVduQFkkD0gJTcqGoONFlGQ=;
 b=vCFee1nA+HGfF8oZiv2gtXkD1toGxlHFM4GN8mZXk7002zsNK4vkPqn6YbnOcFF2Ngy1Yi
 EddoXdI22tqi9zPicvlFMh/sVWf51kKJ/DvCBRxg4rvLh9OvoSpdqeHZXZi3s1eXmgLQvY
 N/wjIHTld5IdQevBXQe7sjuRgtpqK2IYkseY2o5PeuTKnQuX745SppWi0VvAlafp22uojB
 Qrl1UPWOaFRVO8yC5sSJ83igzqJJDNhQm+nTjixiz80k2Ea3YSTLbRR6xuimhjwLgt+msd
 fHwwpj385pGqIDh2QS6yYG/Kzil8G8x2XTPaKAtAI4w2ck8qY1fAR3ksW+c2SQ==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1559939797; a=rsa-sha256;
 cv=none;
 b=qj60kHnCGKXH9pZH231wlu1gRW++S/MRQ7TZgUQEs/6ZfXNdsqr4nTO1mpR7s0tdsVtyFx
 FPzYS9Wf3/3QFVVNrDF3t5aRJvtOL34PslCOTnSVLy1/QXVHFFsFgdr4nT2Zk10hOXlvC9
 gyrP+jkbiZhesMn31iPOBmzbdcaz5PPVf0lBtaEOMF9f2EHyVS9FgWlxdyHZwU86Cg1MeV
 II5UlFjrPXVwic4ibrw0aM/F+5dJ83zcBmx42hblGhBvxwv3v9dcA1JKEeWNMNCViu1/ZR
 ygBfrjFujEFA3uql4wVItwETmqWc30p+kFj8brtFkzlIhlvF60KKrTQ3W4Hmew==
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

hi Martin,

> Should be fixed by fixes pushed on 7 May.

I can confirm all your "shoulds". Also I can confirm the wisdom of
hedging with this "may":

>>    4 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh
> 
> May be fixed by fixes pushed on 7 May.  :-)

It happened twice since May 8.

The complete results for the last thirty days look like this:

$ ./parse-email/parse-autobuild-email --file-regex sn-devel-184 --since
2019-05-08
found 36 lines matching '(?:^(?:UNEXPECTED|\\*FAILED\\*))|(?:No space left
on device)' in 37 files matching 'sn-devel-184'
   8 UNEXPECTED(failure):
samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTestsWinbind.test_wbinfo(ad_member:local)
   6 UNEXPECTED(failure):
samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTestsWinbind.test_wbinfo_ntlmv1(ad_member:local)
   4 UNEXPECTED(failure):
samba.wbinfo_simple.check-secret.domain=SAMBA-TEST.wbinfo(nt4_member:local)
   3 UNEXPECTED(failure): samba3.raw.notify.mask(nt4_dc)
   2 UNEXPECTED(failure):
samba4.drs.getnc_schema.python(schema_pair_dc).getnc_schema.SchemaReplicationTests.test_schema_linked_attributes(schema_pair_dc)
   2 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh
   2 UNEXPECTED(failure):
samba4.ldap.password_lockout.python(ad_dc_slowtests).__main__.PasswordTestsWithSleep.test_pso_login_lockout_krb5(ad_dc_slowtests)
   2 UNEXPECTED(error):
samba4.drs.samba_tool_drs.python(vampire_dc).samba_tool_drs.SambaToolDrsTests.test_samba_tool_kcc(vampire_dc:local)
   2 UNEXPECTED(failure):
samba4.ldap.notification.python(ad_dc_ntvfs).__main__.LDAPNotificationTest.test_simple_search(ad_dc_ntvfs)
   1 UNEXPECTED(failure):
samba4.ldap.password_lockout.python(ad_dc_slowtests).__main__.PasswordTestsWithSleep.test_login_lockout_krb5(ad_dc_slowtests)
   1 UNEXPECTED(failure):
samba4.winbind.struct.lookup_name_sid(nt4_member:local)
   1 UNEXPECTED(failure): samba3.raw.notify.dir(nt4_dc)
   1 UNEXPECTED(failure): samba3.smb2.notify.mask(nt4_dc)
   1 UNEXPECTED(failure):
samba4.ldap.rodc_rwdc.python(rodc).__main__.RodcRwdcCachedTests.test_login_lockout_krb5(rodc:local)

That makes 36 failures in 120 tests, which is 30%. As ctdb went quiet,
everything else got worse.

Andrew says the top two were fixed a couple of days ago, so you might
think we can expect a failure rate of (36 - 14) / 120 = 18%, but that
isn't quite valid because some of those runs that flapped on the
authlog might have been destined to go on to flap on something else.
It depends on the order in which tests run.

cheers
Douglas

