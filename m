Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A27AFB0
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 19:22:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kJfqg0XBYg4gLIXnTH9MIFdVoJZWyU2WmdtCF2wuyh4=; b=tXAz5U+X57gAWHIStL2zlyC+50
	d1yL3LXKct1K22bwIBP2Atgm8g/pkzQsrSc98tl8d2uymQsqaPuK+4isyzhpGD+nKWD6pThKVvyZ2
	YedaJ4GY2yw9s3arVmHLUDvsIJqQTdcjRQzdSOKSzu6PtX4kPK1ifiar/cAQkvSG58Yo8CsIUeyCI
	fVca7M5qgcIfYhcE/7uiM4X+sephejTTaYH2ZvYrMWUjB5TdMhZjTIm7BJyL/GwDiLOZ69YdR4Xgw
	e+NvxTxpZ0LCSM8Z04ynqmxELCoGJlhXE8aySv+1QgY8LdA85rMsd3invs7THL4Ii5WKXWBqiE1bN
	iE8iFE6g==;
Received: from localhost ([::1]:40418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsVox-0013W3-1H; Tue, 30 Jul 2019 17:21:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsVot-0013Vw-0N
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 17:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=kJfqg0XBYg4gLIXnTH9MIFdVoJZWyU2WmdtCF2wuyh4=; b=B13+6jZiwwM98oF8/t0cROSGhO
 s5S60xGQ0zDns+BOTkHV0gp26e9tcmV+gWYIUfE8jCERZ7IH/opvTk/0jx9olbp8Mdt75zAZU4Afg
 eIAcg8OL45uMzETN9tDERh83gjgR0TYQPFLlRSU63TlPSNys2ISNN2weKT94EXyA/5Ek=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsVos-0005H9-1B; Tue, 30 Jul 2019 17:21:50 +0000
Date: Tue, 30 Jul 2019 10:21:47 -0700
To: miguel medalha <medalist@sapo.pt>
Subject: Re: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190730172147.GF128128@jra4>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
 <20190730163237.GC128128@jra4>
 <ad9a941e-539a-b864-542f-01a804bbc88b@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9a941e-539a-b864-542f-01a804bbc88b@sapo.pt>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 30, 2019 at 05:51:51PM +0100, miguel medalha via samba-technical wrote:
> > I'm working on modernizing the fileserver VFS right
> > now, and the requirements to keep SMB1 working are
> > causing massive amounts of extra work.
> > 
> > If we can ditch SMB1, many many simplifications
> > become possible in the fileserver code that require
> > enormous effort today. Take a look at the directory
> > scanning cleanup fixes I'm going to try and land
> > this week - 99% of that is fixing up old SMB1
> > code that is simply unneeded if we were SMB2+
> > only.
> > 
> > The AD-DC codebase moves forward as rapidly as
> > possible to match current Windows needs.
> > 
> > The fileserver needs to be able to do the
> > same.
> 
> 
> Maybe I am saying something stupid, but why not encapsulate the current
> state of SMB1 and make it a VFS module presentable to the SMB2 layer?

The SMB1 processing takes place above the VFS
layer. It would be more work to do that refactoring
than it would to keep the existing SMB1 mapping
working.

The only way to simplify the fileserver is to
remove the SMB1 code and leave us as SMB2-only.

Use old-Samba mounted on cifsfs (via a vm maybe)
exporting SMB1 to an SMB2 server seems the only
sane solution for old devices to me.

