Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A471701B0
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 15:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=r1wRVGOw/Aicst/SP4laFS7+ZdiWnjLIF1oAmKE137U=; b=EEPLpwOGmmRpMQkExya9w6ywiV
	Cc92izIqZNzy8G0j53A+15Q9dejRj0I4nBbO81K0oOMLk7fyLysU0lrMXfnpAmbQZwiGA0DDkQVXs
	1YYlujXaTFB/vsXtHzXGyKR3Ujldto13Zh+0v3u+tG9e1pIfh1MajQDdvS+4fviiVy7gp7rmTVA9d
	YDhrQW8Bqtm0V/rpLcsbvUIASoPRTNjMEQMwB64CM9H6PKxjXtofdblkRe2xBXKJ1weJDsi9h+YXK
	IBzh36jQsm3zslOchpXjc2fbkO00h0ORBQKru8ad+gtV9w8ylXM5CASsLO7G75alC/T0h2iqDDUiF
	NR3hP2mw==;
Received: from localhost ([::1]:57586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6y8F-00BnzA-Ks; Wed, 26 Feb 2020 14:57:51 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:43687) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6y8A-00Bnz3-NZ
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 14:57:49 +0000
Received: by mail-lj1-x230.google.com with SMTP id e3so2372538lja.10
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r1wRVGOw/Aicst/SP4laFS7+ZdiWnjLIF1oAmKE137U=;
 b=NkMY0O9dTSz0IIzL8a1lsy2RGPbAy8EZ3/8VWUjiNoH+fT3o+tfwr5OHyj0JnI7jZE
 FwKz+Z59qLtHd7qRMy+nhjUycCy8wt9DqD0rMYcQrPVen7A/DfPPghrWFiSNzDebDR5J
 FzYn9tFUCGIj515VL4jdJtRhI8bI6GmjtLmXUNJdvPX+UzsBA7AcW0HahqA9qSkkgrUF
 55p4YhKu8gC92L7cp/rO0SRR23SL745p6gP2px8rAGCD9y1xSv/2r7j9b3PvbgDn9pBx
 XQB4di9KfD/7MhKgD0IMefvfYkeoAO3DRdH2xI5bOZpAffjJGcg2D0PUjDHTyIHH5UMy
 xvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1wRVGOw/Aicst/SP4laFS7+ZdiWnjLIF1oAmKE137U=;
 b=IJDiinKcFgwdDX4/Jr9HTbiA8ZLg5WTs/TxzC72GDbfnStC7Cnng6gx51+FBMIkzW+
 Zol24yMVFRdkN/CjcFj1nJL1cDxMdhrsJaUMbFX02gxHXLvqUwJgGvDmTxZ948Uj0N2u
 FbRohO+lflqc/hV1qpxtnRd8Swr7u/1yqEFUm0nRNyYa9rtvcSvUIqujZ0khypPAdKB2
 B9aSBy0MQGclTt0saxYcCQta9I2C21J721ldyVHPhS9A3sl601XCwliOUjgqNDAdk+0I
 xps5hySTMjh3FiQ6lyLL8WJ7wFYZRrbSqgfGE/bEdf18NtIJfTmmU63w6hdTO86u8wVL
 bo9w==
X-Gm-Message-State: APjAAAVr+CplV6d5WNLwuwpSyB9nhiEyp1bHDxgFFR+9PY8uRuJ/vMH5
 zUXEjgQkGsFCoZFkkr3hOQkiGqlIlDUWgFASkun41Kmf0yw=
X-Google-Smtp-Source: APXvYqxKpCKRGEraprMhPeLYxd8XQcUZ0xjNRDtOu9g8+7L5uu//+uyaJTIDmZVM/mDw8wYEPGqeqh572K5sObfG0bg=
X-Received: by 2002:a2e:a408:: with SMTP id p8mr3405087ljn.145.1582729064924; 
 Wed, 26 Feb 2020 06:57:44 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
 <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
In-Reply-To: <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
Date: Wed, 26 Feb 2020 15:57:33 +0100
Message-ID: <CAC-fF8RVr4qA1HSthHiRn1eaWWxwN=ke8EtfZPMbQmK+Wf+ajQ@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 26, 2020 at 3:39 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 26.02.20 um 15:21 schrieb Isaac Boukris via samba-technical:
> > On Tue, Feb 25, 2020 at 9:17 PM Isaac Boukris <iboukris@gmail.com> wrote:
> >>
> >>> I looked at it a bit, see
> >>> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
> >>
> >> FYI, I got net-ads working against AD server by adding some logic in
> >> source3, look:
> >> https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-metze-cbind
> >>
> >> However the fixed clients aren't working against samba server yet,
> >> unless require-strong-auth is set to "no", while non-fixed clients
> >> still work. I get this error (I also wonder how can I trigger the
> >> source4 client code).
> >
> > Actually, Windows client seem to work fine against your source4 server
> > code, even with require-strong-auth=yes.  So I'm still missing
> > something on the client side :(
>
> Why? I guess the server just completely ignores the channel bindings.

I need to debug the server, but it fails the fixed net-ads and
ldapsearch which works against AD, and doesn't fail windows clients.
The only difference to my understanding, is that Windows client will
add the ad-elements, can that be the cause?

> What application on the Windows client uses ldaps?

Run "ldp.exe", it has everything.

> Note that I fixed the channel binding checksum for NTLMSSP here:
> https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=e5afb9ff2aa23d43d0b968a3eca7ceffe1c8d606
>
> With this commit where're able to pass the LdapEnforceChannelBinding=1
> checks:
> https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=ad59689961c860e38fb1d0e8c8996070faf77180

I'll keep rebasing on metze/master-auth branch.

> So for NTLMSSP the presence of MsvChannelBindings means strict checking
> of the provided channel bindings, even if 16 zero bytes are send.
>
> For kerberos only AD-AP-OPTIONS means strict checking and not ignoring
> 16 zeros.

So they are the same flag I guess.

> And MsvAvTargetName is similar to AD-TARGET-PRINCIPAL.

Thanks!

