Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA62E241627
	for <lists+samba-technical@lfdr.de>; Tue, 11 Aug 2020 07:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8MrX50JHle7jPE35ktWgmYgrAjnkb/lJ8Yvn7jj5OS4=; b=0p2+XM4PmeRpOfxHsy13pvZIKY
	0Kfsw+vQdGX+ZaQImcsGc3A3XVOXKtfZXv6v2Njzr7/sdmX67t5uyXk/sLswDVlatVZyovSuJxrNw
	mXspGxBNbjFv1oXd7aIM9PfvT2OJQmzZ46HMjryZThd7t/bIFz5aJjDKxMf2UAV90jU8C75txSk6/
	rWiaCcmlfpchlC55HTrqL3czeatUF8cp7iXvbCJGvfPOlKL7hV9r7R43eROAPM5DBw0FBlZoFKemY
	gt0UXzZfSOhW+HH21gGu+Ql7tdTyygNR2VoIuIW6XbMJViw88QtKN1MgPfMZvs2qkTxY+4FVMapiq
	QIhyY55w==;
Received: from localhost ([::1]:22176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5NJ9-00DAux-TS; Tue, 11 Aug 2020 05:58:47 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:47076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5NJ2-00DAuq-VA
 for samba-technical@lists.samba.org; Tue, 11 Aug 2020 05:58:44 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id j10so5434826qvo.13
 for <samba-technical@lists.samba.org>; Mon, 10 Aug 2020 22:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MrX50JHle7jPE35ktWgmYgrAjnkb/lJ8Yvn7jj5OS4=;
 b=PmOuk//MyDkxKVMaxiqa7Xd2711aa9n4+ct8vshtDbX5FW9SBa+boCJV2EQYLK5337
 GTZMui1+aKxkdDGQ32aYOei1n3cN6ycEylIT2I5Pu9io4puidci1uUTfH5XE6sNnyIct
 nS4+LqjEq8dCvRDFkQdUuCD0SFFudbnsCB1qAycvHyRIiz+XFrxxUK7KytAX+WcfKUJ9
 wZdAPrjFSZ5z/lSOuvn6p0gZcRlnm9Xzf42tSPKc7EoK0LmXw+V6BslUtDJa46LnPX+j
 Gtfb/zq1YtWRwtpLvHw74FDdWeN2H0TsRrvUP+iSFs+2LizgbtrRHhGAcM1R8uB7Xg0T
 iDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MrX50JHle7jPE35ktWgmYgrAjnkb/lJ8Yvn7jj5OS4=;
 b=RcMVDoBesWKUtfwWhHaqNgDyaQbZJhlJuNNjCtsfGCOCcK94vIjt/0Lw0K5GCXbffD
 tUDSOUcT2uMl9VUCbDy3BhzOK1OOmht8xTDUpV/U5GDUlBtngGBArHrvPNnpbYUsbzz5
 B7OtY8SgcE2N55oO49hRgPg4dDl1r95zhqobDN31FPdf/KEwnwkHqEo8iJMU0KC4mbRn
 T+OTOiHLaQOPrxPUmRXSezwipjcJEGEjz697mL1rgKHsrDcxoh/bm3QsLA/zYhgR+oJe
 U6NtrKFjV5Zcd9KnxbfhrbpLCMBdpyS/kQqe1KfeJrCIOZee+Umwqg6PdEqbiLruv+ec
 zg4w==
X-Gm-Message-State: AOAM531h5vAG72l8qHlDwZNbwdkScaXzE6wmSZl3MokWXDkdG6hctv31
 XAt1rpEBW+NtipUP18YljUBoCP5sjRH6Aex8kRjUjqY8Mps=
X-Google-Smtp-Source: ABdhPJwzRQEY/rxGrERgKwtCbfnedd0CTIgUYBlo849qfC04O50YcOt4z5MFSpOAIhJsAE44yF0Z/6mK3PcVO0jvlBQ=
X-Received: by 2002:ad4:518b:: with SMTP id b11mr32353112qvp.139.1597125516307; 
 Mon, 10 Aug 2020 22:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <b643061e-177f-727a-542f-54ed3c1c358f@samba.org>
In-Reply-To: <b643061e-177f-727a-542f-54ed3c1c358f@samba.org>
Date: Tue, 11 Aug 2020 07:58:25 +0200
Message-ID: <CAC-fF8RMcM1ydPiyL0PkkKxkV2CHTB=x67gThJjgSXXxmOy6FQ@mail.gmail.com>
Subject: Re: The way to using s4u2self in winbindd
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze,

On Fri, Aug 7, 2020 at 2:17 PM Stefan Metzmacher via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> As the work in the last month revealed that there're quite some
> missing features around S4U2Self in existing Kerberos libraries
> (Samba's (lorikeet-)Heimdal, Upstream Heimdal and Upstream MIT Kerberos)
> and it's harder than expected to fill the missing gaps, this proposes
> to start with the feature set that currently exists and prepare the
> infrastructure in Samba first. From there the remaining parts can
> be added as required.

If we are willing to do with what we have, then for basic local-realm
S4U2Self I think we have got what we need upstream, do you agree? it
would be nice to have something to aspire to, not pending upstream.

For MIT, i hope to cleanup the initial work soon (almost ready):
https://gitlab.com/samba-team/samba/-/merge_requests/818

> So far there are a few challenges, which prevented further
> imports in the past:
> - Samba's AD server testing relies on (and only exist of)
>   only a few smbtorture tests, which rely on the internal behavior
>   of Samba's Heimdal copy using the send_to_kdc hooks.
>
>   Heimdal's internals have changed in the meantime
>   and it's not trivial to adopt the torture tests
>   to the new. Given the little coverage these tests
>   have it's even more wasted time.
> - Importing new KDC code (with hidden behavior changes)
>   always brings the risk of breaking the AD DC case
>   with Windows clients (and other external clients).
>
> Recently Samba got a new framework for testing
> kerberos using python's pyasn1 and some crypto libraries.
> This enabled very exact tests for almost every
> bit in the protocol. The 'master-krb5-testing' branch
> already contains replacements for some of the smbtorture
> tests. These tests are developed against Windows KDCs
> and they reveal exactly the differences between Windows,
> Heimdal and MIT KDCs.
>
> Spending time on these new tests removes the
> blockers in two ways:
> - We no longer rely on send_to_kdc internals
> - We have more confidence to avoid hidden regressions
>   by updating the new KDC code.

Yeah, replacing the smbtorture tests with the new framework, is
definitely the way forward (and it also gives us the same level of
testing for MIT).

> [Task#03] Add S4U2Self protocol tests
>
> Given the new pyasn1 based kerberos testing infrastructure,
> we should develop tests, which are able to talk to multiple
> trusted domains. These tests should be able to decrypt
> all packets in the complex request chain to get an
> S4USelf ticket via trusted domain boundaries.
> It also needs to work out the behavior differences
> between the old PA_FOR_USER and the new PA_FOR_X509_USER
> versions of S4U2Self. The interaction with enterprise principals
> is also a very important aspect to test.

I think PA_FOR_X509_USER isn't a must, the only real advantage of
PA_FOR_X509_USER is that is uses the checksum of the tgt, instead of
hardcoded hmac-md5 (which is what heimdal does with PA_FOR_USER
incorrectly anyway, and gets along with it).

BTW we shouldn't implement PA_FOR_X509_USER for old enctypes in
Heimdal at all, we should use PA_FOR_USER only in that case, as
Windows clients do.

The PA_FOR_USER also works fine with enterprise principals, it
triggers client-referrals to locate its realm (although, names aren't
canonicalized either way).

> Together with a bit of research how Windows clients do
> S4U2Self, we should have enough information in order to
> implement the missing C code in the upstream Heimdal and
> MIT libraries.
>
> Windows 2012 and higher have an "Attempt S4U2Self o optain claim
> information" setting, maybe that can be used together with NTLMSSP
> to trigger S4U2Self from Windows.

The simplest is with powershell:
 `[Security.Principal/WindowsIdentity]::new('username@REALM.COM')`

I also wrote a tool once to test with certificate:
https://github.com/iboukris/S4U/blob/master/win/lsa.cpp

> [Task#04] Disable transited checking in gss_accept_sec_context()
> https://github.com/krb5/krb5/pull/1005
> https://github.com/heimdal/heimdal/pull/656
>
> When dealing with trusted active directory domains,
> it's currently needed that the user of gss_accept_sec_context(),
> which would also be used for S4U2Self in winbindd (via gensec_gssapi.c),
> would have the full trust topology defines in the [capaths] section
> of the used krb5.conf, because Windows KDCs don't set the
> transited-policy-checked flag, while they already checked
> policies and verified the ticket can be trusted.
> Also domain members servers in active directory are not
> supposed to know the topology, they should just trust
> the KDC of the primary domain.
> In order to accept kerberos authentication from trusted domain
> via S4U2Self (but also any other protocol), we need a way to
> disable the check in gss_accept_sec_context()
>
> The referenced pull requests for upstream MIT and Heimdal,
> contain working patches, which already come with testcases.
>
> But as these patches instrument the legacy gss_set_cred_option()
> call for the acceptor credentials passed to gss_accept_sec_context(),
> the changes are rejected for upstream inclusion to Heimdal.
>
> There's no agreed solution available for what to use
> instead of gss_set_cred_option().
>
> We should have the same interface for both Heimdal and MIT
> in order to avoid #ifdef's in Samba.
>
> There is most likely quite some time required to
> resolve the discussion.

Not sure it helps, but maybe we can try to suggest a simpler approach
for the time being, like a krb5.conf option..

> [Task#05] Implementing the missing S4U2Self features in upstream MIT
> https://github.com/krb5/krb5/pull/1014 (stepwise S4U interface)
> https://github.com/krb5/krb5/pull/1005 (NO_TRANSIT_CHECK)
>
> As outlined before Samba wants to use the krb5_{init,tkt}_creds_step()
> APIs, but in MIT (up to krb5-1.18) S4U2Self is not supported via
> these APIs. PR 1014 already has some of this implemented,
> but we should better wait for the outcome of the S4U2Self protocol tests
> in order to judge if this is feature complete and does everything
> Samba requires. It be very bad if we would need to handle even more
> combinations of half implemented features in Samba.

Actually S4U2Self was never supported in stepwise, what changed in
krb5-1.18 was that i broke the S4U2Proxy stepwise interface (for
RBCD). The hope is to get both fixed with PR 1014.

Thanks!

