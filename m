Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E464E2A3
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 11:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=A+MfKWsyGQwEp61p5uosyxTH4Emqjxpvm8w+5OICuk0=; b=YrnnAJIEceYTHKvDtk5Cmg7es9
	m09wqh6ZzFcYqL2K5yYSpSmKgYIyxUMEe7i/LQg64PoRdVVX9tNCSFGPzYTvIHEeyOwKUb8MXyKYu
	uTWWDQxxllmNxQKvQ/AyoQiVBD18zAvxRlqNd2bJocukiratIq5YSyDFwFGjIfM3JeIJR7iNfAP9M
	RMx1eciAjdxO70uEG9LgOQyRhq9f2kOfQBJVNswoTFtoyax96Bxael/mF7kekt7V9lY1ra/a5GwpW
	OLn8aHKyH43Nfr/sGi8uGtjQLjLPzGv5koCm+jgkF1FlVJYRxt1sYJXVqneNwXnmJ1lNBqmTFnHyc
	gf7kRg2w==;
Received: from localhost ([::1]:20606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heFUk-000ujO-BF; Fri, 21 Jun 2019 09:06:06 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:39173) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFUe-000ujH-Qs
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 09:06:03 +0000
Received: by mail-io1-xd44.google.com with SMTP id r185so1412359iod.6
 for <samba-technical@lists.samba.org>; Fri, 21 Jun 2019 02:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+MfKWsyGQwEp61p5uosyxTH4Emqjxpvm8w+5OICuk0=;
 b=GqoG/ugYsVO6TPkGDyssAyNrm2aMGzmPVjZDYvlij0kfPtBSROWu2C2rh37mXYdJe/
 SUmBA3gVIU+79Isr1L9gcQq8PWD/2WP9bwDJkhyku6eAepwqLoZFUlP4g/tWiq1Zp2cR
 i70GJrmya4MtjV6C0er7eKtqHr5hLM+hXrhjcGkpzdSo7qm3/sV5yNUGI6z/P4to7s7B
 LcqyifnHeO45nERg38sGVGGzWrAT/EFPbzhzu+7ikBmcYyOUKB+2jai3d7o/eGdaGQ7m
 8EjrPTfqWS2sazIy9CwsD6d/AzRytFNCguW5vpkrMT4ePYGOvi+CTpQwqzHYmVxMS8LM
 RMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+MfKWsyGQwEp61p5uosyxTH4Emqjxpvm8w+5OICuk0=;
 b=MDDlfKlIvx40pCvgVAP93PtZ6SovJF2rdsDqoPeDxAexYXHklL4rTVaY2gOSp24J6m
 uxaIzNC08GLcBUre+AzQQGR166yLDqO+6DeDcsuiO6Cy30JWVRNj7VE2QZ5rwIK3ywKN
 tJupvV+MdY2LCvRApFoMy6dIIjbOHafMdlhYWhHvmsayNWizkzQpQevazKqjsVwE0Hzw
 di+k/Eh4g49ETGKhyazxfwxMdVctQBpSH7LC/Xe0f+QWr5hLgnMCOeJ3WQMYBU2yoQD8
 xuEqXSY0FlvtQDYZuuszon7CZ7qzZNfUVu6OBHXH3hR26rKIA3+gUAfdqa8FJC2mFmxT
 hIMQ==
X-Gm-Message-State: APjAAAVgyEdj1jjP2M6nlyATEocErsi7MP62R2Ah3rzvpZ/mUPdLdOqc
 ZH6Jy04lamQwGB+CD5D9YovZSSco9lPSRQeWG37n7A==
X-Google-Smtp-Source: APXvYqxlxgmAezv27iLHfEMmgSA1KyaoMqHm6TetTjvLZkGRSchCxGSxQrX5ZKrBohWw9dxlLMTzQJ1Nqfa7/oTnhfA=
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr5930428iob.219.1561107959197; 
 Fri, 21 Jun 2019 02:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
