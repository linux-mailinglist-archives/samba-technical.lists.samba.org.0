Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9655E54F
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jun 2022 16:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ymQMuH7hFK3WzcRLc0LGp/C4izn2McNJhjcItkmxcc4=; b=B8VALw0Fppt6Yt3MvWkYsLFpgY
	A+3zt0xwVo3aijI03HU5tD4CGcU98DQHMj5KeHZLLa86xMDWfOpgkDKNnX1C8pHWgmchIAfP9LNtp
	4nZYqhh/Kbyz5rRCrosfeucBZUfKMzLX+DC8JJgvNVCg5/J+jqtV/XTZStWj5/HTtoWaGXiuqaaII
	og8B8GWH6UR4ckKqMo43n916nMB7/cpB/X5A938fU4HAgtAObE/9GTOmXO94UFfjb4C6whEJjuy7Z
	TY43ReL6+23NHukDpy9RdiHqsaQRKdi7SVyPgFN+KVWGA0C2yBWl7j7HwUTiGYLCjP4RU6JFVzTcR
	q0+A7/xA==;
Received: from ip6-localhost ([::1]:39680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o6C8r-00DClW-Cw; Tue, 28 Jun 2022 14:24:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33188) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o6C8l-00DClN-0t
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 14:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ymQMuH7hFK3WzcRLc0LGp/C4izn2McNJhjcItkmxcc4=; b=w/OGRsf4bwiSNdfrS4U6YSsGI+
 YZsbk0e1NGivmBzk6ie2Tr4hiaL7pdxMbf7tcwHHWUzA8XSwxf1E89Pe8w8Sqqv0wa0apRQQXrMzz
 s0cMUqyjzAS9F619LEw4L1zXg5n1Ddf+h8ipowMf+8txTx1OozvYc6xR78WMtsajGFMP95WaBrrTu
 U7DE5l5xkgIAYcrUQZV69pMFqKhiQWeYVKeQd98IwGHDU1d5mL9+9WIrOqhkthVSd7BegP+bLFMHP
 dDfV+q3v3vZR+0fFLelSzP6sOaGdQC8XuAVw/1N4/wGaxyBLEhgjeu8Xi2Fm8LiI6G+M+8kYTQy9H
 3reNC45Ko5DZbvPVmGIED8VKg3EZLqfiehKL+iFZ8E/kOwupdQCuS8N/D5y6pg1zgFX0XrPXtoAr4
 ip5Vq2iNd2V0pDa0YBgRwklryKEiGg5x2S1/dDdfebZH3AC7QlQKahpK2Yss66NdMmounizUc1y5O
 CtjP8SIm1ZxYUsTHV3d512Zw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o6C8j-0027k3-Mr; Tue, 28 Jun 2022 14:24:29 +0000
To: samba-technical@lists.samba.org
Subject: Re: Expand groups with Samba 4.15
Date: Tue, 28 Jun 2022 16:24:28 +0200
Message-ID: <3459742.iIbC2pHGDl@magrathea>
In-Reply-To: <002a98fbfe8742f13b5d975e4db80ec37a6bcf3d.camel@samba.org>
References: <07c7040e-f4be-a6f1-5c50-80db9f39c101@univie.ac.at>
 <002a98fbfe8742f13b5d975e4db80ec37a6bcf3d.camel@samba.org>
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

On Tuesday, June 28, 2022 2:50:10 PM CEST Rowland Penny via samba-technical 
wrote:
> On Tue, 2022-06-28 at 14:23 +0200, Robert Weilharter via samba-
> 
> technical wrote:
> > We have the following AD-setup:
> > 
> > Domain: USERS: Most regular users and groups exist in this domain
> > Subdomain: SERVER.USERS: samba server is joined in this domain
> 
> I take it, that by 'Domain' you mean 'netbios domain'. if so, you
> shouldn't use a period in one, so your netbios domain should be
> something like 'SERVERUSERS' or 'SERVER_USERS', a bit late now.
> 
> > smb.conf has "winbind expand groups = 1"
> > 
> > After upgrade to 4.15 (latest version on RHEL 8) "wbinfo --group-
> > info
> > USERS\\somegroup" did not expand groupmembers.
> > 
> > Reason is, the default for "winbind scan trusted domains" changed to
> > "no".
> > 
> > Queries for users in domain USERS with wbinfo still work as
> > expected.
> > Most queries regarding
> > groups do not work at all (group not shown) or give incomplete
> > results
> > (no group members expanded).
> > 
> > All queries for users and groups in SERVER.USERS work as expected.
> > 
> > After setting "winbind scan trusted domains = yes" everything works
> > as
> > it did with version 4.11.
> > 
> > The release notes for 4.15 state "`winbind scan trusted domains` will
> > be
> > deprecated in one of the next releases."
> > 
> > In our current setup this parameter is needed.
> > 
> > Is this expected behavior, or should we report a bug?
> 
> Probably both.
> I came to the same conclusion yesterday while replying to a post on the
> samba mailing list, I was awaiting a reply to that, to confirm it one
> way or another. It looks like I do not have to wait.
> 
> Rowland

You will never get a correct picture with `wbinfo --group-info` this worked in 
NT4 times but not in an AD with forests and different kind of trust.

We only get a valid picture about a users groups during login. The DC is able 
to collect those information. A domain member with just a machine account 
doesn't have the necessary privileges to get a full picture. If it does work 
for you, then because your domain setup might be simple enough.

Don't rely on `wbinfo --group-info` to be 100% complete!


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



