Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF237B5BD
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 00:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0y+eODPEl5Y6/D9/Ss8q94tVpYyu8Rb19DbESBMlSoI=; b=DAyXla13GA1vply4d9ws5tO/q3
	ltqCiz3YHKUCnd8UNbADuEg/30GFJ1S8+Pq0w/Iiwf3b0VJo3gP+w08iqQaXYHn1OKYpEIo1Lczls
	6nNxLhQIS//GVrlHILWlr8q395Xjfz56SCPoPnPZtsmZ5orKRjm6xfsbu8chHT+KN5XT2JTRVN/qf
	anTk8eO3CDUAs12dhOmcswfH7nWlYTM5+rbE3rPO4SR/yZ8nmzlZArnvkyEKUVHY4yFljnqjF1Eqk
	eGS71ck2iUssAut9WRooEckqriL2XbsATyi0ECEYcl4VLP/3zl9VLMSfpF3QUVUnO4hWmn5OT5auB
	W7iNBwtA==;
Received: from localhost ([::1]:58844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsahg-0016Vv-Oi; Tue, 30 Jul 2019 22:34:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsahc-0016Vo-N7
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 22:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=0y+eODPEl5Y6/D9/Ss8q94tVpYyu8Rb19DbESBMlSoI=; b=OMAMOUCRM8jco4PEwsA1rJ1EXJ
 4uob+qF/ZEKkv+vApx+tn2lUBFnMGSjgLoyNrTo5YKfkJX/F+gBEwdUh6IBt20CJPHzvmoMdriYXZ
 tgxofE0ZQs+oPYGVE+uEuQx+Rl7IFMpzfX9Ptk/g1x6NNSlcVXF0W/piSxxYCnmamKrI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsahb-0007wJ-KF; Tue, 30 Jul 2019 22:34:40 +0000
Date: Tue, 30 Jul 2019 15:34:36 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190730223436.GL128128@jra4>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
 <20190730163237.GC128128@jra4> <1564525335.4261.37.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564525335.4261.37.camel@samba.org>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 10:22:15AM +1200, Andrew Bartlett wrote:
> On Tue, 2019-07-30 at 09:32 -0700, Jeremy Allison wrote:
> > 
> > I have to admit I really think this is the only workable
> > solution for the size of fileserver maintanence team we
> > have.
> > 
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
> > 
> > All IMHO of course :-).
> 
> Thanks Jeremy!
> 
> It is really good to be seriously discussing this! 
> 
> We do have to be realistic as to what we can maintain.  I'm in a
> similar discussion with Andreas about how much we should rely on
> GnuTLS.  

IMHO relying on GnuTLS is a good approach, as it unifies
and simplifies our crpyto into something someone else
maintains (I hope :-).

> By discussing it broadly I hope we can draw out support or objections
> earlier than release date + 12 months (because that is just
> impractically late). 

Oh yes. I don't think we can remove SMB1 in less than one
year.

> I still think a lo-fi (will not pass all tests) SMB1 proxy is a good
> idea, but that's all, just an idea not a mandate or unwavering
> objection. 

Don't we already have this for any user that needs it ?

Linux VM running cifsfs mounting a SMB2 share, re-exporting
a SMB1 share via current (4.11) Samba.

Why do we need to add in another SMB1 implmentation
- even a proxy - into Samba to solve this ?

> Another alternative could perhaps be to support SMB1 using the current
> code, but not the full semantics. 

The complexity of the current code is what is causing
fileserver maintanence issues.

Truely, dropping SMB1 support in the fileserver
simplifies so much it will make our code much
easier to develop and maintain long term.

