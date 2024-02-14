Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F17438551B5
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 19:12:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3LAAnGuUZb0xpUeR0snrVclRo24g9PeTVSyAtKGjo4A=; b=gE6pFfBn6Dees32G7PXHJiWSEO
	w9ey0MPRxQO5bh4FjWN0v17c/UAuHsn7s5catujqrbFUXrD1WV1+ZiuFzjJ5tyTe3mZP+tEVfpTHC
	o6oIYTVRDBsBc6yhAfKXpA8w9ulgblkRTXr3O7WYM+vvtisEKnLEogdoFl0CCClujjyz+CQHeGcTC
	stn3eC8OGqTa9/8Y8MGh0qr0P6iNNSuBb7EPODFzHWTXcHYR6UCVwZjnu/KSQGVzVrVf9GxdKTUbc
	P9SlpTFd3kyhZLsYFWoAIorv7MuwbusuHPPWyBcMk9qIud5SB3nTYG4eXWtPeV2u2OaqUjLDyaaoi
	4vk7NojA==;
Received: from ip6-localhost ([::1]:46708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raJjK-008TmF-I0; Wed, 14 Feb 2024 18:11:35 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:40843) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raJjD-008Tm7-Tr
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 18:11:30 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6A1434D50C;
 Wed, 14 Feb 2024 21:11:27 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 81A707F394;
 Wed, 14 Feb 2024 21:11:19 +0300 (MSK)
Message-ID: <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
Date: Wed, 14 Feb 2024 21:11:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking to once again re-bundle LDB
Content-Language: en-US
To: Alexander Bokovoy <ab@samba.org>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru> <Zcz2oHdkRyYgJK6E@toolbox>
In-Reply-To: <Zcz2oHdkRyYgJK6E@toolbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Andreas Schneider <asn@samba.org>,
 Michael Tokarev via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

14.02.2024 20:21, Alexander Bokovoy via samba-technical:
> On Срд, 14 лют 2024, Michael Tokarev wrote:
>> 14.02.2024 17:46, Alexander Bokovoy wrote:
>> ..
>>> We do rebuilds of the whole stack in Fedora if bots detect samba ABI had changed. So for us it is not a problem.
>>
>> It's easy to do with "current" Fedora release.  It's entirely different
>> question when you want to provide current samba to a previous Fedora
>> release.  And that's where the problem is, - providing "backports" of
>> current samba to previous releases of distributions.
> 
> If you are building packages on top of RHEL by replacing existing
> packages there, you are responsible in fixing all breakage that new
> packages would introduce. It is maintenance work that one needs to
> consider when providing alternative builds, regardless of a
> distribution.

Exactly.  Ditto for debian. Even debian backports, while being part of
official debian and using debian infrastructure, needs additional work.
It is good if a new version does not introduce incompatibilities, -
this way it can be provided at less work to previous releases.

..
>> Yeah, it would be best to build samba against mit krb5, if it were a
>> supported way.
> 
> It is supported. It just provides a bit different set of features
> compared to Heimdal-enabled Samba builds. See our talk at SambaXP'23 for
> details.

I know it works, and it's kind of supported, with --enable-experimental-mitkrb5-kdc
or something.

The thing is: personally I don't have resources to support it by my own
in debian. Everything I do there, I do at my "free from work" time, I
don't know how all this AD-DC thing work.  After all, my only intention
when I come here was to fix a bug in samba form which I suffered in my
work (had to restore lots of user profiles lost due to samba data
corruption), and am still there because it was not "just flip this
one bit and it all works" thing :)  So I entirely rely on upstream
samba for almost all support work.  And there, MIT-Krb5 AD-DC is
"not supported".  Hence that's what I mean above :)

/mjt

