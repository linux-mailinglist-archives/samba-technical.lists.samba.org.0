Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC6F275A7
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 07:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7v7ReF7O+tAUKfnwdmPv9FQ5hdEuuaN8zcPS6O9I5xs=; b=wZ8CmCC37XIQhGHiHu+G110AEt
	ALcxhdAW69gqVUOCA5JMoe+1gdqMbbqH3OyCuFo4sPQTQvrwvodlq/ClFXoR8RxSE2FUPnXmpHFuk
	IuTFf+AipUDUtTsSlQ4CZcRgIbf0wOuoz64CTPwjBSYxLelvNxBBGcWLynvt4LPGthM1EBL3XyZ5E
	ri4TAoiFSOKYdoUtmfq4w4cORRQSFFWHu0gziN+k7H791xkk9qwxlCH5QuWNsQx8oXsTi1gTgQJWg
	9Wtguk0AlTOXRKWwMwwIiBpTRrifn7WozAYwwCp0nH1UXzclL5HbERRSmVjteWkdBWgyuF6HQTF56
	PVl81GVA==;
Received: from localhost ([::1]:27994 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTgVV-001O3P-DH; Thu, 23 May 2019 05:43:13 +0000
Received: from [2a01:4f8:192:486::147:1] (port=41710 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTgVL-001O3I-Gm
 for samba-technical@lists.samba.org; Thu, 23 May 2019 05:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=7v7ReF7O+tAUKfnwdmPv9FQ5hdEuuaN8zcPS6O9I5xs=; b=gw8zepQG5BU5ZaJPfZiZ2VKryE
 6NKeyFvcCOmjalczWoP1awz6c8/4TUAaCUVC8tpd7YxI4/zevaF6N+mmCagQUmAffP/pmW002VNZp
 Ny5JC6e06cB6r8xejmrYpiKX2ydFqUN6nQk5K5VjtuvOdIJNXHnDAjpcZslJbhG0Uh/w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTgVF-0004WQ-Rm; Thu, 23 May 2019 05:42:57 +0000
To: samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Subject: Re: Kerberos and Samba client tools
Date: Thu, 23 May 2019 07:42:57 +0200
Message-ID: <2585169.WRIv5fHKiD@krikkit>
In-Reply-To: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 22 May 2019 16:52:16 CEST Steve French via samba-technical 
wrote:
> I was noticing that the username and/or password seems to be ignored
> in different (and possibly confusing to users) ways on various client
> tools (smbcacls and smbclient for example) when you specify -k (for
> Kerberos authentication).

Hi Steve!

> We probably need to figure out what behavior is expected - probably that
> either 1) warn if you specify -U and -k together (since smbcacls ignores it
> apparently) or
> 2) actually use the -U when -k is specified to look for that specific
> user in the kerberos credential cache, and if not found to prompt the
> user for the kerberos password so we can authenticate (kinit or
> equivalent) to Active Directory

this is a known issue and is also an issue with FIPS support I'm working on. I 
will rewrite the code to offer a new option.

	--use-kerberos=auto|yes|no

Auto will be the default which means we try kerberos by default and fallback 
to NTLM. YES means there will be no fallback and no means use NTLM.

-k will mostly be working as before to not break any scripts.

So I have a lot of work ahead and hope that makes sense.


Best regards,


   Andreas



