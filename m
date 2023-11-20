Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D087F0A4D
	for <lists+samba-technical@lfdr.de>; Mon, 20 Nov 2023 02:27:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=A8c5annXVh0UST1ewuA2YaKCl50zQk8oyx6JOimR534=; b=RlKiozFcbeHF+b+rAKWqdiKlMn
	IW5Z8QTFjM9aPZ3V7/HMTnqxPx+mOjDVaxYvIYRAX/onRptQfcNl84eFW+wjIUfokIZN8D07u9zRE
	7p0luss5IvdTCLRJStHchotXtAI418ymng3uHQctNb5l5a4duIE4YwSwSjpdwgWZ67gwRL7E7OH7t
	ahxvZVuV8i4ss623msumbLiIXaqn6QTEi9h09r/dQtnEmNATptbWZ+RsfYUCSphQw87Cm+GJoon8O
	Vk9KtsdtmL6MQDucEymU72X5K+1RJfxrL3qb8bbhOa8Qm87rcaO6ZC0QLydje4L7hFgyGWkfibTFQ
	wjRAUEVg==;
Received: from ip6-localhost ([::1]:25500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r4t43-008u87-RF; Mon, 20 Nov 2023 01:27:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r4t3w-008u7x-RB
 for samba-technical@lists.samba.org; Mon, 20 Nov 2023 01:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=R3giTL7+8drvAEFyF1c75ewbnk0KXe5/YVNTxtJNGAE=; b=EVWkBcykqdHh1yA2EoceV8UiTU
 ey/yY/uWBVQpJhyr5h+tB7eoOfTqye2g4RR4bQgcn8TbcyAq9QP8foLy2JLNoQYa6V9Mx4xjdp8l4
 OmhFY31oI4BwDNlfBgchwnBH9oxkwnqwRMyQqbyLfjoB2dfC2RPYVe3kLpxX95Y4c6Gbbf5Sh66L6
 xBrH5DplgxqB2Z9G3Inp+KmQ1giIWtn2gG3nJ9w2hHXRcQ80gW7n3tPD1rK30Y/mTmMjz3c2ZPqHj
 uLZX+Ur7YcIgG62yt7gGXRmInorRJd5FYHQswq1vRPO90Ue8lVa3UePZ5AxMOwBuYnyEL7bs63eL0
 S1Uk+0RexY9fL7JB0/9vuIDQ3/2uvrdypzfIUDYkpnwrx6sq40NS4m2vAsAYnmAApSGtaTuqSdu1J
 mSI4c9zOgtnbyUhwi89en4yzUQyEWEEWAHAX76jprNQGfLLvCx8lhqu1rhLp7b+kzdFzoT/HTGvCb
 KvBJOuLp3La4ArXw//OcKAs9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r4t3v-0073Oa-0U; Mon, 20 Nov 2023 01:26:55 +0000
Message-ID: <4e382e9e8b6ce4efc4d9d28061a0da06bf1f555c.camel@samba.org>
Subject: Re: I want to make ADCS support better and I need some advice
To: Joe Dillon <joseph@outurnate.com>, samba-technical@lists.samba.org
Date: Mon, 20 Nov 2023 14:26:49 +1300
In-Reply-To: <371d142b-32dc-44ec-a677-39d26ba96f0d@app.fastmail.com>
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
 <4baa6aa2-052f-1e19-63c0-ef3711d9febd@samba.org>
 <7b96929d-54f6-4e2f-8180-2810d7b6ae10@app.fastmail.com>
 <66505624-8efa-843d-ede0-8968d2951f59@samba.org>
 <371d142b-32dc-44ec-a677-39d26ba96f0d@app.fastmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Sat, 2023-11-18 at 21:54 -0500, Joe Dillon via samba-technical
wrote:
> 
> 
> I managed to get the IDL for ICPR translated to PIDL.  Would
> appreciate some feedback on the IDL, in particular, on the dwFlags
> struct.  It has 8 bits of padding at the end and I wasn't able to
> discern what the convention is for reserved/padding bits in
> structs.  See here: 
> https://gitlab.com/Outurnate/samba/-/commit/e7520d74583b0fb3cfeac0783ae741f197f8eb99#note_1657603227
> 
> Right now, certificate enrollment relies on python-cryptography,
> which has rust components.  It uses the asn1 crate - my CMC
> implementation in rust uses the bcder crate, because that's what the
> CMS crate uses.  Design-wise, I have a few options, and I'm seeking
> some guidance here:

I wouldn't count python-cryptography as Rust for Samba's purposes, it
is packaged on all our platforms so appears to us just as any other
system dependency, not even requiring a 'pip install'. 
We already use it extensively in Samba's testsuite. 
> 1) Pull a new dependency on python-cmc and by extension
> asn1crypto.  This will bring the number of asn1 parser libraries in
> samba to four (that I can count) - samba's asn1 lib, pyasn1 used in
> the test suite, and rust's asn1 crate.2) Write a new, minimal CMS and
> CMC implementation in rust on top of the asn1 crate, thus introducing
> no new dependencies.  This implementation would then be exposed to
> python to be combined with cepces and ldb to form a complete
> implementation.3) Have ICPR be the only in-tree component of
> this.  Shunt the rest of the implementation off to a certmonger
> helper binary.  This was my original design concept.  There would be
> a slight circular dependency - the helper would be dylinked to samba,
> then python would shell out to it during enrollment (like cepces).

So far, as a system package, Samba has chosen to rely only on software
packaged on our major platforms, not the language ecosystem package
managers.

I'm not sure that this is something we can hold to going forward, but
now with a new language coming into the mix might be the time to
examine our rules.  I wouldn't want to be doing massive amount of
duplicate work to stick to this rule, without first thinking about it
very carefully.  

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



