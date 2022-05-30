Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70A537635
	for <lists+samba-technical@lfdr.de>; Mon, 30 May 2022 10:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=FF0/kn0e8JUBJ1Tl8wThVb3mkdEvSnZvDjG0KKn5F9Q=; b=A2bd13AVvV7O4B3GvigsecaxAe
	zS6YOjRKuGm24F1uOl5CAXWim+4rh2Xmk/QrDqz7YtvoU3sTOusFKXOuzj8ImiyJc2XoalX66kXya
	IYDpBrLCHN+dgGYLv4/MTgpBcMXhQ8Hk9dmvo4io/MC3PYBMw+ZovwfU/9jwpPlhoS0EjvMKcFmQT
	uLmE1sb2Y0Cxgo8o/gCrbNXu63YgimOIN/WrZdqd0zcUMuSknjdz5geBZQO6F7KpEOyGGdavMxtYW
	HGh4OnxIBLn/nucp0i3Zl0wYoi/Ct4QTQobt/Ikw+D6kqRv7U4epX7N0w5Q+zwygfF47+lna4ukg5
	LB9QI10g==;
Received: from ip6-localhost ([::1]:61780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nvaQF-003lVA-Cv; Mon, 30 May 2022 08:06:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nvaQ8-003lV1-J7
 for samba-technical@lists.samba.org; Mon, 30 May 2022 08:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=FF0/kn0e8JUBJ1Tl8wThVb3mkdEvSnZvDjG0KKn5F9Q=; b=04zgSn5gK7KXytH6c5MZC1pqkQ
 zVLlYkYipBiYZQBYxlgFAxC3S512IFQRSQSc7DN+T940RWQ1GWLsuMhFj5ENCQyr8gdUxFAEj+ZO5
 FY5Y3tK9O7rhR4AecZRasRMYp4eQhcsIZkJn+VFP9t0YN2DujuFNB53rwnthDH2m9dQyByiBfaWT/
 Ge+PlrztpQ/k3rN3CTa8amEa3Rx0tH8K1RfxlOjEpQCws8tBftakDoYyg9wjzF3m8JAwwKhQR7ddD
 zhbTn/WsmYuTq41G8q5K4t/v/kji9cqKF3DSByPXmFZqVS7jcJfkOw9+KwzyWhAekcwQXaNQ2Hqbx
 I70LwCHXJ5CFfkqU8TfxGjt0c3/5DXJlNtmecjYy2AtaAeuoub0xJLBSatVORL6fRCowGyh1ZD2qc
 AhiQRqRJBOZoBCzw8z0nAMWMZQ4u7i8qFJHOzz7A86qcRpRLe1AtR6ETX2nMRT/1exnwV71XPtyGx
 Ie6HfH3ClCdcvRTFRpELIEHQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nvaPz-003AX2-3K; Mon, 30 May 2022 08:06:27 +0000
Message-ID: <0c51e268e2a0ee77903d4620e9727f947ef5abe2.camel@samba.org>
Subject: Re: internal backtrace support - libunwind or backtrace_symbols?
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 30 May 2022 20:06:21 +1200
In-Reply-To: <0bcbbf18-94b0-b859-7961-eb9c969b392a@msgid.tls.msk.ru>
References: <ef350519d999afb7e2ba44b90744150a691777a5.camel@samba.org>
 <0bcbbf18-94b0-b859-7961-eb9c969b392a@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Fco Javier Felix <ffelix@inode64.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-05-30 at 10:49 +0300, Michael Tokarev wrote:
> 
> Now I looked at the traces he's getting, and it looks like the prob
> there is
> 
> not the lack of a backtrace but a corrupt stack which can't be
> backtraced.
> 

There was also a message from me that made it seem that no backtrace
was a packaging problem.  I had got in my head that backtrace_symbols()
was for some exotic platform, not a standard glibc feature. 

Anyway...

> I'll disable libunwind on debian samba build now once things are
> clear.
> 
> And this mess is what I'm getting when trying to be just a bit
> helpful
> 
> but in a rush.  Please excuse me for the noise.  

No worries.  I'm glad to got a moment to check some facts properly.  We
will get this as right as possible soon!

> Unfortunately I still
> 
> don't know what to do with Dirk's case.

Yeah, I've not fully understood it but likewise nothing has jumped out
at me yet.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


