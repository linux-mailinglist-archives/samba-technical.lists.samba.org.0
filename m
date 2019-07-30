Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB17ADB2
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 18:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zCEoUNfd2cgZU2mBGno9/G+/ENhCK66qToLEscrj3D8=; b=gg54f9bAwiKLiIRKNqFqqCe/B3
	Re2leIvTGEXpHZjpr6dLJpbxKkUrQeenmwwMyMG3HCQEjhRPYe+Ytbt+xSB0ZN4BMx+oVgr25G4jQ
	ehZNCesi6Y0r37kxDvzZeYEUQZGmZ+aLQU5//luvBeRHHxTo+jJhLgMGCU7by1ONkSkjapXlUR94H
	za1w9yXOHwOG1oDBEZeXwgH8aiJ6R0OEyX1FTAj1e/xnsQyhzszIES7aWf77wu2iQfw/6cZ+ThUdn
	P8M86RM+Q16sJyuqaqBVVkqXj1a84Ljyd7cjkSI5TPdHj/jZghhzXf7eP1dGcCLDLG7+wlU1D/pRa
	jD4xvZHg==;
Received: from localhost ([::1]:27244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsV3N-0011jr-26; Tue, 30 Jul 2019 16:32:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsV3I-0011jk-GY
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 16:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=zCEoUNfd2cgZU2mBGno9/G+/ENhCK66qToLEscrj3D8=; b=PoQ3dIfgAj7X2kBJg8ckyLl8YY
 TiWGYXUR//zj+KveliTeBM5PCpMKjLVDC8FC1lME61HkLgV9kZA1PFhs8rOctk0RzTsBNY6VkILYj
 mv6DMeU4S2kXVVH6ZX0dVmR642a032UfcfN/HkZyHJaV2B17rYglH0QxV2zWs3tfVrJ4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsV3H-0004ff-BD; Tue, 30 Jul 2019 16:32:39 +0000
Date: Tue, 30 Jul 2019 09:32:37 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190730163237.GC128128@jra4>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
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

On Sun, Jul 28, 2019 at 06:52:34PM +1000, ronnie sahlberg via samba-technical wrote:
> The solution is simple.
> This is what I propose:
> 
> Next major release SMB1 is dropped and the code is deleted.
> 
> Some people do care very much about ms-dos / os/2 and amiga 1.3 users.
> These people can fork
> samba and continue to support a smb1-legacy version of samba and
> backport all patches from upstream to this
> fork. Volunteers?
> 
> Alternatively, ms-dos. os/2 warp and amiga 1.3 users can still
> continue to use old and obsolete versions of samba
> if they are not able to fix their clients to use smb2.

I have to admit I really think this is the only workable
solution for the size of fileserver maintanence team we
have.

I'm working on modernizing the fileserver VFS right
now, and the requirements to keep SMB1 working are
causing massive amounts of extra work.

If we can ditch SMB1, many many simplifications
become possible in the fileserver code that require
enormous effort today. Take a look at the directory
scanning cleanup fixes I'm going to try and land
this week - 99% of that is fixing up old SMB1
code that is simply unneeded if we were SMB2+
only.

The AD-DC codebase moves forward as rapidly as
possible to match current Windows needs.

The fileserver needs to be able to do the
same.

All IMHO of course :-).

Jeremy.

