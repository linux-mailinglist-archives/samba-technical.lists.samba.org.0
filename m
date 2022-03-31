Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE54ED52E
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 10:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=hrxrRIqcPVNujl9iukTCfQDHS7SND0ESPIl0D+gpqX4=; b=6Th17raDRomwnRUizdI1NS1eBL
	rJyXa/kG0rZylxqUQbEv37IID0vDO7kJjL7HGPMq+q0k8BTBOAN/w6FdJwFaxjuYkPYJt31agU5d+
	avtwXtmSI6miDmuPYRWvPqptZho5IFfvcO/suzExAWW0DV/AcveaoLcmYUlkUaMq0gE/fd8yl2rKG
	Lohg8o5Tb1SRWRqCTALZCnjq7DIi7bdHgQZ0/lzzK3d0NKJtP9uRSWGYYCa2D3smeov2+ADt2TwJU
	rrhkMV8n1FQ11SkjZmncUlW12hOak90gk0jYTfMVjUW+6pvOvq9KE1TTd0cT/KvghmqLfWBerQoLS
	Fr8oV2dA==;
Received: from ip6-localhost ([::1]:25874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZpoP-0071No-JU; Thu, 31 Mar 2022 08:05:45 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:44121) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZpoK-0071Nf-1I
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 08:05:42 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4F1DF40A50;
 Thu, 31 Mar 2022 11:05:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 799BC2A;
 Thu, 31 Mar 2022 11:01:51 +0300 (MSK)
Message-ID: <6955fdd8-c58f-dada-c257-a97dd6f14558@msgid.tls.msk.ru>
Date: Thu, 31 Mar 2022 11:05:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Offline question - waf install recompiles another 4k files after
 waf build built its own 4k?
Content-Language: en-US
To: Kees van Vloten <keesvanvloten@gmail.com>,
 Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
References: <03946334-dac7-96b0-405c-b24c4f2acb3b@gmail.com>
In-Reply-To: <03946334-dac7-96b0-405c-b24c4f2acb3b@gmail.com>
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

31.03.2022 10:51, Kees van Vloten via samba-technical wrote:
> Hi Stefan,
> 
> I am following the discussion on samba-technical around building packages for Debian, which you take part in as Samba team-member.
> 
> I am quite suprised that no one has pointed a Louis' packaging work so far. He is doing exactly the same a what Michael wants to achieve, or am I 
> completely mistaken?

We're working with him since the beginning of my involvement.
Actually I started this with a hope to help a bit - if maybe
he has not enough time or something small is missing ;)

Unfortunately it turned out he has very little expirence, ditto
for the previous maintainer of the samba package in Debian.
And, as also has been discovered, the debian packaging instructions
needed much more love than they received in a long time (like this
PYTHONHASHSEED thing for example, - the prob has been in debian for
years).

Louis did it as long as it Just Worked (after adjusting version inf).
But with 4.16, nothing worked anymore :)  So here we are.

Well, the package is almost ready, what's left is just small issues
here and there.  I'm waiting for the ongoing python3 transition in
Debian to settle down before uploading the new samba to debian, and
meanwhile discover various other fun issues to solve :)

And Louis knows what's going on. He just can't help because the
current situation requires far better overall expirience than he
has.

Thanks!

/mjt

