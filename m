Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 913CF7EA5C0
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 23:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Kqdyi75wOXDZYNiaRNzwsyfEpGa3KJ5kMbKREdwEYps=; b=1gySU2xpl+NAQ81eE73Q9Biu1s
	fJbWFex2Q6oOXI4Js+9MbIztWecVb8Ve7hpp+SZksriYFm4qzecg8F0FU8fg1ENsCzf7wmGNV90DN
	oYsP7HTV9OPo+rXD0NYwVyNsnu1pUToHlzSRiG1EuKlItHn54qZYUMGpGp7oTHtkLFUhOb0s+5qTw
	8kSB6A+dkWmPNAgWlat3r4GPCK9jtTo/0j0Q/NoTZFU1AJhftmi7Qu11WQII4KrqZXLZjgYbFn2EU
	7FY64d/epV4iR5NXc8B7aOUds7yoxR8P3thJ9L4ogmSIAEM9ebcnQmn9ETdEvH4uOdnWhMsqmNsQF
	K5ENxYPg==;
Received: from ip6-localhost ([::1]:49234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2f90-0089TJ-K3; Mon, 13 Nov 2023 22:10:58 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42719) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2f8t-0089T3-Ri
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 22:10:57 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id ACE9D5C0228
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 16:53:34 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute2.internal (MEProxy); Mon, 13 Nov 2023 16:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outurnate.com;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1699912414; x=1699998814; bh=Kq
 dyi75wOXDZYNiaRNzwsyfEpGa3KJ5kMbKREdwEYps=; b=wFWE7Jm4wg9DQUrvVU
 ZUZh3BsOznccHhqPkLA8DGyCmIwXC1+c1JN2mm6FMxZiSNbZ7YOTWFTKxuvU76k0
 tLX+H6FenrBVY1PnlJ4KsiNJj2mNR/P7z2KtMvRTJO0OTPq2rC3D9bpFwiGo1Xiy
 IPPFRuPirOgrv345Nqdk2ryUCAUwAYGDUTZSiQaIQWbgdRn/7s5BIs7gEIkTuKGS
 2bkdHPTG9NjYM7xayC6M4QsLjQAX+ST79A26/C5QIZ0sxDG3l3Ec+K/g5KLafPH3
 bhp6Kd21JSXEiCu4fCMJH51s6THH0OuLCBNi+ifeVWS862qxUEZOdJJ+fSm941y5
 WXqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1699912414; x=1699998814; bh=Kqdyi75wOXDZY
 NiaRNzwsyfEpGa3KJ5kMbKREdwEYps=; b=t3rJEVdvJv6TpjQe8jevqG3ZuZfFx
 RNCwVWA9APA3Nj6f6WjYoC1RUpXcq4AhdFDi9nXIDobYCh55l7/cc3oRjQDchPGF
 vzrHSIS2AZvH5w0MWkt75UAkVoIzgcvPjFoebobAH8Ch9M3t+wGXC950rNiVCV9d
 3jyIW6NjYNG6FKCSuMm/p7SF7P+NTE4nZi1217/d1lx/NqU2Z3DXTRMs1Tkanh7a
 Eax0G5vbJWixbmVnxyUR2vWfeM8WO3elUajDuRScOggnr+ZnCbvbzsKv+XFeTama
 +0ebIuhRO61xgafA+ycsH/rnuV4ouCAlYgEu5X8ruWqkj3ipqvjAOX39Q==
X-ME-Sender: <xms:3ppSZWU6b5CnJ6in-24smv4iml14nbuh6p2QCJR1ndEVuo_E6QlaHA>
 <xme:3ppSZSm35CCi_OIc1S2m4APZdE2_CJ_rEU8Y99MHS12gUPGBiyNSViQZ9vgS7KTGi
 3FCTut9VE_r2qff_No>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeftddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepfdflohgvucffihhllhhonhdfuceojhhoshgvphhhseho
 uhhtuhhrnhgrthgvrdgtohhmqeenucggtffrrghtthgvrhhnpedvveffjeevudeffedvvd
 ekffffgfffhfegtdegieekleffvdegueeufefgheekkeenucffohhmrghinhepshhushgv
 rdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjohhsvghphhesohhuthhurhhnrghtvgdrtghomh
X-ME-Proxy: <xmx:3ppSZaYqHd1iQl-3AgJxL0m0KZvAHgkyM6yzcBC34fWdWe_mH6uGYA>
 <xmx:3ppSZdW4p-NMgQbgW7ghNIg0lZonpRU-geXlz0Siu-0AHKIkbqDPrQ>
 <xmx:3ppSZQnVGPU2G0EJuTy-q7nJxkmUgeJ2RASBT7NJROZUtQ6BYSEgDg>
 <xmx:3ppSZcyshGu-iTTqBIXFUHpZtAoQdyY4mkk13VPRhJnDa7DjnbX8ow>
Feedback-ID: ic7c14608:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3E9EEB60089; Mon, 13 Nov 2023 16:53:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <7b96929d-54f6-4e2f-8180-2810d7b6ae10@app.fastmail.com>
In-Reply-To: <4baa6aa2-052f-1e19-63c0-ef3711d9febd@samba.org>
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
 <4baa6aa2-052f-1e19-63c0-ef3711d9febd@samba.org>
Date: Mon, 13 Nov 2023 16:53:09 -0500
To: samba-technical@lists.samba.org
Subject: Re: I want to make ADCS support better and I need some advice
Content-Type: text/plain
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
From: Joe Dillon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Dillon <joseph@outurnate.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 13, 2023, at 9:50 AM, David Mulder via samba-technical wrote:
> 
> On 11/13/23 7:28 AM, Ralph Boehme via samba-technical wrote:
> > On 11/13/23 14:56, David Mulder via samba-technical wrote:
> >> I'd additionally like to be able to contribute rust code to Samba, 
> >> and I'm certainly glad to see someone wanting to work on certificate 
> >> auto enrollment. I know there is some opposition to providing rust 
> >> code in Samba, I think because of platform support.
> >
> > iirc this was about AIX for which we do provide our SAMBA+ packages, 
> > but last time I checked several months ago AIX support was about to be 
> > released in rust, so this is likely not an issue anymore.
> Hrm, interesting. So perhaps we could work out a way to include Rust 
> code in Samba.
> 
> -- 
> David Mulder
> Labs Software Engineer, Samba
> SUSE
> 1221 S Valley Grove Way, Suite 500
> Pleasant Grove, UT 84062
> (P)+1 385.208.2989
> dmulder@suse.com
> http://www.suse.com

AIX support is a tier-3 target in rust: https://github.com/rust-lang/compiler-team/issues/553.  Samba already depends dev-depends on rust (selftest requires python3-cryptography).  What's usually a showstopper for rust is gcc support.

In my opinion, it makes the most sense to not re-invent the wheel though.  I had to write a Certificate Management over CMS implementation in rust because one didn't exist.  Python has python-cmc.  Would pulling in a dependency on python-asn1crypto be acceptable?  As I understand the source, the samba python module doesn't pull in any dependencies right now?

Am I correct that the modules samba.dcerpc and ldb are currently undocumented?

Thanks,
Joe Dillon