In-Reply-To: <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
Date: Fri, 21 Jun 2019 19:05:47 +1000
Message-ID: <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think something like this needs a lot more discussion than "need new
process because I don't want to read patches."

Now, samba is a very active project, and like the linux kernel, a very
unusual project in that almost all main contributors are
paid to work part or full time on samba,
That is not the norm for the average open source projects.

Anytime you add special hoops and gatekeepers to contribute patches
you will turn away new contributors.
That is fine if you don't see it as an issue if it might turn
occasional contributors away.
The norm for most open source project IS to send patches to the list
and get feedback on them.
Even the linux kernel works that way, although it is split into
several subsystem specific mailinglists.


I think from what you are saying is that the real problem is that
contributors send patches to the list but the core
developers do not care/ do not want to do patch review, and that is
why the patches are ignored and forgotten.

If that is the problem, then just changing to a much much harder and
different process to  contribute patches
is not going to address the problem. I mean, if people can not care to
review patches that are sent to the list, why
would you think people would review the same patches if they were
contributed via a different mechanism?


If the problem is that core contributors do not want to or have time
to review patches then the correct solution would
probably be to have everyone set aside one day a week to work on
project hygiene, and spend that whole day ONLY on working on
patch review rather than invent a new system that might stop these
patches from being submitted in the first place.

You even say in a post that you don't care and wont review any patches
that are sent to the mailing list.
If that is how most core developers think of patch review, maybe that
is the actual problem.


Flamethrower off.

Regards
Ronnie

On Fri, Jun 21, 2019 at 6:30 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Fri, 2019-06-21 at 09:01 +0100, Rowland penny via samba-technical
> wrote:
> > On 21/06/2019 08:44, Andrew Bartlett wrote:
> > > On Fri, 2019-06-21 at 08:13 +0100, Rowland penny via samba-technical
> > > wrote:
> > > > Sorry, but I do not think it is 'wrong' to not want to use git-lab.
> > > > Perhaps we should 'prefer' people to use git-lab, but we definitely
> > > > shouldn't tell anybody off for sending a patch directly to samba-technical.
> > > >
> > > G'Day Rowland,
> > >
> > > Can you elaborate a bit more?  Can you explain a bit more why?  Can I
> > > help you set up your account?
> > >
> > > It would be really good to have you on-board.
> > >
> > > Thanks,
> > >
> > > Andrew Bartlett
> >
> > I wasn't actually thinking of myself.
> ..
> > I was thinking of other potential users.
> >
> > Rowland
>
> Thanks Rowland.
>
> I would say that is the same for me.
>
> So, for those other potential users, I think we both want to guide
> users to the path of most likely success, right?
>
> The problem as I see it is that sending the patches to samba-technical
> risks them simply being lost, particularly if folks are not 'told off'
> and re-directed to GitLab.
>
> Quite bluntly, I don't review patches sent here.  I simply don't have
> the time to spend on it, and on the flip side the merge requests
> page[1] is a great TODO list for me.
>
> Now, thankfully, I'm not the only reviewer, but it makes me feel sad if
> we document methods with a lower chance of success alongside the way
> that works better for both reviewer and submitter.
>
> If the submitter doesn't send the patch to GitLab CI, someone else
> needs to, and then be the human messenger when it fails etc.  (This
> leaves less time to review patches, which is why I don't do that any
> more.)
>
> It makes me sad because I feel for our contributors, and I want them to
> feel that if they follow our advise, their patches will be well
> considered.
>
> Given that, do you see the advantage in having a single, uniform,
> 'right' way to submit patches?  Is there anything more I can to to help
> you support, or at least not object to, my proposal?
>
> Finally, I would encourage you to try out GitLab, it is much easier to
> support something you have used, and my offer still stands.
>
> Thanks,
>
> Andrew Bartlett
>
> [1] https://gitlab.com/samba-team/samba/merge_requests
> --
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba
>
>
>
>

