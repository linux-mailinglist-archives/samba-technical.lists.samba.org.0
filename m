Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3CD162DBC
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 19:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VQSP3ib1oP9Ft/sPHmQ1ULc/GF2fTR4eMlqaA55wTog=; b=rMobHy5NooBP5B+HJd9kUM3+6G
	TIA8ZVQcCBp57Y6uF4fzCJAR4gU3Kl1wShAdpq1ZjLnD5UFbwWeWBHUK866vf/Zq2cRSvbrE6i/Ws
	NGmKrbd4WTg0FGGKioFQ+UnEbDD+N3lnYgT4ulLAR2d7BOjqPV6vXyLgMKf+DoN3twiprRWyZTdpf
	LCHz6Cc+Fs9HH7G+CxL6KcmbN0tINDrWy2WBsVm6WHkyD1fcpdKbtNpGPg8/LnLPCqIi7zdBjtEjK
	HJdguOLtT3DupBQrfs1X+Sf3OrRiKnZ2X59zzML4TZcYi5o9vqyjOv0dD8gf8cQ+/Pev0yUUpEl/A
	O75wRzvw==;
Received: from localhost ([::1]:22224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j47FV-00AQ4z-8d; Tue, 18 Feb 2020 18:05:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j47FQ-00AQ4s-0t
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 18:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=VQSP3ib1oP9Ft/sPHmQ1ULc/GF2fTR4eMlqaA55wTog=; b=PA3DUWsGM7L0fAUbQMkNbph2lT
 MOKrl3D4jCT4SXLVO2A9hA2Ky5dFjhg3A+J0I5A3rCfY0S3SXQb+hBNlLzJESdS3Y9aLhEFnMNGc5
 +DkE6NXfZ94qvmWPchRQEdKeQIPzCaXxTtXJmWWrlTUJcNxaHufDoRVhJazmBkzrQUS2ckRt+Ht1f
 sDoAQ/wBv/VPTdkiBIa/ne6KwRB87NukjxNzZ+tCCSKsPOHfaFvE/+CIErWhMJa0pHhCUHec+mFUr
 hW66mllQXUXwPHaahMBLKBjx7Q6XcJzQ2GFvIjvMWyxJIlnmDceyrVnVX2uykQ2tDiwlD857TC9OS
 zBgmjRvys3sMmaJREUkkNZTlTz1oMNzdlVW7IcfTsjohvPrxGzQ2rWTttkgZ35GWTRKu1cxzqpOyg
 hU+0ePQka8QeW0oAyra34JVGnChmgsgKz7Dlc4nyo3iMN02aOt3P41YAFg6HpdCgQcd6BmtySB2n9
 P0S3YNlQNFLvELEDEAAfXcid;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j47FO-0000eK-0w; Tue, 18 Feb 2020 18:05:26 +0000
Message-ID: <7dcdcb8bc691012aba2de432563586575de2d995.camel@samba.org>
Subject: Re: QNX6.6 cross-compilation problem
To: Nicolas Pinault <nicolasp@aaton.com>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Wed, 19 Feb 2020 07:05:21 +1300
In-Reply-To: <0102017058ba17bb-c855beaf-ff0f-4652-9716-c1c5c6995aa9-000000@eu-west-1.amazonses.com>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
 <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org>
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com>
 <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
 <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org>
 <1bce721f-c5d6-ab32-1e5a-167741775092@aaton.com>
 <0102017058ba17bb-c855beaf-ff0f-4652-9716-c1c5c6995aa9-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-02-18 at 14:35 +0000, Nicolas Pinault via samba-technical
wrote:
> Andrew,
> 
> Le 17/02/2020 à 18:08, Andrew Bartlett via samba-technical a écrit :
> > On Mon, 2020-02-17 at 15:14 +0000, Nicolas Pinault via samba-
> > technical
> > wrote:
> > > Hi Uri,
> > > 
> > > I'm using Ubuntu 18.04.4 LTS (32-bit).
> > > I use vanilla Samba sources (4.11.6) downloaded directly from
> > > Samba WEB
> > > site. No patch applied.
> > > 
> > > Looks like asn1_compile is a target executable, not a host
> > > executable.
> > > Do I have to run waf with special options when cross-compiling ?
> > 
> > This is a known issue:
> > 
> > There is a workaround patch here, but do read my followup there for
> > why
> > it isn't my preference and so why this isn't merged yet.
> > 
https://lists.samba.org/archive/samba-technical/2019-October/134438.html
> > 
> > The patch is here:
> > https://attachments.samba.org/attachment.cgi?id=15558
> > 
> > I hope this helps,
> 
> Thanks for the patch and the detailed explanations.
> 
> After applying the patch and re-running configuration, waf goes much 
> further in the compilation process.
> The error I get now is :
> [ 552/3064] Linking bin/default/libcli/util/libsamba-errors.so
> 15:23:42 runner ['ntoarmv7-gcc', '-shared', 
> '-Wl,-h,libsamba-errors.so.1', 'libcli/util/doserr.c.1.o', 
> 'libcli/util/errormap.c.1.o', 'libcli/util/nterr.c.1.o', 
> 'libcli/util/errmap_unix.c.1.o', 'libcli/util/hresult.c.1.o', '-o', 
> '/home/nicolas/samba/samba-4.11.6/bin/default/libcli/util/libsamba-
> errors.so', 
> '-Wl,-Bstatic', '-Wl,-Bdynamic', 
> '-L/home/nicolas/samba/samba-4.11.6/bin/default/lib/replace', 
> '-L/home/nicolas/samba/samba-4.11.6/bin/default/lib/talloc', 
> '-L/home/nicolas/samba/samba-4.11.6/bin/default/lib/util', 
> '-L/usr/local/lib', '-L/usr/local/lib', '-lsamba-debug-samba4', 
> '-ltalloc', '-ltime-basic-samba4', '-lreplace-samba4', 
> '-lsocket-blocking-samba4', '-lsocket', '-lgnutls', '-Wl,-no-
> undefined', 
> '-Wl,--export-dynamic', '-Wl,--as-needed']
> /home/nicolas/qnx660/host/linux/x86/usr/bin/arm-unknown-nto-
> qnx6.6.0eabi-ld: 
> cannot find -lgnutls
> 
> It looks like I have to cross-compile gnutls for my system. Right ?

Yes, GnuTLS is a requirement now:

https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba#Mandatory

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




