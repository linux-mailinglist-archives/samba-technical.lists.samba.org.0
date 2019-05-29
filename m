Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EA2E5B5
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 22:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TBPjHOzp5WtNEy8VAWjpHMHSC72DtDN4epi0Yic5T60=; b=4anZt+1+95BeToq50Ggv1cHRHl
	9TPXueM83qtNshxtfwmRbEPCFuuwVzwSePPNU72R3xPGnTAJu+hmaYluWtZr5rdPf4s/+sqeX0puT
	SYhiUSVvCqDwEFhb5SSa69kytXzSYn6BefI7/xN9CsukKnXzGg8Wtxo4G8Io0D//B2B5rlTpduS2a
	/yx7Ne1MIsLX8uwoLrH0QjUewGDZohyZKMCXpSe+MF5JcqpYerZXP4W5pne9xd1eoveQWsgEui5X5
	0Z8fLRz5j7xwFWwzvNqcioXBPmnFhnU/HB+HdUNVgb+GCWy1lDYIlkCwKPKpAx4cIbrzanC+AdBO8
	XoXAq4Dw==;
Received: from localhost ([::1]:38690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW4oD-002VzP-QP; Wed, 29 May 2019 20:04:25 +0000
Received: from [2a01:4f8:192:486::147:1] (port=58448 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW4o9-002VzI-62
 for samba-technical@lists.samba.org; Wed, 29 May 2019 20:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=TBPjHOzp5WtNEy8VAWjpHMHSC72DtDN4epi0Yic5T60=; b=jwZplVQI/Cn37Ne8c22uUyq6vs
 e6OYb9hxg4P0ydOYanKwKET0epp4aapXwEKCmDuM/nBs3YTT7h/nUYZrN4QgaGYm8Am4EqcIfnVfv
 8pYI2DDZ3NGzbiKTadnCmrfiXR0oiZPUFpwH1JSIrIz3LMYARBtw+JXmk1XGtOkxJj2U=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hW4o3-0005GH-6C; Wed, 29 May 2019 20:04:15 +0000
To: samba-technical@lists.samba.org, Isaac Boukris <iboukris@gmail.com>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
Date: Wed, 29 May 2019 22:04:14 +0200
Message-ID: <2736033.mZseHfHTOk@krikkit>
In-Reply-To: <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
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
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 29 May 2019 18:47:56 CEST Isaac Boukris via samba-technical 
wrote:
> On Wed, May 29, 2019 at 6:03 PM Isaac Boukris <iboukris@gmail.com> wrote:
> > Hi,
> > 
> > Attached patch fixes the delegation-info blob to be the same as
> > Windows KDC returns, by adding the realm to the correct principal.
> 
> Metze points out that this bug is already logged as:
> https://bugzilla.samba.org/show_bug.cgi?id=13133
> 
> And thank you for all the other hints!

Could you add the bug to the patch comment?

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13133


Thanks!




