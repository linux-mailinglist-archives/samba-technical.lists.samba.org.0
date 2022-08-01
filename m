Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44F586F7B
	for <lists+samba-technical@lfdr.de>; Mon,  1 Aug 2022 19:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/y97U8MZkfW7qK+QJcpwexMElJ6RxsFfd1LgCTqV++0=; b=6KtBrvg8gJvH9YY5S+Q3aiKqeD
	FfjUaGvLnW14I/vi5dM+GmZKKqScLL8f8bqGIMm6W2ls6Ch1iAmflADzktOlOmP1Q3NWITkbHwsY6
	JWcsEFy9ThDNKY1wK5schaTxzYl6Drv1dWMWFHWDnUnTLbm/nmVsCXYOMxzI3JmDmitLn8c4XOLJm
	9rnlJ7RNQF7B1Lhv9ZRCmDm2GkFj4IqWAbJIvTl774M7WdMN/y8es406YaSl8KTEJfO2JjZf01IpK
	WcD0GPXaoDVmfQYV/7yDvFF84hu0Go0YpMhmrZv+UJX/1v2DcUWpDswXThuBxqxWsQzXdvbesy6Cy
	kzffEHFg==;
Received: from ip6-localhost ([::1]:26340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIZ6k-004pSw-JE; Mon, 01 Aug 2022 17:21:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25314) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIZ6g-004pSn-3R
 for samba-technical@lists.samba.org; Mon, 01 Aug 2022 17:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/y97U8MZkfW7qK+QJcpwexMElJ6RxsFfd1LgCTqV++0=; b=fnJdK3hV+uWZfOebm5e1QTm/Ab
 Q0HxCBYeXOz3pbPrT6orPGaI6iCmS8l9OMALyrs2Qpyy/4JaMS8uxLvlwBQLSbHa+PzCQJTxxbiP2
 Ow/zwCzybinIeyoaMEQLb0jgcjDn1wY8xFy198ssFKXEUnHRiijH+uMx2OlBn5H7WYEOfpPygp61M
 1JNirrC3Lmx+wXQLgl+Zhz5UnygEstY7FWfcWkm+o2YQ4gGtsNT41pyu7vNsMt6D6zsZpSq1Mg3D+
 1w287GN4uM17uDjcQBtrmmsBcgRSHE0UVO0NGAWmKtADCntAUSAvZxsYy9Zwse1yrcysXe/FKPxVh
 n23Yr/HYHizhaTVx/BcO/MIwuT4FKFgsnhjv99FBMf/45y9hiBpvmwct5jOWBphlB6pd6T10lYa+J
 hgkQb4WpQmsOoVR7IQPuJakjbH/iBuTE2GyE5ev5xGbKkUTuGXU8C8AU5okSbSWJW3TPdJgEFb1N+
 uRsAlzQ0Wun/kTNe542HMAn7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oIZ6e-007cNi-RV; Mon, 01 Aug 2022 17:21:29 +0000
Date: Mon, 1 Aug 2022 10:21:24 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: running only selected tests in samba sources
Message-ID: <YugLlNwmCwmWDfPG@jeremy-acer>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 01, 2022 at 05:35:15PM +0300, Michael Tokarev via samba-technical wrote:
>Hi!
>
>Is there a way, after successful build of samba source, to run just selected tests
>without running whole testsuite, *and* without (re)building everything with the
>--enable-selftest option?
>
>Many tests do not require this option to be enabled. For a very simple example,
>consider lib/ldb/ tests - when ldb is built from its own separate source
>tarball, it's easy to run its tests. But when it is built as part of whole samba
>source, an attempt to run ldb tests - even by providing the right test selection -
>still fails due to main samba wscript checking if --enable-selftest has been enabled.
>
>In Debian we used to build libldb from its own source, and running a testsuite there
>has been useful. But now we build it from main samba source tree and we can't run
>the testsuite anymore.
>
>Many more other tests can be useful without --enable-selftest too.
>
>I'm about to patch wscript to omit checks for --enable-selftest options in wscripts..

make test TESTS=(wildcard test name)

for example, to test only the SMB raw.streams tests:

make test TESTS=raw.stream

