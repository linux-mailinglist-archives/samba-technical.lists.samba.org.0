Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FC762736
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jul 2023 01:13:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7Lg/yz/5/vXrPEC/sfpLSIJbSTCjRc3+2hxbI2F3pnA=; b=jLpj79xekbcKrSxlDSizr7bFEO
	O0/MR2kIM4VMYcxDj9Mb62FYB9kFg0GJeZu4zlLSEpaIMlpR7bCphAEDZBo7pCUH2gjUp4QzlLmVE
	FDr6jKmwfE96MfPgMKJ5rM7F13Iqer5qX0o66Kl4QIFuYSroPmyz2dJJybD3hWOzpNrxCmXfA7dIx
	OUt8X8soGhkHUHwthMna8Kk7/1THZaHYct/q42+L90AlIXYSSahh41C2jtI6N1YXIu8jhOk1ZmcBT
	Tk1T2B6bpynMcA2Rjek8BDBqVbr/if9W4TrOwsYHOcpvlzpflHHwtUkyKqv9bdwrbAoDyEvK5V8U1
	l/x43HVw==;
Received: from ip6-localhost ([::1]:25778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qORDW-005LxA-0E; Tue, 25 Jul 2023 23:13:22 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:57948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qORDO-005Lwu-P8
 for samba-technical@lists.samba.org; Tue, 25 Jul 2023 23:13:19 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id AE2EE81E44; 
 Wed, 26 Jul 2023 11:13:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1690326784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lg/yz/5/vXrPEC/sfpLSIJbSTCjRc3+2hxbI2F3pnA=;
 b=nc9B7kDER9zykwAjvHMDoS6mhaJFq9aguHxbJp6biNR1Q4zhLaFGi93lJeYVqWLXPOLfOO
 O4HNaTuILl3EdhusX9s+sbnf2uJQTO1/WawLNZZaVS6hU48i3kwDMKjTY1I1hKV9PdcJR5
 XLN6YBpsP0cw9j2Nbh+9LSHFtWRd5GsPwO9ZOQu2t3Iy4Bs46xJCN4CVxqyi8mzyL7MMU/
 Mq5VhFBgCqlvBPu1iX1ZvuLMJJI746T0ALCyrlZKdqTB3LUkVnyIyBpzJeuJl8EX2Z+gqu
 g2bZFlcs2Wz6lXlSoEj9/4crW/VanS143wdlqkA+zZZfOMF/KXcYBLzOf5FvZQ==
Message-ID: <a5bbc383-c781-3f94-65c1-8fc4b325e8ab@catalyst.net.nz>
Date: Wed, 26 Jul 2023 11:13:01 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: increased `make test` logging in syslog with "debug syslog format
 = always"
Content-Language: en-NZ
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
 <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
In-Reply-To: <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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

On 25/07/23 17:42, Andrew Bartlett wrote:

> My intention was only to change the output format, not the destination,
> so as to get more information (time and host etc) in the logs as the
> previous logging to 'stdout' lost a lot of information.

Yeah.

I can get complete `make test` syslog silence with the following patch, but I 
don't know yet if it ruins some clever test of our logging itself.

cheers,
Douglas



commit 51e857217846e9555affb94b7b588d363e126128 (HEAD -> 
conditional-aces-the-true-story)
Author: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Date:   Wed Jul 26 11:04:53 2023 +1200

     selftest: avoid logging to syslog in `make test`

     Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>

diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
index 0bd77e906d5..3eb2388e298 100755
--- a/selftest/target/Samba4.pm
+++ b/selftest/target/Samba4.pm
@@ -1220,6 +1220,7 @@ sub provision($$$$$$$$$$$)
         # fruit:copyfile is a global option
         fruit:copyfile = yes

+       logging = file
         $extra_smbconf_options

  [tmp]


