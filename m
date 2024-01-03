Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A17A822FAD
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jan 2024 15:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5Gf6yVhAv9f2rq7jigdRYPH0tEWw88szm+CnwRKddM0=; b=QXzDkm6rvTdFT9R3Vh3GsNt5TA
	5T20M5TvxOeIL5asNZKwRdDHBb45rZ9jnHCWI6hb62lZcj7W0sshIbWTmoPKZBoam6+jDByVJXBe5
	fj4LgS6xY3D+bKjraCViW6SzUfQGa0J2wARPwJwwfdJTbqpPjZVoABga5/XZuvYTCwog3B07U7Ib/
	hw9MhVsXuffSYvf0HtkftfxY59RHZ1O6TFbHgo2IGdOfP6StGdZRAQwhtqPAm6k7W9uiIHD0PMyzz
	/L/qgYWpEFo51NCfdumg84SnSDuDInzWFfSV1uxptA99gNDCM+s8IElwPRy1IqHsdTtkvRjm+M55j
	HwJzRmbA==;
Received: from ip6-localhost ([::1]:22592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rL2N3-002D24-5e; Wed, 03 Jan 2024 14:37:23 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:41366) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rL2My-002D1x-9U
 for samba-technical@lists.samba.org; Wed, 03 Jan 2024 14:37:21 +0000
Message-ID: <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1704292635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Gf6yVhAv9f2rq7jigdRYPH0tEWw88szm+CnwRKddM0=;
 b=rczfx8TKkKI1CshqnrRJ92rd/e+XtYZEri4JOGoKkOF7LL3aq7BxGWUyjJbGthZapWRFm/
 zIKXDcbD0sPjKHuGWNB4tWzFZppYPio7FwJIK64Hl2AG3ZbjnRiZDlnlOFlYN3Z3IxSTXw
 Uq5rTMemV7CeztejsknIdFUxUv3pGI4S3bR/I+sHON5rnGDgHfb19obPOaltEWY4KjL6l+
 8O7BfEOD287BamSYqvtkzlGvGA87IwkX/BWuYltXDXs0M7KmBCSzWxXOZJF1f24OoNvOfc
 1Anj+9fVBow15YryJv02ySLEY/QjGn5noFT0TpEFzHzBwH6bgZHhQdg+TvzvXQ==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1704292635; a=rsa-sha256; cv=none;
 b=eU2mU/Q+iESvc3pgxBA7qtu2SJYIFXZKRjcgxdNRshuCr2Asafo4IU/oXEWcJPVau8dNzL
 7Lj84Z5GP+8ZVq3S0QsgayJt87jaLP6ydTH4wDp2H0CnD/Nu4YQ1yDR/ZlK1KkHHL4gXI3
 3v1WPlro/zcGnJnMgFbPwHcaTuPtRCc+b5KniPBiElQPuKZ803Ilzbm9ZK1HD6qKVngtrU
 dl2WUhHFhqUW6lblkLji1shTZ+AgMF6dm+lkb2OEIG/Gji5C58o7lcFc93xwsRXa9d/Rzy
 PmGSsZDDFeOFeW2xulUDiEwD3xMbsPp64zY2hIjhop5Yx4P448/UK+Z7InMykQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1704292635;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Gf6yVhAv9f2rq7jigdRYPH0tEWw88szm+CnwRKddM0=;
 b=Ba0F1KBeeFXcPhgQdNyKm9dJ8Cz2S08VQE1jYK0b0jPD2H7ZUMNuC7WOCPlXiOw+HEFx9B
 KLLBYoZrOJXYdidvOzt0S/OHW9XbOqlcKhbwIYVQyR4iA9rSWjtsJfdu3HWkq4BUwSn0N/
 kx3MkNNU/wNwNKSc9FDiOqAOxU18a/hMnX+wKwS2feRZkqgki5cQZJqGtfFqdG8zpBpthZ
 fikfu0P3c5GEnQEwkSDKuv9QptiMkdIBiAhNzPDLcWzfq7A41cAUWdpLrO8advp9moeXbz
 F9iBM+LEoaSS+xlktarpPVhWzsJs3Gyl3C+p4DAOhwt9gFrfdp2RCkBSrIceKw==
To: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
In-Reply-To: <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
Date: Wed, 03 Jan 2024 11:37:11 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: nspmangalore@gmail.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 lsahlber@redhat.com, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Meetakshi Setiya <meetakshisetiyaoss@gmail.com> writes:

> As per the discussion with Tom on the previous version of the changes, I
> conferred with Shyam and Steve about possible workarounds and this seemed like a
> choice which did the job without much perf drawbacks and code changes. One
> highlighted difference between the two could be that in the previous
> version, lease
> would not be reused for any file with hardlinks at all, even though the inode
> may hold the correct lease for that particular file. The current changes
> would take care of this by sending the lease at least once, irrespective of the
> number of hardlinks.

Thanks for the explanation.  However, the code change size is no excuse
for providing workarounds rather than the actual fix.

A possible way to handle such case would be keeping a list of
pathname:lease_key pairs inside the inode, so in smb2_compound_op() you
could look up the lease key by using @dentry.  I'm not sure if there's a
better way to handle it as I haven't looked into it further.

