Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 738778D2CCE
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2024 07:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1uwUersqeJjMIloahKVdr3TjuipPtLUBqXhu2msHn28=; b=ObvzRCDfmBolPHrW8JdJnz95TM
	TZA9puZSDFHPdnT5RiE88MOHAkE8fPNBHNaBzAXi0tM+HRvkjqn5WLAjUwA19jQ+/+lXttTQ0mLtZ
	5u/P+1t0B+Hgo9+PF9eeT28wheVDhT6bgs5sQcjE0/2ZoiE2ILs97Ar55iXZjUoejXRZWAiOwB4uA
	699w4SlcPBpSDBZr8DlD5IfWNH2A69SA4X+vX4onlof0wFXghho4aY1gmwc8pz8sRD3uiJQNZ6GrJ
	5db8tfpI/23IPsdd45ohS/JM7+A0LpIbbfaN5ZJ9YJXCnWjXw05eYz3ZvZalD3QXQqxgNkyP+a1uL
	Dvnvth5w==;
Received: from ip6-localhost ([::1]:48098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sCCL9-00ADCi-4o; Wed, 29 May 2024 05:59:11 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51811) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sCCL5-00ADCb-H8
 for samba-technical@lists.samba.org; Wed, 29 May 2024 05:59:09 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 11F6E6B1E1;
 Wed, 29 May 2024 08:43:16 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id AE583DA056;
 Wed, 29 May 2024 08:42:38 +0300 (MSK)
Message-ID: <5dc54a9b-9a65-4dad-afa0-fa25d684c205@tls.msk.ru>
Date: Wed, 29 May 2024 08:42:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SAMBA_VERSION_VENDOR_SUFFIX in VERSION
To: Andrew Bartlett <abartlet@samba.org>, samba@lists.samba.org
References: <61470965da3082bca8589558676204b96164dfaa.camel@samba.org>
Content-Language: en-US, ru-RU
In-Reply-To: <61470965da3082bca8589558676204b96164dfaa.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

29.05.2024 00:42, Andrew Bartlett via samba-technical wrote:
> Kia Ora Samba packagers,
> 
> I just wanted to ask nicely if you could fill
> in SAMBA_VERSION_VENDOR_SUFFIX in the VERSION file when you build
> Samba?
> 
> Debian does it like this:
> https://salsa.debian.org/samba-team/samba/-/blob/master/debian/rules?ref_type=heads#L163

That's an ugly hack really.. :)

It'd be much better if samba had supported a way to specify version
suffix at configure time on command line, like, for example,

  ./configure --local-version-suffix="FooBar-432" ...

or something, like many other software packages does.  Or at the very
least, by specifying it in an *optional*, not included in the upstream
source, file.  Changing an upstream source like this is the ugliest
hack debian samba package now has, I'd say.

(This wasn't that ugly before, when we used a patch-based change to this
file in standard-for-debian place, since quite a few fixes to upstream
issues are needed anyway.  This sed-based approach was used in order to
simplify difference between debian and ubuntu samba packages.  It is
ugly because debian/ubuntu needs a way to undo any distribution-specific
changes to the upstream source, so I had to have a way to undo this.
Which can be made less ugly I guess..)

Myself, I dislike to add such "branding" to samba, in my view it shows
a disrespect to samba upstream developers, - it is samba, not debian-samba.
But that's just me it seems.

Thanks

/mjt
-- 
GPG Key transition (from rsa2048 to rsa4096) since 2024-04-24.
New key: rsa4096/61AD3D98ECDF2C8E  9D8B E14E 3F2A 9DD7 9199  28F1 61AD 3D98 ECDF 2C8E
Old key: rsa2048/457CE0A0804465C5  6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
Transition statement: http://www.corpit.ru/mjt/gpg-transition-2024.txt


