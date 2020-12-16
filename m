Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E72DBE79
	for <lists+samba-technical@lfdr.de>; Wed, 16 Dec 2020 11:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=asXNBOibR7wMbBcy3fG4A2AtkRemXxNb/fkCI9Q+U0c=; b=iUtfM/4RQWYHUMffeuSPmPQDkb
	tvrzCwXzFQSmdJ9mdI01s2QwxYTURZPwmD2pS7J8+PL1y4AE3zXL0Ek/k9O1MU+GcgTYrc+iyeI+b
	6BwxSjgt++FahEQZfG9T6pu3IpXA2cmZT81Ng8z2CYv3oSgDKR7eeWDJXLCzzTc47qiP8lUZ/9YvR
	o3Ze69AbBOpkci60EBds2a4jOrl3fSWSiOQJu109wARkN8ub+z6F0fweyh+WUsSMnuwP6C7Ki4Qm3
	FmouoNUScFH5o7l4oQ1PnQGL9IYVHZrqBkSYMCJVdrnHe4/MIfyYOgNVg+gdR4yYdhIQsdpjyyExY
	N10YlaHQ==;
Received: from ip6-localhost ([::1]:34340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpTto-001YgC-LF; Wed, 16 Dec 2020 10:19:12 +0000
Received: from smtppost.atos.net ([193.56.114.176]:26005
 helo=smarthost1.atos.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kpTtb-001Yg4-RO
 for samba-technical@lists.samba.org; Wed, 16 Dec 2020 10:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail;
 t=1608113939; x=1639649939;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=asXNBOibR7wMbBcy3fG4A2AtkRemXxNb/fkCI9Q+U0c=;
 b=H7EWgeQgdNwkmwI1Ta5aN8s0C8PqxapGbZJ9hO4lSdh5xGGxQfXOb+cr
 y0XVVP+Ink449pBQKTfBZKZN6RCEILZDvXAtjdohGPm1KduepCdHNDhzz
 CLdQrmZ0omuy9hF2y93jSRed2Wsg6wEMaBEb0pqlDVkQ4PZzPKourHWKu U=;
IronPort-SDR: iiP4Ohx3fsFpWp/7hB0IDrV1sl5bqoDOWDYn+YoFSt6PHLXNd4/SAgXx+HqmJnfrubp8K1TSSv
 WTaPjHr8YFETpAWyjXOWjqhPY4daW+0XA35LXmltvXOrru7viqHKAZD/7XnBq4neNp7UEwP/yi
 IW+wPxADkTAflHv1wjFRiFc0kZYCkgwYDSWfblkRVEKmXTovD95XHpQU7RYjHpT7ikSpak+XzM
 Omtkeawwuc2fZBzETLVlM/uYYScvWfLy6btEwTjSfm6F3YbQEgRsQN9j5QKzhnnG2ZD1Z0Uv8M
 vLoZGlEyMmh+baItpLYVAemo
X-MGA-submission: =?us-ascii?q?MDElAbH8poHKPY0mhKeYHyM4yklhUJLqB9ELqf?=
 =?us-ascii?q?RqjS1UXk0XfHxQ3rGfvk7+tF90ln5icDNizqXGIUhqg98ja0wN18wXpI?=
 =?us-ascii?q?S3IRP3UXthulApQ9FPZG9eEpsY8b/sQlk2rJ8MPwLu8IRjhyJ9E8Quhv?=
 =?us-ascii?q?12?=
Received: from unknown (HELO GITEXCPRDMB11.ww931.my-it-solutions.net)
 ([10.89.28.141])
 by smarthost1.atos.net with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2020 11:01:44 +0100
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) by
 GITEXCPRDMB11.ww931.my-it-solutions.net (10.89.28.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 16 Dec 2020 11:01:43 +0100
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net ([10.89.28.144]) by
 GITEXCPRDMB14.ww931.my-it-solutions.net ([10.89.28.144]) with mapi id
 15.01.2044.004; Wed, 16 Dec 2020 11:01:43 +0100
To: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Subject: cifs-utils, Linux cifs kernel client and gssproxy
Thread-Topic: cifs-utils, Linux cifs kernel client and gssproxy
Thread-Index: AQHW0tgPe397r8v2v0y1SGaypM9pOQ==
Date: Wed, 16 Dec 2020 10:01:43 +0000
Message-ID: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [160.92.209.239]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Warn: EHLO/HELO not verified: Remote host 193.56.114.176 (smtppost.atos.net)
 incorrectly presented itself as smarthost1.atos.net
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
From: "Weiser, Michael via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Weiser, Michael" <michael.weiser@atos.net>
Cc: "gss-proxy@lists.fedorahosted.org" <gss-proxy@lists.fedorahosted.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have a use-case for authentication of Linux cifs client mounts without th=
e user being present (e.g. from batch jobs) using gssproxy's impersonation =
feature with Kerberos Constrained Delegation similar to how it can be done =
for NFS[1].

My understanding is that currently neither the Linux cifs kernel client nor=
 cifs-utils userland tools support acquiring credentials using gssproxy. Th=
e former uses a custom upcall interface to talk to cifs.spnego from cifs-ut=
ils. The latter then goes looking for Kerberos ticket caches using libkrb5 =
functions, not GSSAPI, which prevents gssproxy from interacting with it.[2]

From what I understand, the preferred method would be to switch the Linux k=
ernel client upcall to the RPC protocol defined by gssproxy[3] (as has been=
 done for the Linux kernel NFS server already replacing rpc.svcgssd[4]). Th=
e kernel could then, at least optionally, talk to gssproxy directly to try =
and obtain credentials.

Failing that, cifs-utils' cifs.spnego could be switched to GSSAPI so that g=
ssproxy's interposer plugin could intercept GSSAPI calls and provide them w=
ith the required credentials (similar to the NFS client rpc.gssd[5]).

Assuming my understanding is correct so far:

Is anyone doing any work on this and could use some help (testing, coding)?
What would be expected complexity and possible roadblocks when trying to ma=
ke a start at implementing this?
Or is the idea moot due to some constraint or recent development I'm not aw=
are of?

I have found a recent discussion of the topic on linux-cifs[6] which provid=
ed no definite answer though.

As a crude attempt at an explicit userspace workaround I tried but failed t=
o trick smbclient into initialising a ticket cache using gssproxy for cifs.=
spnego to find later on.
Is this something that could be implemented without too much redundant effo=
rt (or should already work, perhaps using a different tool)?

[1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#user-impersona=
tion-via-constrained-delegation
[2] https://pagure.io/gssproxy/issue/56
[3] https://github.com/gssapi/gssproxy/blob/main/docs/ProtocolDocumentation=
.md
[4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-server
[5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS.md#nfs-client
[6] https://www.spinics.net/lists/linux-cifs/msg20182.html
--=20
Thanks,
Michael

