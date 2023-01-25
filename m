Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B363967A8CD
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jan 2023 03:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JQt7eyqGT0T2NemvXYQs3W88HsKmCGFLgU/ww9Yr0Mo=; b=Rj4Eu1iX9kwNsQUlDeS6nJPLgN
	eAw64tn1buxtydxkYf967D9LnFyv/ZKqOWx9SuItl8KS6rz+35j0rSeNanCgdxHABgl0Aq52KVvnM
	LltG60nchc3kDpRcunFWhSWnUQqvxkv/2/SDCAje4rEo3a3vNiGoP2BNwK25l2khqbYg5Sk+qt1A1
	1LfWDGA8UWnYCHlYG7BQ3n9MW7aY4ZwR2Bs+tPmTaKYgUdQ6+c3+JzOv1Wtkgr9QBqfVH1WWcXJF7
	G6XfxV/mREa0FIXisqrKE//Q2SSe0SjgkX9kF8Hm7QyoPnE5B/IR8LKIwdJ8dF+Tv/ifaGRewD8Iz
	frf7Zcvg==;
Received: from ip6-localhost ([::1]:52530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKVZe-002fX9-EC; Wed, 25 Jan 2023 02:31:42 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53589
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKVZZ-002fX0-T4
 for samba-technical@lists.samba.org; Wed, 25 Jan 2023 02:31:40 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1nW451YXz4xZb;
 Wed, 25 Jan 2023 13:15:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1674612944;
 bh=JQt7eyqGT0T2NemvXYQs3W88HsKmCGFLgU/ww9Yr0Mo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d0y6JACKHAdCDdjNTnaKItQcxGU2MnUtLVOlWAmOykbEYeqvVMfPVDVVKmF5A4gYG
 3iwAnx/L3ly+aDryqiOHSu5uWtyAjIRPRYdE5x2lUbGl6tfA6BDFId1X4YOVi+Oggs
 N0VCRpFIxIW/zwOPhF2wxF1wFC3mbs0OcjW+01PpaGszC38eFHCQ7xl6ghN6ydAcPi
 CTHr0T0dimqoY3vVFm2xwlTQzGBOKWhZSIlcvnIVHlgLsbbH3UuneYPmir+iikOzz7
 aZdJ7EdXx+jKz8uHv6fMPNgChg5sl6sp7JqGI47ElngKRaOIO4ZBiNdiM5zEESEAna
 8BJxT7+BQ4bsQ==
Date: Wed, 25 Jan 2023 13:15:43 +1100
To: Jeremy Allison <jra@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <20230125131543.406b7315@martins.ozlabs.org>
In-Reply-To: <Y9CEVgJd3XgnHqN6@jeremy-acer>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
 <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
 <1869592.tdWV9SEqCh@magrathea> <Y9CEVgJd3XgnHqN6@jeremy-acer>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 24 Jan 2023 17:22:30 -0800, Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Tue, Jan 24, 2023 at 02:50:37PM +0100, Andreas Schneider via samba-technical wrote:
> >
> >I suggest to use my `git review+` tool :-)
> >
> >https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+
> >
> >same for signoff:
> >https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+  
> 
> Great work Andreas ! Although I personally prefer to use the
> "Reviewed-by: <myself>" tag as a mark I've actually read and
> understood the code I've merged in my tree.
> 
> Whilst I'm reviwing someone's patch I leave off the "Reviewed-by: <myself>" tag
> on patches I don't understand, and only add them once I'm
> good with the code.
> 
> So doing a bulk add of "Reviewed-by: <myself>" actually breaks
> my workflow.
> 
> Does anyone else do this, or am I just strange ? :-).

Strange... but a previous, similar discussion either here or on the
team list suggests that you're not the only one.  :-)

I've been using the Reviewed-by: tag as a rubber stamp since day 1.  I
probably waste time, but if there's something I don't understand I
either remember what it was or I re-review everything.  Then, when I'm
happy, I mechanically appear the rubber stamp to all commits.

peace & happiness,
martin

