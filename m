Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8898476DC
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 19:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ne2PNFmYh0HKRCbfrIepnvRgbPBqXT/2/Ha5j+IG/vs=; b=AZecBM7FZVnkoNA/FLvVsyjBsq
	Q29uicKZKBW2lAt0tiiU3ppG3XEiD2PSrBs4Sy8LLZ1WGf7UNtTr4lQu+RIFnq+xWoRgF+vMOTlUj
	Ix8sKZ6OjDRPsYakUM8yAxx3SiVgAuYY7zFYcikLjJN0nlmk0UwW99iHN/qCv8Ztrlf3op6CNM9on
	MwmBYxzFnZZouU0t3P2/FeEJYhCVJgZd0H+0e5sHqZqB0lN7PPvDHfLbiJmLwaaJUsVLokM86GslO
	KeKr9pf740XQHiPEExl6WNS+kNvrUiewKzXP+XiBseM7VOikl0xva9sGxdirsIGcCAQHGJQjDE9mM
	4dyTfr/Q==;
Received: from ip6-localhost ([::1]:50270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVxow-007Myf-UT; Fri, 02 Feb 2024 17:59:22 +0000
Received: from mrkos.uberspace.de ([185.26.156.186]:48106) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rVxos-007MyX-JB
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 17:59:20 +0000
Received: (qmail 29348 invoked by uid 990); 2 Feb 2024 17:58:15 -0000
Authentication-Results: mrkos.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by mrkos.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Fri, 02 Feb 2024 18:58:15 +0100
Date: Fri, 02 Feb 2024 18:58:13 +0100
To: Kees van Vloten <keesvanvloten@gmail.com>,
 Kees van Vloten via samba-technical <samba-technical@lists.samba.org>,
 samba-technical@lists.samba.org
Subject: Re: State of unix extensions and symlink support
User-Agent: K-9 Mail for Android
In-Reply-To: <b978bca2-947d-4f66-851c-9db0ee4def57@gmail.com>
References: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
 <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
 <B3566794-B5EE-48C7-AEF4-EC9E9477ADA4@lrose.de>
 <Zbv6YVRRuyluQM3i@jeremy-HP-Z840-Workstation>
 <b978bca2-947d-4f66-851c-9db0ee4def57@gmail.com>
Message-ID: <CC41138D-0486-49FF-AB92-FEFE4CE68935@lrose.de>
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.442629) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.542629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrose.de; s=uberspace;
 h=from; bh=G7KHjfKahG1JQgHNN0IeRaEyB3oi60Nz2GbyNWollUk=;
 b=NaKY9GPTb0CV1HcK4m4x9+91xaX5jETtA+bhKO3cEZB8QR9cUzWDAmu18hvoXXcK0p/GmveyvA
 kefOxcD0x0nOooD1AYFt992U5RhNV3QacvsZlS/mMq9/NtUNm6dLBEyQP9IxV0wGElhMeKt/UNfA
 24zFwVbCL5gdih53+khVf4ZYq3oQpGSjtJDiLri1zcNZCHQyP2cq/7tXOFP7PC2a97mlfiGO8YKN
 8l6KBwUy6OVNN3+zMQKBZF3EujXVCRZnaPXQN3He7sHZEcZlE3DX81O5VPHOrzBb6HYojhHBETvn
 ZY0avHGPW2xbiYSVtNcJazXhM+MOgEHtVJ8XYg/DqzD7piQ6NfiUuAFpYiVVCohcocU1RfwnwyS8
 am5MOxevQknkvBt4/i05/NcLLzvMc9171alLsREORmXq7eNj90oyDQJ4lymzZn+lxVLh7ErqvyAR
 kCKQ43eMIbSp7ynqZUHXFA1D498eBcAj6z1scDo3bLm0ZQG8DtNft8oYUWfqGAqcnLRJPjzYfn/E
 OxgoVOsDKaektnDidPOwnT27fDvytqUIeRtjbw/GaFAhW3MaPWwzeJMQ3VtraN91b+5HSFl87dRk
 CT3q9UWc8Ic4UtXU0+Y6vpaEKaFy1tlW9qqnV4zF5GjKnuJObELU+mq2q424L8nCJWzmTVIkDGhM
 A=
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: lukaro via samba-technical <samba-technical@lists.samba.org>
Reply-To: lukaro <lists@lrose.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for your replies=2E I have already heard of security concerns, but u=
nfortunately I didn't understand these yet=2E If the symlinks are created a=
s symlinks on the server and also returned to the client as symlinks, the c=
lient can't access any files it doesn't have access to, even if these are r=
eferenced by symlinks=2E Or am I missing something?

Using the file system smb mounted on the server as well is unfortunately n=
ot an option in this case, as the file system is a cluster file system that=
 is mounted natively on many clients that also need access to the symlinks=
=2E
