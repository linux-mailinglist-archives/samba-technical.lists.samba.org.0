Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763B29449B
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 23:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5TGRKnJ5F5jJWjdjEpSU+QLh/BRRrqctq4BVJUDr+lI=; b=00wB+omhgYNftI0mDLeJ5eDLwp
	0jud6hR8n53EwJn1E4AsMDS8FcxcQIY868v00VdUJPnRX0+2jNarXurrKo6ESbodLh/vrMGVkH6/3
	aBN2FwJbETDK/pWyQCEhZmVDgReW+F0DoYwlceUvxETcnr53AaSyrVR8zlWwRo179ri6va1USVM7s
	rpbxe9JEKJol0eaOeVxu3NokKhhF1f5XycSGCz2+ruA0Q02WKFe8MVMoMs8fNz+zMJxTX19snYfE4
	IQsNLESzUpiZz2/QiRnCp5MhDvxEkHqPsf+1o+oSmdLWhEGkFxF02ipvfBEpuWTyimLwfh/zmtS8y
	LSwL0Iqw==;
Received: from ip6-localhost ([::1]:40030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUzGy-00CyiK-F3; Tue, 20 Oct 2020 21:34:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUzGt-00CyiD-KF
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 21:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5TGRKnJ5F5jJWjdjEpSU+QLh/BRRrqctq4BVJUDr+lI=; b=GCnIXtkqWHXVuH7K4mCUzOlqlo
 gIlqOmzSwlJ13i4Yznubkeo5Xd7jsqW+jvZFDoDZTCK3y39kU5+4gzJtbOj4PzyRISU78sC/EEmh4
 aAHKHqcdW6zHxepweFf3ngV5gfG1KQSDsRuE+nABNyMxLvblbxQ8yW2iukDiwJ6z4f0dDcbKUPwRU
 69yfcylL+GayjcnWnayl9f42YV8Ve4i8EObAgNqZFTq1TSTigknpzOtACpeUviQ2ENi5DWdCyM0CJ
 v3lQd0rYYZklHZ666pc0wH0qrrOSiiq0sSU+vSmHU52DqLeu9N4vhp1Y+H4H544aGOD4+ao/Cud4d
 wgCZ+ATYyiYSzMwwsT/YV7PaSdNHy3J8FAW5RBgzRs/Hs666KOyQfuilTemtwg4CGzMXgfuciYIlx
 oSVW0PSy2Kyd7VjytfyAqJcjp+mgKKuE5HVczn0z7T6eayIB3BOlMOSCAy1jb7NKcl6sk7e9NlbUR
 aDS1LJfOLl8cQ9p01Xns1rEw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUzGr-00056p-Re; Tue, 20 Oct 2020 21:34:18 +0000
Date: Tue, 20 Oct 2020 14:34:14 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020213414.GB684621@jeremy-acer>
References: <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
 <20201020191654.GF642265@jeremy-acer>
 <1C33DF9F-997C-40B0-980F-0AE27C43E1DD@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1C33DF9F-997C-40B0-980F-0AE27C43E1DD@freeradius.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 02:50:05PM -0500, Arran Cudbard-Bell wrote:
> 
> 
> > On Oct 20, 2020, at 2:16 PM, Jeremy Allison <jra@samba.org> wrote:
> > 
> > On Tue, Oct 20, 2020 at 01:42:00PM -0500, Arran Cudbard-Bell wrote:
> >> 
> >> 
> >>> On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
> >>> 
> >>> On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> >>>> 
> >>>> Then there's another issue with object_count ending
> >>>> up off by one, which means talloc_free_children doesn't
> >>>> actually return memory to the pool, and that messes up
> >>>> some of the other tests I'm adding.  Just tracking down
> >>>> when and why this happens now.... It might have been a
> >>>> pre-existing issue and not related to this patch, I'm just
> >>>> seeing it because of using talloc_free_children to reset
> >>>> the pool between some tests.
> >> 
> >> Apologies, there was a steal I didn't spot in the tests.
> >> One of the chunks was moved out of the pool into the root ctx.
> >> 
> >> Explicitly freeing the chunk or stealing it back into the pool
> >> means talloc_free_children works as expected.
> > 
> > FYI, once you've gotten everything working can you
> > send your test cases to me so I can add them into
> > the regression test suite for talloc ?
> 
> Attached.
> 
> > Then we'll add a new bug in bugzilla, update the minor library
> > version number and create a gitlab MR.
> 
> Sounds good, thanks!

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14540

is what we'll use to track this !

Thanks,

Jeremy.

