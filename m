Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D052951B1E
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 21:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sXmv0rmoVJ0UFhnTzdQARYWS7+Af9W+ln3++XJeZKAs=; b=IdUeOPblB8vZF/CLe4CLh24Hfq
	XaIQzKnY6DYH9ICtsBaPWgeDFAfkzj4zcFrTvBRl205byRUS80yVWwr+8i6qRL65+5m1yU/0LoTW4
	cGG+rx2OzgZ56HawvJXjmg1o5ANzEh1AREuyb7fdVdsNjkvGRvKH6lc+dZos7yVI+0GQ81mqJTTRI
	9vvx4eo7ypUYef6/IRIDZ7NDnvamQiH5yJ3T7eE+PC1wHY+DJx961fmcuQmEHXwKymkkQctHiwIsU
	bBgmOeWtezB01L3upPMmfoHGqrc8KwUcavEY0FXD7/qBiCmrnNHyLNU3XFqvzrr5F1GDzrdFeou5n
	Je6iztng==;
Received: from localhost ([::1]:34762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfUEn-001WWo-CY; Mon, 24 Jun 2019 19:02:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfUEk-001WWh-3D
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 19:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=sXmv0rmoVJ0UFhnTzdQARYWS7+Af9W+ln3++XJeZKAs=; b=iNYrUYfgQAIWFuayPUnKySmHiw
 YneD7/bY4dVAGsbyNkk8Fn85qG8PTJgo3YYcDdKxkzlTYA8ZzG7p0cM54IsKvNIbG/LdFaKe7oukk
 YEFJx7mrMdFmW/Tar4sdcTklsurJo16/wVZzChdC986WjCgbhukwGYyRRa6J5DJMObpw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfUEi-0001Rc-KK; Mon, 24 Jun 2019 19:02:41 +0000
Date: Mon, 24 Jun 2019 12:02:37 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: xfstest 531 and unlink of open file
Message-ID: <20190624190237.GD3690@jeremy-ThinkPad-X1>
References: <CAH2r5mv+oqGxZRkV_ROqdauNW0CYJ7X9uJCk+uYmercJ4De41w@mail.gmail.com>
 <CAN05THTqP+_uSEPq2FqBEnV8FeuutaHASznH6iBDS=C0hCD=kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN05THTqP+_uSEPq2FqBEnV8FeuutaHASznH6iBDS=C0hCD=kQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 24, 2019 at 01:44:53PM +1000, ronnie sahlberg via samba-technical wrote:
> On Mon, Jun 24, 2019 at 1:23 PM Steve French <smfrench@gmail.com> wrote:
> >
> > Xioli created a fairly simple unlink test failure reproducer loosely
> > related to xfstest 531 (see
> > https://bugzilla.kernel.org/show_bug.cgi?id=203271) which unlinks an
> > open file then tries to create a file with the same name before
> > closing the first file (which fails over SMB3/SMB3.11 mounts with
> > STATUS_DELETE_PENDING).
> >
> > Presumably we could work around this by a "silly-rename" trick.
> > During delete we set delete on close for the file, then close it but
> > presumably we could check first if the file is open by another local
> > process and if so try to rename it?
> >
> > Ideas?
> 
> The test is to check "can you unlink and recreate a file while someone
> (else) is holding it open?"
> 
> I don't think you can rename() a file while other folks have it open :-(
> This is likely a place where NTFS is too different from Posix that we
> can't get full 100% posix semantics.

Yeah, this is one of the places you need SMB3+ POSIX extensions
(and even there we fail it if a Windows open exists on the same
handle).

