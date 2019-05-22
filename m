Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0E26656
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 16:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Iltb2ifm1YegDzEF32AWQ5EWz5tKO3s65EUnvfOguz0=; b=J6Mh4DnYLP23p/91jZpOO4NRQ5
	s6qsos2vsGOAPViVH/dz/ZXL8yrPN+Lfszu/ZICVUb6yRbdiX/3/ukf8uMmS21+6NsFjx+Ya32FEJ
	kw61WXnmBWoZjlxVzIRrVX4PGOurYV5SSfXg4kt5fW0D3daurpcZHDWcLmwFeIMJ/6ReTVcAIO/Op
	DPLa+cXsLTRe5roWALlQnO800EcpS4rQFbFJC9ni4rfQ3xI2s3I0CKHWD6PS8YWvOJ6sMZR5CQ4YJ
	jJIwzlcY0OlgTP3gmJ+h5BPRtb4NxZLsc1oHq5+nnkXpzauiKxoLoTlCD/ds9Agt27NjE2dLAWE7B
	2CnzSZ8g==;
Received: from localhost ([::1]:37846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTSbb-001HiK-14; Wed, 22 May 2019 14:52:35 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34916) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTSbW-001HhX-4m
 for samba-technical@lists.samba.org; Wed, 22 May 2019 14:52:33 +0000
Received: by mail-pf1-x42c.google.com with SMTP id t87so1475913pfa.2
 for <samba-technical@lists.samba.org>; Wed, 22 May 2019 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Iltb2ifm1YegDzEF32AWQ5EWz5tKO3s65EUnvfOguz0=;
 b=ONuzu2n8xIgxT5hqmqE16/52OkeMbmKh0rNRElZP5i/Q5qWDUa4ftR9thxixWQ3A98
 fMTgzHlfNOPkAa5YZivCdSYdgsnZA4GcUHxB6Xi7CF6r4AU+NotRV3qZvB1rKBN4tRlU
 tUJv7c8sR0WQUTlbIUcBHDeJ+EGWVjl87WtwR6wqCCQj1dQZwBWy877vhH+GweO6dBTG
 E744BZOYPwV724H36SkDcXsffh3m/WQCAIDonM7AzK1HsBuf2PXh8eBfy8oVGC83TKPS
 IBL+8Dnw61xem0gD5hjO8HdXf+ija87LmnIPGf9/7CoTfCtWUZKGxLeAYl7xA+uSfxJH
 9wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Iltb2ifm1YegDzEF32AWQ5EWz5tKO3s65EUnvfOguz0=;
 b=fcOcQwq8tyERVqyDT85eJBFoltpuSEtQ1KN9zF20BPe0xLBk5CHCnePb8D5/QLgjgr
 SdjTfyGVyR1bR5eBbIYEyvZaoyMuy4b22YoBkEWAfPtdofE5JlkqvclDbNt2Eu+qqBwH
 +2WQMSgmz2tOQVM1T1dlGlcSlrcEmLkmXuTwhAPrJtxxl/E4vMxiKyg0YAEKIP7s3mee
 geGx/Gj/JdzV0lcLfiNCUTsz7BMPdOWsGaF+VrjrJO+WeAtsYOxWJd09yHgCHjBblEn6
 tmmWbb8C5VaMZg7bsxIpOmPK3ryi9eMBhZZcwC4QdPrp04mwyoGofQ4TW3niOiEnuKYy
 Lu2A==
X-Gm-Message-State: APjAAAWJE+oXXav5qPHwqjl5ny/eLH1X9hatg3s4qb3fh/uNCsysY5vz
 b5k2HJnB1orfIv++YJ3ZMEaP8ZOHSsQWqaqc0R480MHt
X-Google-Smtp-Source: APXvYqwzaFulc6uzrOkLAeXVQQsNeoXjkDcZWoYCwCR8mzBPbrK/03grEXpAX8oH70Gtn13yEZP0o3vB1NmkQANMACI=
X-Received: by 2002:a62:6456:: with SMTP id y83mr31450007pfb.71.1558536747202; 
 Wed, 22 May 2019 07:52:27 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 22 May 2019 09:52:16 -0500
Message-ID: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
Subject: Kerberos and Samba client tools
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was noticing that the username and/or password seems to be ignored
in different (and possibly confusing to users) ways on various client
tools (smbcacls and smbclient for example) when you specify -k (for
Kerberos authentication).

For example if you do:

kinit gooduser
then
a) smbclient //server/share -k      (works)
b) smbclient //server/share -k -U gooduser (works)
c) smbclient //server/share -k -U gooduser%password (fails with
"Preauthentication failed", ignores the -k for kerberos presumably and
tries to authenticate)
d) smbclient //server/share -k -U baduser (surprisingly works - probably bug)
e) smbclient //server/share -k -U baduser%password (fails with "client
not found in Kerberos database" - this is probably confusing given
that the example without the password worked)

And to make it more confusing smbcacls behavior is different:
a) smbcacls //server/share file -k
b) smbcacls //server/share file -k -U baduser
c) smbcacls //server/share file -k U baduser%password

All work (unlike the equivalent cases in smbclient)

We probably need to figure out what behavior is expected - probably that either
1) warn if you specify -U and -k together (since smbcacls ignores it apparently)
or
2) actually use the -U when -k is specified to look for that specific
user in the kerberos credential cache, and if not found to prompt the
user for the kerberos password so we can authenticate (kinit or
equivalent) to Active Directory

-- 
Thanks,

Steve

