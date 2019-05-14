Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8741C1C7
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 07:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BfkqvrJuXKZ6SSiJ0kA1ARtUQINA7jbQj45kKGTlcJ4=; b=Ly7sqQiDPXFI3MNeAViReH3CpR
	Y9Ed3XcesUeIC9NHBhQwX1BTAjLix7Edd3fgvRIbNQ7Orrl91q8rUDMe/ZugFabeF/2O1MSE19LW9
	byGSrD1/xK+XTONADRMqpPbenoucCDOfP0VCBH30JCvxJ6/E3qcfbuaOzZDEmON62Fef/sUlFxeuK
	km5gmIo/2hDRboob8bMwSWXrJ5HbU0XpTJ5TfgCt0ChA8pqpOwXjsLi84yEadlF+zCXgM68yr/3dj
	SZDWfL0ihnE6kFz6bN5eji6mYKjYb0MdMB17a5iEFr0AD1DjzEbYcK4fGVKpUlPg/c7UoTv1QUhq8
	pOabWb0A==;
Received: from localhost ([::1]:58898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQPv6-003RLC-JX; Tue, 14 May 2019 05:24:08 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45479) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQPv2-003RL5-5b
 for samba-technical@lists.samba.org; Tue, 14 May 2019 05:24:06 +0000
Received: by mail-oi1-x244.google.com with SMTP id w144so5664800oie.12
 for <samba-technical@lists.samba.org>; Mon, 13 May 2019 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfkqvrJuXKZ6SSiJ0kA1ARtUQINA7jbQj45kKGTlcJ4=;
 b=nvZbrdOeH+8Gkg9ohxEtrozI3s8SMak3XF8NO0QVDbRzlbNHrbI4IYlqan6DCcJBJU
 LBGcdazWQBUlaY537FiJ//IZMw3UpJRvhfuVBrdqkAuzSljDdCazhV04y8UFc/ueL48N
 uxbFwANVRY6UCiU6rMuBz9KjndsyOx48jCW/10QXkZ7Kg9VjyVzLEEs/XfIJAxYvTypz
 YkIMFrOTOmjCje3jyIWLmbuk6B9Jno2V6NzKu00KuGrAxqdsqsYVjKKt3ElLfRNrMBhE
 PiMIXd8AX4ZJEEMv8BryFWqox9M5cxywRJRi5NZhxTEOdXRumA6dq0+Dha8WtXOoOmtu
 h0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfkqvrJuXKZ6SSiJ0kA1ARtUQINA7jbQj45kKGTlcJ4=;
 b=U8J+AFSYtbwfMCK+E8D0pGBx0NKsG9Pn5qb9Rv25YDRg9MTVDekLPpMGxhZ0XWfQDn
 2XMBrX2SiY+v2CSpY31XG/+2KYoHgN4Dd8sCCVno3wyQBusmXoDh+nCpYtL/CN3OYmeZ
 2oH3ML+TF42MJPKNV/KinTes1pO67CsvlHM+ukCvtJ9sqXdSJ26C5mVmmTtvued2YdF0
 ExuQPx4OqJRy/NkhV5rw9GJDfl/3DEoy4qSrRz8Jd8Wg5fIA1P69O/PUIlrLcJaw0m+4
 kAQsgbTtYg5v9VKZuxmuxVEDQwRM2FPmgDo8yldrb8TAeL74P1j3aiS6g6CFapUoIhg5
 TrSg==
X-Gm-Message-State: APjAAAWNP30jdbeGNvv4sWMbG3HBCemZmmKQBireMSUqtrxrCNx9S41g
 TuDa5h3iOjmoUkt7j9tx8CNhKHXHvWcFk+y1MpEJzg==
X-Google-Smtp-Source: APXvYqwvFtR/35A8X5xmv4GSPnzBdraXojjvDgzd0tnj+tpJ3F0FTqYQ3pzYUP4LQhHMxSXOKR1EOE1/APFOrgSYrsw=
X-Received: by 2002:aca:bcc1:: with SMTP id m184mr1768922oif.158.1557811440063; 
 Mon, 13 May 2019 22:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190508113114.2f6ff9f8@martins.ozlabs.org>
 <20190510091943.679a9cf0@martins.ozlabs.org>
 <20190514144352.0cf3beba@martins.ozlabs.org>
 <20190514144604.45acd2eb@martins.ozlabs.org>
In-Reply-To: <20190514144604.45acd2eb@martins.ozlabs.org>
Date: Tue, 14 May 2019 15:23:48 +1000
Message-ID: <CAJ+X7mQrUSAFJGG0R_io_fpRBjLoGwMZy2szFL9622Z+qhQjkA@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tests: Make reloadips tests more reliable (bug
 #13924)
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 14, 2019 at 2:46 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Tue, 14 May 2019 14:43:52 +1000, Martin Schwenke <martin@meltin.net>
> wrote:
>
> > On Fri, 10 May 2019 09:19:43 +1000, Martin Schwenke via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >
> > > On Wed, 8 May 2019 11:31:14 +1000, Martin Schwenke via samba-technical
> > > <samba-technical@lists.samba.org> wrote:
> > >
> > > > The "ctdb reloadips" can fail for a few reasons, including
> > > > colliding with a takeover run already in progress.  This was a
> > > > simplifying design decision.
> > > >
> > > > The tests try to be careful, but there's a startup edge case where an
> > > > unexpected takeover run can be triggered, though it has been delayed
> > > > for a quite a while after startup.
> > >
> > > Please hold this for a while.  This is still failing because it isn't
> > > retrying.
> > >
> > > Amitay, this is almost certainly an issue with matching the error
> > > message, which you queried the other day...
> >
> > OK, the testcase changes were correct.  There was a bug in a previous
> > patch that fixed try_command_on_node().
> >
> > Additional patch included here.
> >
> > Please review and maybe push...
>
> Sorry, wrong patch.  Correct patch now attached...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

