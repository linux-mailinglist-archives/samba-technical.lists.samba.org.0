Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8064E8B20
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 01:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Byo14DcBxqdAU0l1AefOfcJXigf0aWtdZKExKDKo3WI=; b=m2x2wvjdqam8GkonZsDbuzrMtA
	K0CcHV52WtwIJYqfGwYz7ngKxnILXSg8ieV6E0791vI14mHhggNe4tMhxSYRkoJC7MjywxEIyNB3U
	LEj7ieXm3xlXrL4+KwPwxPv3l8LNOA1siwmXrbh8BtB7AoyUL/HyG/p9UpTpG52fXTWDdQLYFnp5H
	B4R/wQzjCkS5uN2Wzs3tGrBRhRHEVCntRE/jrLe0op/Khc0lc8GzbE//H9oxRaxI3gXV6c8GRHVFY
	EkTdHeM/S//+XhwoqmKEw6K9hOLHqvXBkCeObqWsLJFsxgkLVNmMQPim5s6J4X/1CMLp3BkSNUvmI
	qWF9SnXw==;
Received: from ip6-localhost ([::1]:26582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYcgk-005mWV-JZ; Sun, 27 Mar 2022 23:52:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYcgg-005mWM-5A
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 23:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Byo14DcBxqdAU0l1AefOfcJXigf0aWtdZKExKDKo3WI=; b=oeJ4A1EYwcpd282zI0eTKqidyg
 wWRjq1m7LLnQfGhBAk18ufz51UveTMMKZY21r6+IWl/e7XePsaJqiAij1iy1uBKCsUFvZtCijQpeV
 QWI0AWp/nODLxpkbm46yeVdjYHxiQKGQs/1IV7O96Mq1E/C3vW357As/59o9ZADasz+tjnQahqY57
 BRpGM/SOjOLDY54Ym5g1tDTBQffcwQdK6V5fMRYIxZkyRxnU9W/xbkMT5hL3sYarlMW4QgrNdz/Bh
 CK4n22uiCA51zwv7qTKGaqFiqXJV5qjl+8oyXLdXWDlOE8NvZM+xp0ZMrE2/X+vs3f2zoBeXEAGsu
 1K1mWTGpGJ5nI7aKshEIWknc9YODJKVzN7UoXyL7f1315ZG2oS/HMVBMineglPSzuZJlMSoaYFaYs
 oiKAsCbUGuhC2zNLfWNGKFmO85O8sMesDZWzI5e63YfSlwpHjDv7zrSYBl56z/miI3o4v45/5QBaG
 0nUje0dK7VcA7CjRN8h1dA8I;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYcge-003s9i-85; Sun, 27 Mar 2022 23:52:45 +0000
Message-ID: <a2240c745392efe4c8ebceb4ce8cddf73271cd22.camel@samba.org>
Subject: hex_encode_talloc() in libwbclient
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Mon, 28 Mar 2022 12:52:38 +1300
In-Reply-To: <97e26db1-4dd1-149d-d01e-d6431ce5ecac@msgid.tls.msk.ru>
References: <5e2f2d0c-a182-30e7-8e18-00b239042cb1@samba.org>
 <97e26db1-4dd1-149d-d01e-d6431ce5ecac@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-03-26 at 20:12 +0300, Michael Tokarev via samba wrote:
> Right now, I'm trying to deal with one missing symbol when
> dynamically
> 
> linking libwbclient.so: it misses hex_encode_talloc symbol since
> obviously
> 
> lib/util/util.o file is not included into the wbclient library link
> line.
> 
> Is libwbclient.so supposed to be buildable as shared library?

libwbclient as an LGPL shared lib must not depend on lib/util/util.o

We need to work out why we have code that gets brought in to
libwbclient.so that needs this symbol.

This might be related to the work we have done at 
https://bugzilla.samba.org/show_bug.cgi?id=14780 to ensure that we
don't include private libraries in libraries like this.

We also need to work out why this isn't seen in upstream Samba default
builds.

Did you work this out any further?  Can you get us a minimal command
otherwise to reproduce?

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


