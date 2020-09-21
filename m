Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A247271E88
	for <lists+samba-technical@lfdr.de>; Mon, 21 Sep 2020 11:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=E7cm+EWw7/3wbUapyRwlyHomgflezz4KkmcePoyvkxg=; b=X0fr6wF7kyDFiqV7TsYo8N4r07
	BVF334Dxdeo+B3lscluH6WtcOLoJCtYPMtxJbqfX9hmz14iY6bNZgHRaQug233M1WX26rjdy58kTH
	SsCSwpFFHmx9UL5XGFi6Zqx5itSK8sLAgmzW42lG6BMwP7XjAWOrTqqiQau4G54f6rrqE7V/A8k0n
	ZZwrlptB05G2NqwBseMo5cDvfD8NSuFSc738ezLQjiH4YpG+eWPtq0XrSHVWac+Q6TT5GiTeNy7hV
	ghLtWRtwGR9wkelubFqBY4M1w6QwysvxlLz5yECK2CJfimucjiZRSqUpzi4i8R8qAFEdIBF6YheL/
	8wNfoAPA==;
Received: from localhost ([::1]:20676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kKHmo-006URS-1B; Mon, 21 Sep 2020 09:07:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27526) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKHmi-006URL-Uj
 for samba-technical@lists.samba.org; Mon, 21 Sep 2020 09:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=E7cm+EWw7/3wbUapyRwlyHomgflezz4KkmcePoyvkxg=; b=LmUEDNrx9bbzWjbL0g/78awSqC
 E3HCfFFCOpcm1cdjuDxAoH1BkHwxgosHNOw9gQFh2vzSmodYzJy91d11I5PfnwqHAfszw2lqmCYLd
 nNSjaAnODklThaIySivy93LNwV/I5jWHCAegwRPkD/gAiZDuff4Zm0vk8Z9unrv/dgqBHWKZ/m+vY
 Ck3QYVl540faJ0HRm/NFN2+Mzk6+PkAVtu8ZMnIyi4AsD7TQFiSWMvueVkTb9loqoyvcAP34MWmrA
 MCPEnNEz323IkxHF61buhESU59q/7r+iy08+k6vwoE85SOSYaiq+m4n7bdoSLZr/hzVQ8mnipDDvM
 jiGO3vACy/rNq0K/mmEXFm3tN7LQ40n/dKotAlh/yzbtIUMUBPrk5Rwh4+NU7oYkp8kd0T4NDGHIp
 u0v6IqY1LZU6B7+kU1wrLTUlLNS00TtH4hr0YSxSb16GCHHxgqFh3hrk9/Ie2UoEkh5RQLenALyBy
 3UYfshmxfpuxTXEv6v9DljT6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKHmh-0002wy-SH
 for samba-technical@lists.samba.org; Mon, 21 Sep 2020 09:06:56 +0000
Message-ID: <1aa07238dd7c207b8479ff08853cb0c9e33d4f08.camel@samba.org>
Subject: Microsoft's Windows protocol test suite: on linux!
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 21 Sep 2020 21:06:49 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The latest release of the file server testsuite apprently runs on
linux.

https://github.com/microsoft/WindowsProtocolTestSuites/releases/tag/4.20.9.0

Integrating this into our test infrastructure would be pretty epic!

A while back Garming and others put in massive efforts into automating
the running of some windows protocol tests on Windows and it never
really worked, so this is really interesting news. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




