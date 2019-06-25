Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D252213
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 06:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uRf0dWrdC5H1LWg6V+CKqSbe58i7VdyTOB5icBfYg1M=; b=CXzxmlE6hf6kEWB96hIAMfrqGt
	oc2LrRTFy5ukkelmM8F2TVf9pBINfZ1A57iUsbzMY9gc64kTPFeOq2A65Tx9v8xrhr76BYatOURu5
	K0UgUREJn8YxcKbbKmwudaNd32+nVoi0NN9J48ppKJIaz2qzjUWjhKfo9aGQFlnMHdEjBWYaSI1db
	OUKTJLT5GPVrihxVmXb5E3rvL//gwT/gQM4z8MtKxU0WswaDZy3nBFvef8hOtfZOGLGXBJyDyT9Wi
	xU1eRoj5W4plgA3woR+ovOW4A8lwnjDz97fckPa/dWh8wd5PeYsjKOQ4OIDcFa7yoHysKyISo+uUt
	Fl6ux1/g==;
Received: from localhost ([::1]:40226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfd0s-001YMJ-3N; Tue, 25 Jun 2019 04:24:58 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54785 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfd0m-001YMC-56
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 04:24:55 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45XtNV5tgJz9s3C;
 Tue, 25 Jun 2019 14:24:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1561436682; bh=O6JyYTLtYGVMi/dJOm5Vw78HYWdWd0BaBeiDkbDlvQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kf1I0lvPiPdjYCpuTZIMryPLuxs5SLCWxAEKdhZlvD18NoqgZTu4O/oKyIycbLrwo
 zkdDacPPBVT46d6oCS6l+pzd+TV+dlymJQpCzOAdHkpPeVM6LwW52evQZXlssuGs0L
 NLxPBNnUHhKxABTS1cIIZXtPnCKpNwvf261KkPP52GIeeF0D8ckTZNzyW5WL6AM/BI
 pvWPHDQuzD48JpIJZF6XMErUV3B/rdqMiLJvIuSnCxPK3nX7HzVkMlMpclCNzG1sVI
 s5GhhQ+vBpxbPhUWw7x1sV+LIU71kQELgt9bbjFalvQ7N+gDfWThFsF7nAIkV50vao
 89pQhqfNKngDQ==
Date: Tue, 25 Jun 2019 14:24:41 +1000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190625142441.7dd96a4f@martins.ozlabs.org>
In-Reply-To: <1561082290.28284.28.camel@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org, cs@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On Fri, 21 Jun 2019 13:58:10 +1200, Andrew Bartlett
<abartlet@samba.org> wrote:

> On Fri, 2019-06-21 at 11:14 +1000, Martin Schwenke via samba-technical
> wrote:
> > On Fri, 21 Jun 2019 13:05:17 +1200, Andrew Bartlett via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >  =20
> > > I gave a talk at SambaXP about our first year with GitLab, and one
> > > point I made is that it is *not OK* to have public contribution
> > > documentation that does not match our actual practice. =20
>=20
> > > So, I would like to propose this.  That given the practice of the Sam=
ba
> > > Team and almost all contributors is to contribute via a merge request
> > > against https://gitlab.com/samba-team/samba that we document this, and
> > > only this, as how to contribute to new patches to Samba.
> > >  =20
>=20
> > I don't think it is the practice of the whole Samba Team.  I haven't
> > managed to get into the GitLab workflow, though I have used it.
> >=20
> > Perhaps I'm the only one, but I don't think we should be mandating this
> > (yet?)... =20

> Thanks for the feedback.  I should have checked rather than working on
> a 'gut feel' and I see you are still using samba-technical a fair
> bit[1]. =C2=A0

Yeah, probably...  ;-)

> I would say that aside from your patches, the vast majority of the
> patch flow has moved to GitLab.

We don't know how existing contributors who haven't been busy with
Samba lately prefer to contribute.

> To help us present a clear process, do you think you could embrace
> GitLab, if not for the benefits to you, but for the sake of our new
> contributors?

> The alternatives are (to my mind):
>  - Contributors get ignored on samba-technical (both because the
> patches are not known-good and because they are not on a clear to-do
> list)

I've just submitted some fairly simple commits via GitLab.  However,
one of them sets off alarm bells for me because "there must be a reason
why it was done this way".  CI passes... but I'm not labelling that
commit "known-good" until someone else takes a careful look.  ;-)

>  - Contributors other than yourself keep getting told off for doing it
> 'wrong'.

I'm not sure why we are doing this.  For a simple patch that is
obviously good, I don't think we need to chase people to do extra work
via GitLab.  That may actually discourage them.

> What do you think?

I'm happy to use the new process as much as possible.

However, I'd like to be sure that the new process is getting us some new
contributors before we become too prescriptive.

For example, https://www.openhub.net/p/samba says that we're down 17
contributors from the previous 12 months.  I think it'd be a very long
bow to draw to say that this is because we've moved a lot of activity
to GitLab.  I'm in no way suggesting there is a correlation.

That said, we should look at some data before we force all contributors
to use GitLab.  If we just force the change then we just get a
self-fulfilling prophecy where the contributors that hang around are OK
with that process...  but we don't know how many decided that it was
simply too hard...

peace & happiness,
martin

