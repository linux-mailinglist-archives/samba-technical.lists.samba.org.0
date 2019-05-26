Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015F2AB9D
	for <lists+samba-technical@lfdr.de>; Sun, 26 May 2019 20:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cjk6hFeBNr/oJEcrYxY1oTBQZsUN8pIryeIiMk7xY0g=; b=Zv/ZzBnMGbfmBnWKY0n66HyqiU
	YthbNy51Lgq7w30PjeKY1a3c2gQSoYC51yya0X/bHrvQbGG3mDXVVEvWOnx+BaBLAYAw4C/A5DW3x
	fJEDPZEm6NaPz8FM2gaxNidt8oOjRTOh4+al9xbGc9MkuKisY0kfscvaKQI6kc0yCerDmG4oVUCAs
	yGjiVBY9hMaoeccNSqzSHDalG+CUfGY76QUSmkEz7lKvSrV7cE0ZX2A9MPclh5ceNbgxc3kTZ1eh5
	TX2hDVnNTQqtoreIijnbPdp5DutNG8nAJpRzvTb0CWkFtNECsBypMK5DcdDSNFJOV4/iEyZ9mzNDD
	FawAw2FQ==;
Received: from localhost ([::1]:45508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUxqY-001yiv-8Y; Sun, 26 May 2019 18:26:14 +0000
Received: from [2a01:4f8:192:486::147:1] (port=42638 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUxqT-001yij-4P
 for samba-technical@lists.samba.org; Sun, 26 May 2019 18:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=cjk6hFeBNr/oJEcrYxY1oTBQZsUN8pIryeIiMk7xY0g=; b=YNcMN9KnyT91rxcPiieyhcCC25
 f1f8ydBfaCHvO7gUrqQQkk2xR61g9t6jyElSfbgFH/xv/89pbs+kZc3G9Oq3Xklq6E84T/QMTfZkb
 kXALSpM/LnZ5JpLDjvy8KPss91KDmzmxHfxruLOj0rMl6V754is5YLQrHRxlMv79ncWU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUxqM-00082f-RA; Sun, 26 May 2019 18:26:02 +0000
To: Steve French <smfrench@gmail.com>
Subject: Re: Kerberos and Samba client tools
Date: Sun, 26 May 2019 20:26:00 +0200
Message-ID: <11826585.dasZr9x98r@krikkit>
In-Reply-To: <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
 <2585169.WRIv5fHKiD@krikkit>
 <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 24 May 2019 19:30:33 CEST Steve French wrote:
> A related question (to your "--user-kerberos=yes" (or auto) is "which
> ticket will it use" and "can you get a ticket on the fly by specifying
> this with userid and password" and can you override which users ticket
> will be used in SMB3 session setup?

--use-kerberos=auto

  Check for a credential cache and try to authenticate. If it fails ask for a
  password for the user who executed the client tool.

  -U check for a ticket of that user, if not available ask for a password

--use-kerberos=yes

  Use the credential cache

  -U use the credential cache and check for a ticket for that user

--use-kerberos=no

  ask for a password for the user who executed the client tool

  -U ask for a password for the given user or use the one supplied on the
     commandline


Makes sense?

Comments welcome.


	Andreas



