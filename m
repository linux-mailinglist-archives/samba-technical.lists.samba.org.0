Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFC698E41
	for <lists+samba-technical@lfdr.de>; Thu, 16 Feb 2023 09:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/+ONzo5A+eJ7xpgTIW2ZX1fm4dnwfQBHGig+85FZkAg=; b=yndN9iHgYp4ePAJgqgffv7ja4e
	DWxexJkyNn9uFORmrbcIQmiZdzjcC0ymqufBTUPKbqdBtH1ka8Sq4ncZvBpZREJagGv74jgyjlX8j
	R9knRaYKXEJE5/nJmJj+CaCHJZrzio02Tf0amCWmJDDt100A6AZvC49dXQN4pRJ250sz7Y50SK2ug
	Q9trpKK33BHdlzpP3hdY3QG64KUIDp8viuz32zyfM1kMUNZYesK7y3QwpuzK5KtPHCv4tsY/tlAjR
	enpEOjSWp5JRNcuaJxQykZ1QUFffALv1mdUst4ya/nSNJ1Dd3flBWY4iNbq8Gpr28b6s0SDWK9uRk
	WBIM3uRw==;
Received: from ip6-localhost ([::1]:62666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSZFp-00CfyD-BI; Thu, 16 Feb 2023 08:04:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pSZFf-00Cfy4-2b
 for samba-technical@lists.samba.org; Thu, 16 Feb 2023 08:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=/+ONzo5A+eJ7xpgTIW2ZX1fm4dnwfQBHGig+85FZkAg=; b=gNn42CE9EDlTjZqpGhyZWftQsS
 QY5MJn82ikQJL7WwAcRVfIe7SWBMrzuStVQaVWNTYwvIxzvXS/Y7H/Fgu4yH5C57pUPAq/01POnuU
 yckSBJQYmVRTE8f9dhtkqN0UKS/NR9wcpHi5YkLBv8t5IB65bB+jp6JZiVKSHrbBste0flPZkaSXV
 wss5GmuAOdj8JJDzprD9CFDtCXK5SeJTEIWH2s2CcLrCYgdTMjs78qccOWvuHPI25+9YADGTtdpAX
 +ifJ4xtGVzyUksPu0W5wqZWyUS0nZ56+d03eq8ljFmdS3gomdvjeV7pl4XpiBos8DUL6h6I1r2pUF
 YI7sBe36QtrI0r1pXyjEn5Njjva1jPqU2oKieLBeCI4SMhjxiNfh/3jIRcE+KO8I3nwhbcXooEU2m
 J6c4OJlQxQKOlnP2bMlnNex6tO3qSbaXy2M1N1zXi3o1+16DHZvIpzboBe0EfVDDK6uN+qs+6bI7e
 5yiLgYI6wimI8XS3E6IfRdIH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pSZFe-00E3cR-AH
 for samba-technical@lists.samba.org; Thu, 16 Feb 2023 08:04:22 +0000
To: samba-technical@lists.samba.org
Subject: Failing tests on Fedora
Date: Thu, 16 Feb 2023 09:04:21 +0100
Message-ID: <4782393.GXAFRqVoOG@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm currently trying to run 'make test' as part of the RPM build process 
(%check). So I'm trying to get everything working, but I'm seeing strange
issues and I need some help to track them down.

The errors happen only if I run a full 'make test' and I don't see them when 
running the test individually (make test TESTS="..").

Lets take a look at the samba.tests.samba_tool.gpo_exts.ad_dc_ntvfs test.

[2583(16283)/2929 at 1h59m32s, 15 errors] 
samba.tests.samba_tool.gpo_exts(ad_dc_ntvfs:local)
UNEXPECTED(failure): 
samba.tests.samba_tool.gpo_exts.samba.tests.samba_tool.gpo_exts.GpoCmdTestCase.test_vgp_access_add(ad_dc_ntvfs:local)
REASON: Exception: Exception: Traceback (most recent call last):
  File "/builddir/build/BUILD/samba-4.18.0rc2/bin/python/samba/tests/
samba_tool/gpo_exts.py", line 111, in test_vgp_access_add
    self.assertCmdSuccess(result, out, err, 'Access add failed')
  File "/builddir/build/BUILD/samba-4.18.0rc2/bin/python/samba/tests/
samba_tool/base.py", line 97, in assertCmdSuccess
    self.assertIsNone(exit, msg=msg.replace("\n]\n", "\n] \n"))
AssertionError: -1 is not None : exit[-1] stdout[] stderr[ERROR: Unable to 
find user or group "testuser"
]: Access add failed

The pattern is the same with other tests failing.

We create a test user with `samba-tool user add`, which succeeds! Note that 
samba-tool directly operates on the database here!

Next we try to do an operation via ldap:// and if you look at the error above 
it tells us the user we sucessfully createa a few moments agao doesn't exist. 

It looks like the samba process didn't recognize that that the database was 
modified.

I also see something like that with Kerberos tests, we create a user with 
`samba-tool add user` and then the KDC can't find it in the database => same 
pattern.

I don't have deep knowledge of the AD server, so hints how to track this down 
are much appreciated.


(I'm now running the tests on ext4, but the filesystem doesn't matter here).


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



