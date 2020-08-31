Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFA2576AB
	for <lists+samba-technical@lfdr.de>; Mon, 31 Aug 2020 11:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=RY4iYj1GsbBYnpIyQyRiIGRaIn7/pfdL0tqmo7nWId8=; b=4LSKu8N4iQF79GMg2Eaocsfgbj
	ZU9KpiGlJ88ienene9i5glJ4ce8Te5GJ+FFIqpRVBQ3T56Ez2ipxBl4BFOQghkhN0w9MQSFbFnLnx
	WP23it4Y/S/hhQ97Eq/muLw4thDlkcvlcKtfNJWIMT6abP5dg1U9PovQ9s/Y9q6IiVrTtoYL0cwsC
	BBwbxtPiVp2gUIbJWd/ve8Xi+dSC2Fz7aCtnOIN0BhjXBFi4uhmamTFv08IJMYx1yA4pd75Sb+fOu
	IgT6bxF3NE1YveFsw1tEGoHnL+G5vUVtGjsU8VZEHwVJ4HwLD/tE3275srlfphe404rin6bAgCfL5
	LS7KlnHQ==;
Received: from localhost ([::1]:60026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kCgFA-001QMP-P5; Mon, 31 Aug 2020 09:36:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCgF5-001QMI-B8
 for samba-technical@lists.samba.org; Mon, 31 Aug 2020 09:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=RY4iYj1GsbBYnpIyQyRiIGRaIn7/pfdL0tqmo7nWId8=; b=GYe+qpGtdnC0bio9fLfy9DVgWc
 emXtVfpjMiBFzrORFxFv7s0HREf1QfzA1OnfJhdLt2HpSUwU4pRhZX+bVxvwKP/02HJ1046kRr7By
 0gshWr3U//xgQgGzjvM/mPch+CTcdFJWSabbHuQDeVUzpIADwa29+b6SqikjHmWsL7K381mTrofj3
 EHLZTgQMnB7YodytcXHtTx3oqgK3Va3u80uxqLAuPDtSLO2UIOGJHJb6ilprz8x2p6d+RQJdRB+aZ
 GMKxIU3/Gm8sOjR8VJfiO/XvoZxN18pD9ZSkKXOAbfXIgqazuHRZ9F1X+0IkhNUcYAvenYWuZNzBL
 9EmBdAGURr7j3zJVvSVGZIijDTnXyBnFbA4q2AXnvcd8+KSZ1h8cufGUi60pheH373c8lGfoXGoeo
 zj8pSsTtbBdzMhWvYzWCA040bAIF6aobx5hyKLkEqmf9rj/ZefaxepVWYb7QcziX1Oq2eMUY0za/L
 mZ+jghQK58PnmiSRyqqmzI+E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCgF5-0000uc-1N
 for samba-technical@lists.samba.org; Mon, 31 Aug 2020 09:36:47 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
Organization: Samba Team
Message-ID: <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
Date: Mon, 31 Aug 2020 11:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812115841.GD272474@sernet.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 12.08.20 um 13:58 schrieb Björn JACKE via samba-technical:
> Hi,
> 
> On 2020-07-21 at 11:24 +1200 Andrew Bartlett via samba-technical sent off:
>> As to 'auto' options, my position, and one that I thought we had agreed
>> (it was written into BUILD_SYSTEMS.txt before that was removed, now in
>> the wscript and source3/wscript) is that Samba should require all
>> 'optional' libraries by default.
> 
> I'm not sure if I understand exactly what you mean here but for my
> understanding we should not require optional libraries by default: If a feature
> is enabled that requires a certain library it should be required of course.
> 
> The default values of configure feature flags has been a discussion with
> different opinions since a while. When we had the autotools build system we
> actually had almost(?) all feature configure options set to auto and we had
> a really great portability also on all the different unix flavours. Looking at
> portability, we're still suffering these days from the move to waf. I just
> mention this because the move to waf also was the point I think, where more and
> more features became not auto-enabled but enabled-by-default - no matter if
> those features exists or makes sense on the platform that we build on or not.
> Also the move away from the buildfarm to the autobuild made us focused on Linux
> only, which was probably another reason, why more features became
> enabled-by-default. We never had a consent on this though, it just happened
> silently.
> 
> 
>> The reason, as seen here, is that auto behaviour creates a difficult
>> issue for packagers.  Because packaging is a particular skill set, and
>> there are a lot of small distributions most of our packagers (with
>> exceptions of course) are not Samba experts.  The lack of a build
>> output (eg a .so) may be the only indication they get that a feature
>> has vanished when they package a new version of Samba.  
> 
> configure --help gives a list and packagers should (and usually do) use the
> --enable-foo configure flags to make sure that a wanted feature is actually
> enabled.
> 
> 
>> This is why auto-magic dependencies are a problem, even for non-
>> developer builds.
>>
>> This appears to be a broad concern, these reasons apply beyond just
>> Gentoo:
>> https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Automagic_dependencies
> 
> that site makes a distinction between automatic and automagic. The bad
> buildsystem thing that they call automagic, is when eatures cannot be
> explicitly enabled or disabled. But our "auto" is automatic and not automagic.
> 
> 
>> Furthermore, in the real world my recollection is that it has really
>> happened that the first this is noticed is when an end user finds their
>> package is using a workaround (eg lp* based printing vs CUPS) or is
>> missing a feature altogether.
> 
> I think if people compile their own samba version they are usually experienced
> enough to know what features they need to enable. Unexperienced users having
> compile issues with Samba are not really a good argument to enable all features
> by default. Did I say all features? Of course we do *not* enable all features
> by default only some, which is again an inconsistency.
> 
>> I realise that it is annoying for a individual systems administrator
>> who is building Samba, particularly on a non-linux platform, to have to
>> turn off many of our optional features first.  
> 
> indeed, it is. And the list of --disable-feature options that needs to be used
> there is continously growing. This is why I want to object to introduce more of
> those.
> 
> 
>> This is the reason we agreed that we would spit out an error as early
>> in the build, not just a late compile failure.  
> 
> as mentioned before, I don't think that we ever had a consent about the auto
> vs. enabled-by-default feature.
> 
> 
>> Thankfully the person in this situation is likely to understand what
>> they are disabling and know if it matters for their particular install.
>> Also, we know the vast bulk of Samba users get Samba via a distributor,
>> so anything to make this more fail-safe is, in my view, worth the
>> trade-off against the inconvenience of our manual builders.
> 
> I think auto need to be the default, package maintainers use the
> --enable-feature configure options.
> 
> If you really strongly think that something like this is needed, you might
> introduce a
> --enabled-all-supported-features-available-on-this-platform-by-default option.
> There is probably a nicer and shorter name for that but I wanted it to be
> descriptive here.
> 
> 
>> So, in this case, we certainly should make the behaviour consistent.  I
>> don't mind if it is --enable/--disable or otherwise, as long as it is
>> never 'auto', and the correct option to disable is listed in the error
>> text.
> 
> hm, setting them all to disable by default doesn't look like a nice idea
> either. I see really no problem with auto-enabling features. We did this all
> the years before and most software packages do it that way. For deveoper builds
> or autobuild runs we use already have hooks to set different defaults, for
> those builds we can also enable some more features by default that we want to
> test in any case.

this is currently a blocker for 4.13.0, so we need a solution asap. Can
we agree at least on a temporary workaround?
Or on shippting 4.13.0 anyway?

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

