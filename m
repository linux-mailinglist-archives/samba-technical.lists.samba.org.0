Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D4655224
	for <lists+samba-technical@lfdr.de>; Fri, 23 Dec 2022 16:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ExiLrZ4qeG5hbEJbeoaxCUA1985T5I9y/GXx24DCchI=; b=Dc8NPXSeYx69n3rJmeOZYPv0T0
	n12KnxZEOuNGhS23kgF3Oqqd7uKD0VVDV0wp6iaThNS+LWDvN+adbh3a89q/2GVxvqUPbcjFEK8y3
	1kRg1bP33w/gpgFQ42KpsoMlaipLPurstjMotbTrlSsYuQd8EBfqPq7RjIPcLOd4mxgFGfWY8YEQ8
	J+6++reoNSaPxb97ITqQaH0YXtjL8nY+wa2qdhicmBN9sdiivgB6ZpVxwj6gNqCBnswrgLOB/XD8t
	RHTM2OS96HpWAxsr7gq3hp/pSxmfd4/BlrqYauoL+WK/ckWk5NDFusIw9EgDJ6cBXK3CvK4efCapv
	W/JdeXPw==;
Received: from ip6-localhost ([::1]:28908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p8k4b-00B2N4-H9; Fri, 23 Dec 2022 15:35:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26514) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p8k4W-00B2Mu-My
 for samba-technical@lists.samba.org; Fri, 23 Dec 2022 15:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=ExiLrZ4qeG5hbEJbeoaxCUA1985T5I9y/GXx24DCchI=; b=Y6yLG85EyyJ0MCPmTPyK0uetR6
 UbnKYV/lMfw+D5FBE8HkCequ7ErQpVzQ1jJh88RIt/wjKcuBN9+J5qLTEj2T+jm3uATz+KQh1GALh
 zhRak3KIwkgf77MnI8841wGKejrGP0v3T30oN+Om5Ivq0ZF+WhieitOSHHtWMJp3mS0jUjXpzO2Tn
 ED5r61kPpZXHUjvyBWQMiDA4A6T2OUdfFgdv4qUIHZiiOMOGbU+MjCHFpafzW7OUps3bjKimavoCA
 6GUNGn9hedVUnObQWBNUG7JirV8S/dva6wVg58Fihdwibs7lM1ZyCdZH3IGijX+1Hfsj8Bcy9Vmhp
 zWNQWJE7ZTDUsESFdSCNwtBJ1GSTDaPyppXDczVRzVMEcAcPX/IJBwH48Xvc3yFg9mjKlxhyABJ4B
 0fgVNurw2DH0olHvbHyi0X76ikUvJP78yEhNLOHXytas5y8erBKrxbuhaLuSqZSVhOGj1VDrN+YZx
 Dak3XOK1iXoUmx444Gckdkbv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p8k4W-005BQR-1E; Fri, 23 Dec 2022 15:34:56 +0000
To: samba-technical@lists.samba.org, Andrew Walker <awalker@ixsystems.com>
Subject: Re: "access based share enum" is broken since 4.16.0
Date: Fri, 23 Dec 2022 16:34:55 +0100
Message-ID: <2130605.irdbgypaU6@magrathea>
In-Reply-To: <CAB5c7xpsB2E_QrrpLFKsf3wmL91FWrJGeewwkM=VFjVYFanAeA@mail.gmail.com>
References: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
 <4452622.LvFx2qVVIh@magrathea>
 <CAB5c7xpsB2E_QrrpLFKsf3wmL91FWrJGeewwkM=VFjVYFanAeA@mail.gmail.com>
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

On Friday, 23 December 2022 16:20:06 CET Andrew Walker via samba-technical 
wrote:
> On Fri, Dec 23, 2022 at 10:12 AM Andreas Schneider <asn@samba.org> wrote:
> > On Monday, 19 December 2022 05:38:33 CET Andrew Walker via samba-technical
> > 
> > wrote:
> > > On Sun, Dec 18, 2022 at 10:40 PM Vyacheslav Karpukhin via
> > 
> > samba-technical <
> > 
> > > samba-technical@lists.samba.org> wrote:
> > > > Hi,
> > > > 
> > > > It looks like the access-based share listing is broken in the recent
> > > > versions: "smbclient -L" shows no shares if this option is used.
> > 
> > Bisecting
> > 
> > > > points at a7c65958a15149918415b7456d6f20ee8c9669d2. I rolled back to
> > 
> > 4.15
> > 
> > > > for now.
> > > > 
> > > > Regards,
> > > > Vyacheslav
> > > 
> > > FWIW, I have MR with fix here:
> > https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-fix-access-b
> > as> 
> > > ed-share-enum
> > 
> > Hi Andrew,
> > 
> > I'm sorry, but I don't see a MR with this fix. Also we need a bug for it
> > and
> > backport it to 4.17 and 4.16.
> > 
> > 
> > Best regards
> > 
> >         Andreas
> > 
> > --
> > Andreas Schneider                      asn@samba.org
> > Samba Team                             www.samba.org
> > GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> 
> Fix has already been merged:
> https://bugzilla.samba.org/show_bug.cgi?id=15265

Oh great, thanks for the pointer!
-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



