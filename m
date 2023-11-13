Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C3C7EA299
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 19:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yKSrjtxbuj9NYHKxn0CA+1z9ujAMfGaUyn32vutlNYo=; b=bt44A6AharFacG2G1IfCtr28wU
	p+skxwfXsc4taPlWlMULNRuLsCLzvka/74+wUrk8YCt4ET+AEPSWO3EwfULSnOgBtyl5btEyx8k8P
	qupxW0yvBryqR1bt/Pa5kOxx9ZhC8qy+5BwQTZBrT0ezNA/cQdnIxw2gzYEN7n9fnqH4ZYcz5lCRG
	j2MjH8zMhtUlqzOiF1v0TalFJEpnX6UFXPxtrHhY7US2SkCCClnugMkfzDSYbG5DDAC+XlieKU8Qa
	ukgRY0one7guuy+Qa1sTa8n6J3DIJqa80yPq3zSRS3isZr17/Mx7u9q+jyfkS7gKFU1Gy+ivmaTe8
	mPC8Ky2w==;
Received: from ip6-localhost ([::1]:43902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2bPk-0087nm-SJ; Mon, 13 Nov 2023 18:12:00 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:53528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2bPc-0087nd-Hq
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 18:11:56 +0000
Message-ID: <05bfafca49fbed96ea500c25a0606205.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1699899102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yKSrjtxbuj9NYHKxn0CA+1z9ujAMfGaUyn32vutlNYo=;
 b=GS9FJ1mCnxnQQpV5S3pvgFV9msp4MULkEwJy1c84k7K7H4tMkrRAo/OHJgjf1KxZiME0Ez
 Aij6N9cc6+/bjJcwRW0+W/d5VeHSNjXM3ihtIUZ6E0+ppNaEBIXmXPnZMgdc3QingLZoRe
 v5JChg++fLyyap+EjEnc1GDKVj2A2ktX8pbl3IHfejKB1VUUiow4oNDE6OzH8EpkIXSpy0
 MZvEaq0ykg0RK8VXMLcd0slkweWBacy4e6y/UlJ6+87IdGrDnomK2QC2CgxBQaNfVANxKH
 12S5J2U43Ptx8yQ2jRNbHMnR/kHDAAJCquHAFRy2QJ18D4v2DHrMoc151/y2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1699899102;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKSrjtxbuj9NYHKxn0CA+1z9ujAMfGaUyn32vutlNYo=;
 b=Tk3B5gXGy4901LYXYS682EHokjf4ZKcukDBWeDHKrt/1G11h4KMuqDDZLg/710GljnuQZF
 i+cPq2hgmhMuLBhOdSlBg34RU9HGAri4zsSGCeIZXKwx43VcOd9JTy1ehcCmDHRPKar+SQ
 q5virzBVEr8vBcdrAsSKep/TpmNlshcVqhH7EIBMLtkjyWQ7cr1/Pz/yH3+KpSnNZkTd+2
 YvJ1rABBI7AV+HD0VBT4Mp5xXi6mgHluR1vJ2tWWj5Cxai+jpaqv9dNXNrdfz0+IqYaWvd
 GTK+Gqa4wD9bMQjr9lLr14Odjk9eeDsTZmqPk0YNhMJiLJ8oAM9QauXfPJAfeQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1699899102; a=rsa-sha256; cv=none;
 b=NQIi+hdOWOW3kWFB0mPd14F7ABAkz4M01Mu2/JUeZA8xWS9BNMrgAa7Hk+f8RzTlY+4USC
 GditludfOky8+Kt6u7v+RepyLRQMDkRMCvCZqV+VA8qgjhnvfO6gb76AmnIW5c8KNDdeiC
 IQOYcWGh+LHonLr+bYuaUkjxH3c0RXg1CAI/8stYwDVNlxQ60d2pccDeaY/wyUjhXQRy7a
 mpexNcTund2kk3S/Nz96GI8ihM6a7HCfIHnWT6VDd7f5T09/bS0sDo6LQqu3fDAvwMYMTF
 wHJLBsLfAOy7v6Ot+hVb3WArZcmeE2Inzn0esrehbvvNkal7GdQH/VgweC9DCQ==
To: Anastasia Belova <abelova@astralinux.ru>, Steve French <sfrench@samba.org>
Subject: Re: [PATCH] cifs: spnego: add ';' in HOST_KEY_LEN
In-Reply-To: <20231113145232.12448-1-abelova@astralinux.ru>
References: <20231113145232.12448-1-abelova@astralinux.ru>
Date: Mon, 13 Nov 2023 15:11:37 -0300
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 lvc-project@linuxtesting.org, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>,
 Ekaterina Esina <eesina@astralinux.ru>,
 Anastasia Belova <abelova@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Anastasia Belova <abelova@astralinux.ru> writes:

> "host=" should start with ';' (as in cifs_get_spnego_key)
> So its length should be 6.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 7c9c3760b3a5 ("[CIFS] add constants for string lengths of keynames in SPNEGO upcall string")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> Co-developed-by: Ekaterina Esina <eesina@astralinux.ru>
> Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>
> ---
>  fs/smb/client/cifs_spnego.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

