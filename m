Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4561E7ED
	for <lists+samba-technical@lfdr.de>; Mon,  7 Nov 2022 01:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=syWsD+gw4ovMv+yGHsT6yVoFQiP8SBImjQJz7Ba5Uis=; b=Q7zZK3nCZ4J7MDKTVMD4vRN/K4
	leCIW+sLxb7jo+erl2CrIQyzgYaQq74ao4290PY3AEa6Zf0oD1jSOnz5OlnMI9vCjRx94efKlFxzW
	HvuNcE4EHL7DZE5GWG+ua6tRKoaBakEmTDnALrexVRU4UAIezH6aJKHBEivwtOjRb/aW9I8BPEQMp
	UgOdXfqHJ4ZOiL0RAvz9//q88yU4PtkqTqnaw5XnLOkO7osb+ZNoHB1ccL9+qbT0NX+rA1/anc6rO
	SDjMDZsbegj7Nk13njHxy6hjNY8FkDEkp+xISHsMopymUtTjjA4rSBLAX109k1nwpn5/9pnLN61i+
	ZPGRqMCg==;
Received: from ip6-localhost ([::1]:31818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orqK6-00BCvR-3Q; Mon, 07 Nov 2022 00:49:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45838) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orqJw-00BCvI-9c
 for samba-technical@lists.samba.org; Mon, 07 Nov 2022 00:49:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id v28so9192983pfi.12
 for <samba-technical@lists.samba.org>; Sun, 06 Nov 2022 16:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gWqZqBmVuifEEEKJ6bmb4p+fZ0Rv+yr7fQb+dEUTuxU=;
 b=1LR0d77Xq6ySCJ19d68OvHT+CoP3cIhtibUyHaxcKg6357UsapzX0J8OIophbzEPde
 gNrTArpBijoqfvTNQtqyQc7MyhYW2v5mpXXEjumtEjOuaeIK/cdnaMbfn0pGjps1MZjx
 In/vTuAaEUagBgbdOwua3NFDVUO5WoNCT2Ad1kskMe5op7cFlu7ETl81jcf3g0XZY+ic
 DfAlhbp694dp+5Sia3Ox96flFjHaaYXs4Zk3SV6NwkCbzbfA8R/vw3FukmxNGt7CO2JE
 m+ovOIdE0n61vd/PQHk/nBFlRQftmrUyRCdg+f0MkLJOtipVd+AdXE+sJ0kmNux/KCTq
 AeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gWqZqBmVuifEEEKJ6bmb4p+fZ0Rv+yr7fQb+dEUTuxU=;
 b=IG1qT3u05AyiZhcrH9VYrpAqjfOyzyHYkXFaOgqbg3azB7+L9tJqtpjzqJh+gNKKXD
 v4DnvwUZqIt/P1YQzBrOUojcgCZiFRrPBZ5G0LqQbvxbMst+y+N6N/W7DL4ngB2LOcHW
 NXHYiwkRkmz8p3bL4vGf3o6c1UkcPBy0cMd39MGAROeftIwRLVWHItZkQIDOa3WBoYOf
 d0wZxQ0DQIihvJGK/gsjOp8qjU9oFxc8PVqY9pLCeheNaRYXzT4u+WoHLv70kchR8NnW
 nVnNPsFnkskSeeAgs+WpbKXkgTwS/NdGk1FlIBNZFSivT7I/wQpDQyO0bNJUYyDGGtbu
 bhjQ==
X-Gm-Message-State: ACrzQf04/N0G8a8ymXZN2MrhSJ42bvpbTL9wncdgmqqqIqjOmMGk33WS
 kwOFT401cRn+fhY7bU6grFXaR54M4QodlLdt7bitOnfZOHH/3w==
X-Google-Smtp-Source: AMsMyM7n0q2IWF/lAJH+9HhUrDoa7RrECa442XKTh9ccQwBqQNds6J4fvCmq+Ku6bx+qcJ71lJCVbv+RRdLpPtb0Noo=
X-Received: by 2002:a63:1308:0:b0:440:5517:c99d with SMTP id
 i8-20020a631308000000b004405517c99dmr26198046pgl.550.1667782136956; Sun, 06
 Nov 2022 16:48:56 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 13:48:47 +1300
Message-ID: <CAHA-KoNnFFXfyB=vR-2F6oooTnGcPVHafQOVKQDpQjaDJa-0-g@mail.gmail.com>
Subject: samba-tool gpo listall failing - what's going on please
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Got samba-tool gpo listall failing as well as the other samba-tool gpo
commands with the same error.  Command output follows.  This is on Samba
4.16.5.

Need to get it going to initialise and administer GPOs properly.

Thank you!

Matt Grant
--
smb-ad1: -admin- [~]
$ sudo samba-tool gpo listall -d3
lpcfg_load: refreshing parameters from /etc/samba/smb.conf
ldb_wrap open of secrets.ldb
GENSEC backend 'gssapi_spnego' registered
GENSEC backend 'gssapi_krb5' registered
GENSEC backend 'gssapi_krb5_sasl' registered
GENSEC backend 'spnego' registered
GENSEC backend 'schannel' registered
GENSEC backend 'ncalrpc_as_system' registered
GENSEC backend 'sasl-EXTERNAL' registered
GENSEC backend 'ntlmssp' registered
GENSEC backend 'ntlmssp_resume_ccache' registered
GENSEC backend 'http_basic' registered
GENSEC backend 'http_ntlm' registered
GENSEC backend 'http_negotiate' registered
GENSEC backend 'krb5' registered
GENSEC backend 'fake_gssapi_krb5' registered
interpret_interface: Adding interface fd14:828:ba69:12::2/64
interpret_interface: Adding interface fd14:828:ba69:12::2/64
interpret_interface: Adding interface fd14:828:ba69:12::2/64
interpret_interface: Adding interface fd14:828:ba69:12::2/64
resolve_lmhosts: Attempting lmhosts lookup for name _ldap._
tcp.SMB.ANATHOTH.NET<0x0>
dns child failed to find name '_ldap._tcp.SMB.ANATHOTH.NET' of type SRV
finddcs: Failed to find SRV record for _ldap._tcp.SMB.ANATHOTH.NET
ERROR(runtime): uncaught exception - ('Could not find a DC for domain',
NTSTATUSError(3221225524, 'The object name is not found.'))
  File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line 186,
in _run
    return self.run(*args, **kwargs)
  File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 469, in
run
    self.url = dc_url(self.lp, self.creds, H)
  File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 127, in
dc_url
    raise RuntimeError("Could not find a DC for domain", e)

smb-ad1: -admin- [~]
$ view +127 /usr/lib/python3/dist-packages/samba/netcmd/gpo.py

smb-ad1: -admin- [~]
$ host -t SRV _ldap._tcp.SMB.ANATHOTH.NET
_ldap._tcp.SMB.ANATHOTH.NET has SRV record 0 100 389
smb-ad1.smb.anathoth.net.

smb-ad1: -admin- [~]
$ host smb-ad1.smb.anathoth.net.
smb-ad1.smb.anathoth.net has IPv6 address fd14:828:ba69:12::2

smb-ad1: -admin- [~]
$
