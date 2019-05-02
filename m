Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E301220B
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 20:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=8ggf/bp3elRPzoFzAHziiP0nYQnj3sBPUu6F5c21p/0=; b=PO4SpK0hibLGU7BaZI4uJykKgm
	kKpxBDfHVV8juXVh52LsuoKx04nRyCmrkhAjh5qxfWyJv+Jt/mTBLcuKQz/vrKyySTx5LEkQTk0ED
	EEM53inzF1ZY+bIHB3tTeBA4bcPMsjZNfFSs7dXks2gWiep6X/LEjvaYwzATrXW2n4D6CymV6y330
	Y+4GPT9VhPOzPOEqgCPknwHNePpD9TxTeNQs7Yt2VGf+Ib1s3XprJUXNzrNBImWo2pybfDruQH/R/
	oW57NrLhehq2z1ZF9i7vDAlCPCrT9/1AGR4I2rKrV4IBlE2ZIj6qtbhcMgXy1Ll/SnL3Of9OvotN2
	FWQVhMlw==;
Received: from localhost ([::1]:48520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMGfS-0027Yg-H1; Thu, 02 May 2019 18:42:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:24660) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMGfP-0027YZ-2q
 for samba-technical@lists.samba.org; Thu, 02 May 2019 18:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=8ggf/bp3elRPzoFzAHziiP0nYQnj3sBPUu6F5c21p/0=; b=vgXJT9UwCLyZ8kLk3AA9O0zOmn
 8u03Z/V2KgmMNpLvIRiDIhebJTkg11nuDJtaNGy48gwplhcNbMbIAN9133fF2e13/rbYaNxY4EeSu
 f5NOdlGf6ZWQh+pkcgItP9EiFIvWlelePfO6YuExTalT7xccR0oWy6Fy7IZMbbCUhLRo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMGfN-0000qS-L2; Thu, 02 May 2019 18:42:46 +0000
Message-ID: <1556822561.2951.25.camel@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
To: Simo <simo@samba.org>, Andreas Schneider <asn@samba.org>, 
 samba-technical@lists.samba.org
Date: Fri, 03 May 2019 06:42:41 +1200
In-Reply-To: <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
 <1556509193.25595.71.camel@samba.org>
 <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-05-02 at 12:13 -0400, Simo wrote:
> On Mon, 2019-04-29 at 15:39 +1200, Andrew Bartlett wrote:
> > 
> > 
> > Are you otherwise OK with the MR?
> > 
> > On the tarball question, is 'cd lib/ldb' in the ldb rpm build
> > scripts
> > (and a larger tarball size) a particular engineering problem?
> No

Thankyou.  This is what I needed to know.

> , neither is cd lib; tar cf ldb-x.y.z.tar ldb/

Could you patch and test script/releases.sh for me then?  It's 'just' a
shell script, but we like to automate things for our release managers.

> > 
> >   I've
> > tested and the independent ldb build works from the Samba tarball.
> > Can
> > you spell out your specific concerns here a bit more?
> If you are distributing ldb source (for example because they have to
> given our license requires it) as a dependency you want to do just
> that, of course people can make the tarball themselves but then you
> risk having messy, unofficial tarballs around. 

Does anybody do that?

I'm serious, can you show me someone other than a linux distributor who
already has to distribute Samba, who distributes ldb, or even a
consumer other than sssd and the late openchange?

> > It is just a pile of shell-scripting I would rather avoid tackling
> > in
> > script/release.sh if I don't really need to.
> > 
> > Given the strength of the push-back I feel like there is something
> > I'm
> > missing here, because while I had more radical ideas in my initial
> > writeup I've taken feedback and looked at the minimal practical
> > change
> > which shouldn't badly break anyone but will make ldb development a
> > little more smooth. 
> I honestly do not know what this changes in ldb development, but
> releasing a tarball surely won't make it harder.

I get that you don't see it.  That's fine, but you keep saying that
this is pointless and me saying 'I would like not to release each ABI
bump' and 'I would like ldb to have a clear development support cycle'
continues to just go in circles.   

Stepping back a moment, as a representative of our prime consumer, can
you more clearly articulate what in an engineering sense would be lost
to you, rather than the benefits you don't see?  

(In that if sssd is not harmed, it matters not if ldb/samba make
pointless changes to the dev process, as long as they don't harm sssd,
right?). 

> > 
> > I don't propose to remove the ldb build system.  It also wasn't
> > ever
> > proposed to remove the ABI checks or any of the public libraries.
> > 
> > Is the real concern here that ldb would loose one of the final
> > elements
> > of it's 'independence' from Samba?
> It *is* used independently of Samba, so yeah it would be a sort of a
> backwards move to have people need go and do a bunch of unpacking and
> repacking by themselves each differently.

It is *used* independently in Samba in sssd, but I can assure you, it
is not currently developed independently of Samba, for better or worse.
 
ldb is developed as part of Samba, and over the past few years
primarily for Samba's AD DC.  Of course we accept any outside
contributions, the Python3 work most recently, and are aware of sssd
and the late OpenChange when doing development, but it would be quite
incorrect to say it is *developed* independently or is independent.  

It is a published, public library with (sadly) a small handful of
users.

> This is also useful in CI systems for example, to reduce the amount
> of
> space and build time, etc...

The only change here would be space, not build time.  The ldb build
system remains. 

> > 
> >   It is sad that the goal, that sub-
> > elements of samba would encourage new developers to work on
> > contained
> > subsystems never really worked out.
> You should qualify this statement, what were the goals?
> 
> As far as I can tell they are used independently so it worked.

libsmbclient is used independently also, but does not require the
fiction of a separate release process. 

> Sure we didn't get *tons* of development back, but we definitely got
> lots of testing and bugfixes (although that may have not been evident
> to you).

Is that testing and bugfixes that would be withheld if they had to find
ldb within the Samba tarball?

That's the bit I'm struggling with, the strength of your pushback
indicates I'm taking away something pretty major, yet I'm not changing
the availability of any outputs.

Could you clarify?

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




