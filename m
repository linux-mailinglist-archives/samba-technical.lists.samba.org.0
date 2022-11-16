Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC962CB8A
	for <lists+samba-technical@lfdr.de>; Wed, 16 Nov 2022 21:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mpaHON3Aynlibc+LT6xg4VKSGYTpNbmj8R0PrvRytNM=; b=v2KFJMAcz/Mu8DNyQDUGkOj2eI
	kTPuyr4A4olA3M1ZMcA4nPurvHKezf0Cn3+7Qa05u4vB8DZhAhUq68PUQzQ8WV7uFHp1R+zkqI6gk
	YhZSn4s45sfTXYP22KWqhcU5O9jFgbdZYDK1HsJsL/QUpTarQz9rUdPxmjiAD5/b1AhRT1V49i31c
	W3aqEgtzZipJqK2Nas7PyMAXqMHzVSFif0sY2KGYFdSU2obWdnvXPiCsTH7mwfh9hsLAfmziFQBmR
	ix8ecir3nCHdKZbtNwcHYkNgF2pgcQvc4y4I/Gr/8exv9mwAthGz8ToFr07axPkrXqHCYuZu6XKne
	xW4tBzBQ==;
Received: from ip6-localhost ([::1]:23970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovPOI-00EaEA-Ol; Wed, 16 Nov 2022 20:52:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47988) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovPOD-00EaE1-PH
 for samba-technical@lists.samba.org; Wed, 16 Nov 2022 20:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mpaHON3Aynlibc+LT6xg4VKSGYTpNbmj8R0PrvRytNM=; b=ECsIOV680d3lC2gAw7qzth9Qso
 pWBObY3XamxWZTSAkQnpEfmYrKHbn1f7sisWNIe+l8T1gM6l1wDZo99kxxo2B9SxDrrZH6tOY9jnM
 IqzvuQCGcP7zkCPWedR8zPHVvZWQW+KFCup+IcCGJg7+ivu4ttV5Cku75bgxqoTnF9sGM+Qh+70De
 TSL6lub8NK0k3CtYaQpr7plf6qaloADYIRl1z6xTRq0QO8bX4SD/FRibShUyZtOklySK5FofQ6IMY
 1xqn7j/stjN/xhe3cGBiokXRoyvUNoIZcTKBSIMzl51x0lu/MC60dwd1Gp6W8vqaPOQjXDbhzKwtk
 ZXDJzlul50axqDxjtwEzCPZo98gnm2Vm5v74l4uHpexRX2P1k7SMrH6eepGJNgt2ElIj3VFGFfpfW
 3qVx2CCrXq8WjPosxsfN3QNyXJInBJsTUoc5QILXqZWIRywS/uvXA8AchhKzvVIPuPGGTXfDEQOFF
 XzwEP/6lS+CLPhzcYJWR2RSb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ovPOD-008x4V-Gn; Wed, 16 Nov 2022 20:52:09 +0000
To: samba-technical@lists.samba.org
Subject: Re: failing tests in the testsuite on debian
Date: Wed, 16 Nov 2022 21:52:08 +0100
Message-ID: <2264343.ElGaqSPkdT@magrathea>
In-Reply-To: <06c4ce9f-0dfb-8deb-7ef0-78ffd78e630c@msgid.tls.msk.ru>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <06c4ce9f-0dfb-8deb-7ef0-78ffd78e630c@msgid.tls.msk.ru>
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Saturday, 12 November 2022 21:24:21 CET Michael Tokarev via samba-technical 
wrote:
> ok. After quite some digging I found out that the selftest was missing
> two pieces - namely, tdb-tools (for tdbbackup) and lmdb-utils - spotted
> this in the test log, by a very good chance.  After installing the two,
> the --quick test looks quite a bit more promising now.  But there are
> failures still.

You should look at the bootstrap/config.py which packages we require to 
actually run selftest.

Or you just run:

bootstrap/generated-dists/ubuntu2004/bootstrap.sh


If a test is failing you need to debug it. Somewhere normally you have the 
expanded command printed out. Note it!

Check against which env the test failed and start it.

make testenv SELFTEST_TESTENV="ad_member"

You will get an xterm (you have to have xterm installed). Paste the expanded 
comment and it will run the test. You can add debugger or add options to 
increase debug output.

If you want to increase it on the server side use e.g.:

make testenv SELFTEST_TESTENV="ad_member" SERVER_LOG_LEVEL="1 kerberos:10"
 

If you want to learn more about selftest, start to read the https://cwrap.org/ 
and all the sub-pages!



Cheers


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



