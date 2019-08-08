Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6C862A6
	for <lists+samba-technical@lfdr.de>; Thu,  8 Aug 2019 15:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=TxBt0nhyj3Qugp/fj4+sEG5ctf4o22cuCBt1hFx3huQ=; b=16Eyhmemtb5v8nJZkptnhV6ssF
	CMJcHw+VOpsiMoKGjHo8Jk91uQBvHjJLROWI1zZ0RHpNvTZsCJ2JZ+NTkxqmHBHuSk9MpTvNklE9d
	bI5XEmCXhKH0NplusPocet0DhY4smA1/rR1MIm6dnfa8q+s3pdHNQTB8P8hJN7zLsOY7zO/eAMh2g
	avIFSd8vSDJmlpU1iSOl3yzhcZ2TKiT+UP3UU8JmHp5bngW53o6dbOzih0qsFpqLJJqmkQDzYUX7T
	gVNeyWnWW7vfJL1QNedorarfeRACIkRKvkqFNuYdPy6cRXFLAY4T7wDTuPgwpbeb+I5HMQhs3F7j2
	PiAT30ug==;
Received: from localhost ([::1]:30854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hviB4-005AN1-Ux; Thu, 08 Aug 2019 13:09:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hviB0-005AMu-Qr
 for samba-technical@lists.samba.org; Thu, 08 Aug 2019 13:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=TxBt0nhyj3Qugp/fj4+sEG5ctf4o22cuCBt1hFx3huQ=; b=SqlBOaM5D70wK4km40LgK1KAQX
 R+MPASVCa475VIS2t7IeHz/h8AYbEEIS/EBKj6CjJv2CnldGk0NKnkOzBSxBYP64tqM6parUw9v5Z
 iSbHtomLPOO/g7ZWvYN4Luo/a/URobGZ7QaEmzBcejbpsTHbTd3+MB45jhbTN4FsdYsM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hviAz-0000c2-UV; Thu, 08 Aug 2019 13:09:54 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
Date: Thu, 08 Aug 2019 15:09:53 +0200
Message-ID: <2881045.bibbPyKMdu@magrathea.fritz.box>
In-Reply-To: <1565240829.4444.5.camel@samba.org>
References: <1564547155.4261.48.camel@samba.org>
 <3136808.qJGijLCe70@magrathea.fritz.box> <1565240829.4444.5.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, August 8, 2019 7:07:09 AM CEST Andrew Bartlett via samba-
technical wrote:
> On Thu, 2019-08-01 at 08:58 +0200, Andreas Schneider wrote:
> > On Wednesday, July 31, 2019 7:37:10 AM CEST Nico Kadel-Garcia via samba-
> > 
> > technical wrote:
> > > I only repackage that, I didn't write it, Credit where it's due, and
> > > 
> > > quoting from the README.md there:
> > > > > This is based on sergiomb2's work at
> > > > > 
> > > > >  https://github.com/sergiomb2/SambaAD
> > > 
> > > So Sergio gets credit. But I'm already using it for RHEL 7/CenbtOS 7.
> > > I've done some very limited testing with RHEL 8, but am waiting for
> > > CentOS 8 to finally be released to really test  that.
> > > 
> > > > > [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> > > > > requires AES-CMAC-128, but the impact would be far more constrained.
> > > 
> > > Fair enough. I'd say accept the requirement of a compatibility library
> > > for older operating systems, and I'm glad Sergio did most of the work.
> > 
> > Is there a copr repo with the compat-gnutls34 available somewhere?
> 
> Do you mean this:
> 
> https://copr.fedorainfracloud.org/coprs/sergiomb/SambaAD/package/compat
> -gnutls34/
> 
> Andreas,
> 
> Can you take charge of getting this into to the CentOS7 image used for
> CI so we can proceed with this?

I've started to work on it ...

https://gitlab.com/samba-team/devel/samba/commits/asn/master-centos7


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



