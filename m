Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580246915C
	for <lists+samba-technical@lfdr.de>; Mon,  6 Dec 2021 09:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=N4BaLJ90R5PQhgKyJnbZ/iwZoWQZiuzebH8J5wvmUbk=; b=3xkHSgOtN/+I2qMGRAIPKz6OEq
	XNAELXZpsZmGHtCZKsjZdY5lBAKvycySc232r9SuqRs6M+SpZCytu1pZNW+RHdZA7YFIm5lPkeulf
	RcnHH/IIYu1UxApeP3oKR+NZPNeZ0TlLwZMXxFPH6EY5qji1vRGKMoqHLSGN2/sdeHzB/12dbtnFF
	c40v0IWyhSqEnxoaxXHUzSnmEgo1V/ZGT3WAqe4NKoN+xgdqw+q2iE/Sqox3NIXTKQHvqbd+RZWYk
	TXJSp1j5Yef41UIWZ/CaPPB9WbbMGBb7kmGH9KheQ3yT3t60jv7yfEk+AnVFjcbn8CtGXhqhPdug/
	gLV9nkKA==;
Received: from ip6-localhost ([::1]:61824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mu9FB-003Tbg-IF; Mon, 06 Dec 2021 08:21:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mu9F4-003TbX-BC
 for samba-technical@lists.samba.org; Mon, 06 Dec 2021 08:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=N4BaLJ90R5PQhgKyJnbZ/iwZoWQZiuzebH8J5wvmUbk=; b=eHMQVSoXmcvELm83jov8CQMv0s
 EqZhYwQ/t/EbnxihkteM6jl/pjMARaDJSPrRLr2AiVPmRJxWm2ytcH+YEF7dcTLvzwMiGOToV5pWd
 5PWtJisTOlnvzJVcYLG1eyyNvIpLArEq+0MwqlPUQdFJZS7vHe9Ccoi/y3OBXA3aJagiWx3fuciKN
 sqZIDBTIkr4vyBBM+yxsUgfucGdY3odBMfHwb0NqIRfmoBQsb+D6T2BnjrprAIfWNcl29gWg8mjz2
 yA3DPk6X760UMooH2Wxfn3FT027r+JZCjFfLFBGQmtWCMkLjeS/F83Dg/ZZbKrgIQQKz8/j1Da8e3
 TxiQkDaCHw5jw7qrJYrOMR2t/WmsjwC3DtE/hz1taxOFzpacLbjrahGbomcxSjD/obUVj+Ej6m2J1
 KIMdwBwkXwaLaXQdP/505p3qa0HR/o9gprTdInwPiM57O90dikE//fGIAz0Of666w0vgHLPK4U7Hz
 gyqxC++N6gSpI0H5zWzUA4NB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mu9F2-001MCI-54; Mon, 06 Dec 2021 08:20:56 +0000
Message-ID: <0c5a6f6d1bdd1dce9d4f859fb7b39df9c1d28a3e.camel@samba.org>
Subject: [Modern Hemdal Import] Is it a bird, is it a plane, no, its...
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 06 Dec 2021 21:20:48 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Luke Howard <lukeh@padl.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A fully-green pipeline of a Heimdal import:
https://gitlab.com/samba-team/devel/samba/-/pipelines/423099369

Featuring:
 - Full(er) FAST support via the work by Luke Howard (CC'ed) to import
the improvements by Apple for TGS-REQ FAST support
 - A modern Heimdal updating Samba from the 10-year old copy we were
running (which has FAST for AS-REQ) 
 - (essentially) No local patches on the Samba side (they are instead
in lorikeet-heimdal and being made ready to be pushed upstream.

https://gitlab.com/samba-team/devel/samba/-/commits/jsutton24/import-lorikeet-heimdal-202112010221-patched-plus-build
https://gitlab.com/samba-team/devel/lorikeet-heimdal/-/commits/lorikeet-heimdal-202112010221-patched/

Upstream Heimdal has been very patient with us as we submit the
patches, and I say thanks particularly to Luke Howard and Jeffrey
Altman.

https://github.com/heimdal/heimdal/pulls

Rather than the previous approach of reverting recent changes and
rebaseing the lorikeet-heimdal development tree we have been passing
around for the past few years, this time I just keep the build system
patches but none of the previous imports.  This is cleaner, but does
mean we have one massive 'import' commit.

I expect to trim the tree back to just a import commit, a build system
fix commit and then any test updates needed. 

We now take a full Heimdal tree, like we do for the other third_party/
software we carry.  This means we have imported a lot of files we don't
use, but this is on the flip side easier to verify and continue.  (We
still only build bits of Heimdal, and do so with Samba's, not Heimdal's
build system). 

I do want to say a big thanks to everyone who has worked on this
effort.  We are almost there! 

In particular (alphabetically):
 - Andreas Schneider <asn@samba.org>
 - Andrew Bartlett <abartlet@samba.org>
 - Andrew Tridgell <tridge@samba.org>
 - Chris Lamb <chris@chris-lamb.co.uk>
 - Gary Lockyer <gary@catalyst.net.nz>
 - Günther Deschner <gd@samba.org>
 - Isaac Boukris <iboukris@gmail.com>
 - Jeffrey Altman <jaltman@secure-endpoints.com>
 - Jelmer Vernooij <jelmer@samba.org>
 - Joseph Sutton <josephsutton@catalyst.net.nz>
 - Love Hornquist Astrand <lha@h5l.org>
 - Luke Howard <lukeh@padl.com>
 - Noel Power <noel.power@suse.com>
 - Stefan Metzmacher <metze@samba.org>
 - Volker Lendecke <vl@samba.org>

(being for commits in lorikeet-heidaml, the import tree and in upstream
Heidmal matching a --grep Samba). 

This isn't yet victory, there is still much to do before we merge, but
we are closer than I've sensed in a long time. 

What I do ask is for assistance, review and patience as we try to land
this shortly.

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


