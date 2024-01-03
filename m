Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA448228AD
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jan 2024 08:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ldGETZ+T3xa6abor73WXYKqIj5ewC7bnZ7t7OJq/40E=; b=doFcHmNnw5yiWnteXAsH4HqaF0
	ouZbb5MrOfuUjWQJtLEj3KA/UfkoGtTRHfQjqqffokL2YA6Beeyz0CA/TuL/YEYMpKsRg8qEVYoc+
	jvbjpsNxRyREg1lM7u+MFIG2l/omftf/zD5NB602+9YKF+4E//xeRCK5phIX6+wNVh8oQAiaV8YMs
	/qfR6B+KcGMTwsgqZJPRFqF5w4nbJrB0rduI+gpwNa8s2B/+7u6aJGyq8A/EBjG7ODt/nW9gOOJH9
	3hPcfRZxsaGcbGtpfcCepU51I7nIsQbCH/mZ3l18aVkFssUihd//jo32tMMMTX619aCYVewJBC4Y8
	GAQ8ri3w==;
Received: from ip6-localhost ([::1]:29020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rKvF8-002C1y-Bm; Wed, 03 Jan 2024 07:00:46 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:55549) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rKvEp-002C1p-Ve
 for samba-technical@lists.samba.org; Wed, 03 Jan 2024 07:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1704264614;
 bh=ldGETZ+T3xa6abor73WXYKqIj5ewC7bnZ7t7OJq/40E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f5Ca40ieTbGP61lm8c6Ua3yVYznnL1nXQAtpWN33jAB3WCP6JDJNSszIVkczcJ1lF
 3lR/jJyHeNoDNhgZi2xtpWEaJLzzDiADzE33usEymgpUo8cE3G1vzA27Iul/Npe4yF
 pgi9uV8Zs6Tq5L3DWDJUIdimn2xyc70oRpm4eP31hv8ncChDHx5qEi8dtawaJL8OWp
 jSvzzyMa1q4xm8RWA5Sdh3DOaU9IlflGxLYTHynX0f80LLj5ZVWMU2iOzm188b41In
 zds7UBHS5yKUCY4CK17PEiFO1bI5AOacl7XtiihCASIrZGcl5O9YMfpMpOjBGUqWzD
 t5MXTbEHkatag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4gMT6NNwz4wp0;
 Wed,  3 Jan 2024 17:50:13 +1100 (AEDT)
Date: Wed, 3 Jan 2024 17:50:12 +1100
To: samba-technical@lists.samba.org
Subject: Re: CTDB and per record persistency
Message-ID: <20240103175012.51d1d4bf@martins.ozlabs.org>
In-Reply-To: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
References: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Wed, 27 Dec 2023 07:40:57 +0000, =E9=99=88 =E6=96=B9=E8=BF=9B via samba-=
technical
<samba-technical@lists.samba.org> wrote:

> Hello , I learned from Ralph B=C3=B6hme's speech on persistent handles at
> the 2018 SambaXP conference that amitay had proposed an idea
> regarding the persistence of each record in CTDB.

> I'm curious to know if there has been any progress since then.

As far as I am aware, there hasn't been any progress on a new CTDB
database model to support persistent handles, with high performance.

> If not, are there any methods to help CTDB seamlessly handle node
> failures, preventing failures in the replication of files?

I'm a little bit confused by this question, because I don't understand
how "replication of files" comes into it.  It is really about
replicating file handle state.

I am seeing things like
https://gitlab.com/samba-team/samba/-/merge_requests/3461 (which I will
review very soon :-).  Mention of witness protocol may indicate that
someone is working on persistent handles... but I'll leave it to others
who know... rather than guessing myself.

peace & happiness,
martin

