Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D151C128E5
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 09:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=u+58Htp6nZki+U2lRMTqCuuC0JqpQJVWDFAPCYqv4ic=; b=iDSfv+ZL7RvWsLlSoZ+yV5R3+s
	eYwTwa+zfdl3xEAnWgqKe2oS9xpFathVQbdI+naMX88V2k+ufZtl6yTwn600lY4Q1N0e/+B9JedvJ
	Hb25XLWdJErO/8AwPJ0aPvi1Ezm06TbAVyIAoY4OV2guqCJjYrNVEJ6Z8ROWbTaEtke3y+5Xi0s9q
	qk0UvXgH46rml9n0m8P6lOZjlRLRfMOgivqFebZLAB2gSuNG+HVEHE4bXxQonnJ1X0rgr8VYJe2uy
	hP3BPzjyIGyxHV2rk2FG8ea1DgxBJbhslQcx2IVtfQq/RQMiN0KULeWYj9UAQHvPacUCOMMMvH/6z
	fTWqpo5A==;
Received: from localhost ([::1]:26138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMSfu-002BmR-CA; Fri, 03 May 2019 07:32:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:44836) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMSfo-002Blf-AX
 for samba-technical@lists.samba.org; Fri, 03 May 2019 07:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=u+58Htp6nZki+U2lRMTqCuuC0JqpQJVWDFAPCYqv4ic=; b=W5NjbhSok5fRAGvBxt7edSHEL8
 gxxxVdX++tLHXDWlBVxEo5v+/ZJKxhfxfn0MtD8CuGnVYgsJXhxoziYuaH4Ujxl8bh7u7ofY6ZuCd
 7u1PE9tyvsVWpqrRSu6omw3jyNilTHIeps5F/MYeRYXHKRbkIFgDbq2/i6InqSd2cnyk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMSfm-0007FV-LQ; Fri, 03 May 2019 07:31:58 +0000
Date: Fri, 3 May 2019 10:31:56 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
Message-ID: <20190503073156.GB5460@onega.vda.li>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
 <1556509193.25595.71.camel@samba.org>
 <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
 <1556822561.2951.25.camel@samba.org>
 <20190503065538.GA5460@onega.vda.li>
 <1556867924.2951.44.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556867924.2951.44.camel@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Simo <simo@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 03 touko 2019, Andrew Bartlett via samba-technical wrote:
> On Fri, 2019-05-03 at 09:55 +0300, Alexander Bokovoy wrote:
> > 
> > Basically, my personal opinion is that this situation is pushing more
> > unjustified work into hands of our downstream consumers (vendors).
> > I'm
> > not talking about it on behalf of my employer, it is purely my own
> > opinion, but I can see this an additional overhead for some.
> 
> So, perhaps this is a useful approach.  
> 
> First, stop tagging ldb versions in master. 
> 
> Second, merge MR 374 (which leaves the ability to produce tarballs, and
> tests this in autobuild, but aligns the version numbers)
> 
> https://gitlab.com/samba-team/samba/merge_requests/374
> 
> Third, stop producing ldb tarballs in the release process.
> 
> I'm not convinced such downstream consumers that have the needs you
> indicate above exist, but you suggest they do and I'm not sure we have
> a good way to tell.   So perhaps they do and are forced into such
> burdens, then I'm sure they will ask and we will know for sure. 
> 
> In that case either they can either run 'make dist' themselves or we
> can, knowing they really exist.
> 
> How does that sound?
I have hard time understanding how all these proposals from you differ.

They all seems to hang around the willingness to not produce a proper libldb
tarball at all. I think this is where we disagree. A version is a minor
think in this context, at least to me.

-- 
/ Alexander Bokovoy

