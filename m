Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB317B5AA
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 00:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VYvXFKTgc2G01lLjRKJdexA3ZGYF9lxQxwo4AFbFHJ8=; b=1cmRHsvVdwBdhnUOyEYGuJwPP4
	HYHGUf7BWPSubkpZAvjwVNKOSlYd6fd9oOMHRvTRhMPKEaeXMLq6a140kgRaS6SiRUeHQGF9nONzX
	xm034EDq8p9H+GQR5hMMEPdid/+14/bLkvvzTxZ6dAtvPjBvM8jolAiML+bdvd5+QKN7VtqQ52ODp
	fjVardxKL+GLLoyl6wfZ81xfZxhPY4TxUt0nDDUMwh43mpqeCX8w9DYfdMfQCa20ZyBvYHXH3zf9p
	W2C/muz86odbxN4gq1UnBiRNpiFYXUghS3OTpe27YhAY1+ROaYeFAOuWkr2SlGRVdfbFpKZsK7cOn
	X2BWyuYw==;
Received: from localhost ([::1]:57968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsaVm-0016LT-Tf; Tue, 30 Jul 2019 22:22:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsaVh-0016LM-Jx
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 22:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=VYvXFKTgc2G01lLjRKJdexA3ZGYF9lxQxwo4AFbFHJ8=; b=CXyK7LCGKPMPXuKLHIJFV7XQwq
 RgJJIud4ndvlyXBdlzREeE/LjXUmbDoWetolPF7xyGfE5lMBMcOV0Lf8RJZubAvKkE3yOUINgZBrZ
 5RbtuTAD5I4r+S5b6ukp7ZcywyoZnRfOCq59KqI+4vA6ElIfhT475bTAezRmW7L9eHeQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsaVg-0007mj-Ap; Tue, 30 Jul 2019 22:22:20 +0000
Message-ID: <1564525335.4261.37.camel@samba.org>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: Jeremy Allison <jra@samba.org>, ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Wed, 31 Jul 2019 10:22:15 +1200
In-Reply-To: <20190730163237.GC128128@jra4>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
 <20190730163237.GC128128@jra4>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-07-30 at 09:32 -0700, Jeremy Allison wrote:
> 
> I have to admit I really think this is the only workable
> solution for the size of fileserver maintanence team we
> have.
> 
> I'm working on modernizing the fileserver VFS right
> now, and the requirements to keep SMB1 working are
> causing massive amounts of extra work.
> 
> If we can ditch SMB1, many many simplifications
> become possible in the fileserver code that require
> enormous effort today. Take a look at the directory
> scanning cleanup fixes I'm going to try and land
> this week - 99% of that is fixing up old SMB1
> code that is simply unneeded if we were SMB2+
> only.
> 
> The AD-DC codebase moves forward as rapidly as
> possible to match current Windows needs.
> 
> The fileserver needs to be able to do the
> same.
> 
> All IMHO of course :-).

Thanks Jeremy!

It is really good to be seriously discussing this! 

We do have to be realistic as to what we can maintain.  I'm in a
similar discussion with Andreas about how much we should rely on
GnuTLS.  

By discussing it broadly I hope we can draw out support or objections
earlier than release date + 12 months (because that is just
impractically late). 

I still think a lo-fi (will not pass all tests) SMB1 proxy is a good
idea, but that's all, just an idea not a mandate or unwavering
objection. 

Another alternative could perhaps be to support SMB1 using the current
code, but not the full semantics. 

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





