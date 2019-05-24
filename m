Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45F29D64
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 19:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QHN5BPXdIKjQslt5TcjL3cbmH6vCaSvOhgyZ/v7PYQU=; b=OEGx7IPn94UCmojkOUmU83n0Dq
	e2Z6C2Z2lWssjlJpxzjU0pLC6dA7KhsRMkdaoZOxiHKgMwqWjzugC7JpHWEMtERIVDWUqR5XcD7V+
	ftcNCndjPS8k4cgxG7HxA+MwPlwqFx3aFsRCUIKO24m73DR3ZilVEtDR8r2s0P8p3tx9e7n/dY4Zh
	c0+ssSR/Sa6kT7veZFRMLG7nseHQ6etQOgLyfXVawePYWr1/zhj8VXRhbGKFKJjdxTpNNRyLrde7P
	49M7wfRwSUiCzBlnFeAS5oXfExJIbLLaHv+S4jN9/M1wsXz+ww4cLvbTB5TvlyjS6u57sh3hVWuSL
	vTMaPpVA==;
Received: from localhost ([::1]:28334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUEEE-001dTg-Oz; Fri, 24 May 2019 17:43:38 +0000
Received: from [2a01:4f8:192:486::147:1] (port=50870 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUEEA-001dTW-Hm; Fri, 24 May 2019 17:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=QHN5BPXdIKjQslt5TcjL3cbmH6vCaSvOhgyZ/v7PYQU=; b=Tr1jS2L/gT4pImbZC6md8eOa36
 xbmZAt/0q+zP93WUS5zTUplLD4sHazrveCnyo/QZN1VLLA9ySG3+HaH7WNhWtn1S8cm7jWnjCfEMW
 ZaL1rbLtsQ56u6s/7XaR3yyPTchMvEHJmmaxWjD38z+zqlB4j2kX5exVDgqfs4qSixxU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUEE4-0003OD-Le; Fri, 24 May 2019 17:43:29 +0000
Date: Fri, 24 May 2019 10:43:26 -0700
To: samba-technical@lists.samba.org
Subject: gitlab question.
Message-ID: <20190524174326.GB136126@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Asking to improve my gitlab-fu :-).

Ralph has a branch containing modifications
to a patchset I posted here:

https://gitlab.com/samba-team/devel/samba/tree/slow-bug13964

I want to check out that branch so I can
see his changes as a list of git refs
(i.e. I want to checkout a copy of the
repo it created for him).

How do I do that ?

There's no link on the webpage showing how
to do that.

All there is is a button with cloud icon
with arrow pointing down, which when clicked
on (hurrah, it was a "Download" button,
wish it had actual *text* in it so you
didn't have to guess what the icons meant
but there you go) shows the options of

(off topic, web accessibility is a hot
topic at the moment. I don't think these
icons work for that).

"Download source code" as "zip", "tar.gz",
"tar.bz2" or "tar".

OK, maybe that's it - download the tar.gz,
unpack.

Nope, just a snapshot of the source code,
no git information included. Not useful.

Anyone know how to do this ?

Aren't web interfaces wonderful :-) :-).

(yes I understand the irony, given my
employer :-).

FYI, this isn't a gitlab whine even though
it sounds like it - it's helped us do more
things better than we were doing previously.

I'd just like to make easy things easy :-).

I'm happy to have this email forwarded to gitlab
developers if anyone thinks this will help !

Jeremy.

