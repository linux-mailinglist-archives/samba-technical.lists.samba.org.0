Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC89404208
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 02:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MQJbhy4v6QdPUrFr6Ry2wgcXtOE8NQFtXTMolI+chIw=; b=jQtpKC0xqjzZExIbld0HgfBRWx
	zhNPHsxaJIlm3+zz5KTXjvhmuvLaXpGflIZm47I+7iq+ZuHl8yeh8kaE4WDhCtmUe5+bBBKtmkrl+
	O2dbmxNBJ55CiKsz90gv5jR7Gs+2SYmBz/ZEDq9OgoJhqUdSfUC00vxoxTy2s3UCl/FjgTEUxcF4u
	wBI+gW5vd0ZPr2FXM4m84E71K7i0QMTfj+RXs7wo4w4veBQ9EkG1YXGsQYp8IaQ8CKLITiIA+gbLY
	bqhtxWQzheEHNijZ9F501iXmAUlGPTgMLU/qJJEsI9pLtTHqpi4jF6ZEWGQOBiGjilIZBkbUYiNFm
	RKW1QERg==;
Received: from ip6-localhost ([::1]:51820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mO7aX-00Dvht-7X; Thu, 09 Sep 2021 00:06:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54314) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mO7aR-00Dvhk-9r
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 00:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=MQJbhy4v6QdPUrFr6Ry2wgcXtOE8NQFtXTMolI+chIw=; b=LmqDt+rYkrsXu1HDnmDHNRGWX4
 +/Ee5SMYwe0I5qecbYtMJk6Rt6bDTkY2HPdQwjs9L3w313Xl/7FbhPerRWMS9dGiBXd7LANSIJv1x
 pNgYMxEnFm+7dg+i4aXckUr2rcLQfNrWl63QgnxM391r9jvM005Ibubj/Nu1QrsqGvYLKy+maEa6c
 DbBGvVjmuHRf+roaZkwfFOY6YttpXk8cfefGHZLtTX+GFxWvdf5FZPGgli8C7p0Sh8hEGMBKPJ4ly
 xiZP8QTaMRZcl1qsJuV58ZekM3FfHHYt8LvjWWOalD8U8bzl2UgwFRd51MFp1ezaL3ePOAanA2jtR
 ms5Qi+3Y64iJYecbs7zpQkunGk3NaaG1i4ZOYcCD+z8Rgea27XMH7h94utQtx6tU9+iZUM5d+rlF0
 XEw71t1VCtK+QkXy3V79P0SVEvOR/cT/hGrtasgFqBWaGcxvRqXzcV4trvhQ5n2SfvEQq/mhva+e6
 Z0ezNtk5k6toz0e4nH3op+JD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mO7aP-005InS-OE; Thu, 09 Sep 2021 00:06:38 +0000
Date: Wed, 8 Sep 2021 17:06:35 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: autobuild[master] failure on sn-devel-184 for task
 samba-no-opath1 during test
Message-ID: <YTlQC/Zq3weSfyb7@jeremy-acer>
References: <E1mNuYv-009jQZ-FT@sn-devel-184>
 <1fda50e96d3e1fe3a0f57f23e29ea7fca3941624.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1fda50e96d3e1fe3a0f57f23e29ea7fca3941624.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 09, 2021 at 11:05:47AM +1200, Andrew Bartlett via samba-technical wrote:
>G'Day Team,
>
>I'm wondering if someone can look into this for me.
>
>I'm trying to push Uri's oss-fuzz changes, and I keep getting a failure
>here, in what I honestly hope is unrelated code.
>
>Has anybody got any ideas what might be going on here?

I've seen this on occasion, but only when the autobuild
machine was under heavy load. There may be a race here,
that isn't obvious (I took a look at the samba3.smb2.notify.dir
code and don't see anything immediate).

I kept pushing until it got through.

