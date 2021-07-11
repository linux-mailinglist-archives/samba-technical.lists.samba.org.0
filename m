Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EB3C3CCA
	for <lists+samba-technical@lfdr.de>; Sun, 11 Jul 2021 15:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HdGLeKUm2DP7ksxsz5gekim3cLwDu2qlARzGDtM3w/s=; b=tJK2MFjy4BZfEWdcucWqZC7CgQ
	hlxtpwad22Bxn7BvUqRUsyoOJDRQs3RW8OmaS/rcXDMasaN3KcGlLMuQNdwtOr/FVnlzQfn6QAtWz
	S9qJrwG8QzjnLFGImu+T/OnIGlDwfXOTJ5108cqYkPnsgO7hdGTcJqapHmYLtiAtw8hYzWeawhnHy
	fOOnE3+sSPXCOlM+pk4qRQT72kaCphodFSNXhrl3QweTmEg84FxPvvUjS+kr/XYb7TMrvSiyeAH5d
	0mAhQ4YzFZxCMn8HXCzgyYhQ96+mI6IEbVV9P7QTj3RLGOceUhXI9gPtN9BJRGgWx392wk1T5bmot
	to9KICUA==;
Received: from ip6-localhost ([::1]:59170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m2ZOR-00Cz0z-1c; Sun, 11 Jul 2021 13:21:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14310) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m2ZOI-00Cz0q-Dy
 for samba-technical@lists.samba.org; Sun, 11 Jul 2021 13:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=HdGLeKUm2DP7ksxsz5gekim3cLwDu2qlARzGDtM3w/s=; b=QtiGLBO8V0pvE3+NjLurRUcl3T
 XrK75niesB3VSTjq3yv4CvtqyI9mo6vodRtklD+JBb6clmX4vFpCREQzAk4txxWqm/Q9B4nCYGME5
 EGBzT2t3aJ+0YU/MM46zxnfIR8lvmjFekQTFDZu7Ys8z/bEiMNp6USZp7AKlNQIWH25VzeJUYQZyg
 1RdH+ymqeyc/Z4k56+cz3Hw9swxeh4Q8zQvM9u/yzctVEkIvfDd6AxtphA3xvTNmb4f3aJggL0j+K
 UT0W01U2pBJ3rdD++PU5zoYzU21biwTHlt0hQ3NxwEQ6HuF7sVcVxL3ZbK0v3c7f2Hy635GRTqrkD
 OIHHEw3OtT3EhWpnOR6HF+Iq/DTDRz73BUjKVNo0ZFGcIB1U0563M/ftlC4hD6+UUxaRFHNoIRNhD
 2lhcjTJ1PBJHIPXNKC1NYGmeCiSfcpp7GdyIgXWZVMwisdC8KCJZiD6YXUJxgg1/IpB1KS8KcI6mV
 Uuhk9nJ6cILsLJ1usRmrkmw/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m2ZOD-0002lY-P6; Sun, 11 Jul 2021 13:20:58 +0000
Message-ID: <3114701225467154473e2ad34c5ffa4b943cfc86.camel@samba.org>
Subject: PAC Ticket signature in Heimdal
To: metze@samba.org
Date: Sun, 11 Jul 2021 16:20:55 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze,

> > We most likely also need to change some apis in order to generate
PAC Ticket checksums
> > (Wireshark support is being added by Isaac and me, see
https://gitlab.com/wireshark/wireshark/-/merge_requests/3570)
> > and also for compound identity PACs when offering FAST.
> > "wip: rework PAC and AD-SIGNTICKET for S4U2Proxy support"
> > https://github.com/heimdal/heimdal/pull/767
> > might also be related here.
>
> I took a look at PR 767 (which is related to bug 14642), I managed to
> get a poc working, that is the kdc is now able to issue a minimal PAC
> with all signatures even without hdb support, this would allow the
> removal of KRB5SignedPath while keeping S4U2Proxy and its upstream
> test working (we don't need delegation-info for that, and we can live
> on the NDR boundary), I've updated the PR.


Looking at '_kdc_pac_verify' (aka 'samba_wdc_reget_pac'), which is
called after the kdc checked the server signature, I think it currently
does three things, first it checks if the krbtgt is in db to know
whether we can check the kdc signature, if so it then (second) fetches
the right key by the checksum-type to check the signature, and then
(third) it update PAC buffers  such as logon-info and delegation-info
(at which point the server signature can no longer be verified..).

I wonder if we can implement one and two in the KDC and change
'_kdc_pac_verify' to something like '_kdc_update_pac', see the PR
changes how I'm trying to implement it.
For one, that is checking if a kdc from our realm issued the ticket, I
compare the header realm with the requested server realm, and given
samba should virtually always canonicalize the realm, I think this
check is good enough (this is similar to what we did in MIT with
KRB5_KDB_FLAG_CROSS_REALM), and I think this test helps my case:
https://gitlab.com/samba-team/devel/samba/-/commits/iboukris_test_cross_realm_logic

Implementing two is simple enough, we fetch the right krbtgt key by the
checksum type, like samba does (note that this doesn't solve the kvno
problem..).

Do you think this can work? Any further thoughts on this matter?

Thanks!


