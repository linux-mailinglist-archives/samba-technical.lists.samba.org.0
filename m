Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D49D93DF
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 10:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Se2tdb1z3c/K+zAwesFkMm5Ir/1MKDeTbE+OZtqc/bc=; b=hoczVIsSc2vff450ohSwcoObqd
	rp4gHLkOFAEBZhfJ/nlklCjFtpS0TUfHswTdc8WDB3jddpa5lgzpvtJdNiMnIUzU0tgFatnO7uDc0
	vh5CM+7UfUIdlhLZWHho8giLqZtIIu+oNzK7PfVIqJ57ThR2Qcc/z3XXQEJbBZ4iTq5bZi2p52RYy
	SZ3y0EFozwVY2I93rSsq8VzwrS6WRUqEZhz8Aoc3c4hr4+e1CgHTIOB89VNY1t9Hkftj+QPnx0hPf
	0KI10UeqCHmltsYaO9/KO19lL4qPPTNapB2J3l1iGVHS+IVSYv9IgpovfwK3Sywz2j7f4loe8Zeg/
	rKj2j7WQ==;
Received: from ip6-localhost ([::1]:32314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFrct-000qFI-Ed; Tue, 26 Nov 2024 09:12:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56470) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFrcn-000qFB-3O
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 09:12:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2edc020999fso1573107a91.0
 for <samba-technical@lists.samba.org>; Tue, 26 Nov 2024 01:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732612366; x=1733217166; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Se2tdb1z3c/K+zAwesFkMm5Ir/1MKDeTbE+OZtqc/bc=;
 b=FXlc16aTLF6VIPLVAoMIPT+JPRTSEEo4HPWKk2yXqZsKCzBeB5xSqLHRcl4IFHPc33
 4CzD/1XW7yEJHw2Kqyfp4p4w49It6yq0wAgy09c8CuZ3OoYlCagXLLFT/xGodOwkyx4c
 GcHOqQKlKilNsXT+GkoF+/Zg7wfQj4a7j2ffIcbTDVaiG4V6oVsGZjpZtWEwdZkPLmMj
 4y35KmM/DUCp26gI3eRdidfuFpWPU/7mQptBdqF4UJYYFXx4bkYP4OW4K5xiukjiFcZE
 T6+zi160tc5gI8dbQX7kwjmk+BSYQyG2yxKtU4veZDRXV/cZZ4mBBPggRJoO8CciJitu
 ofYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732612366; x=1733217166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Se2tdb1z3c/K+zAwesFkMm5Ir/1MKDeTbE+OZtqc/bc=;
 b=OhDDDHhoy6jeQXGmaFOTaT+v1w9uE80FdR9siUWk10jT8vCrBA5gcSU7D46JnIOE2U
 tRYDgpBbeSDCYVmE8RbgX01y2BcXY7aFiVIw9jpKL5fYzgx4i2xslq0ZBn1h2fiUnHVs
 JNze3pTk2CX5HLsGT1vBWHw33eYb/EHyE2kwn7KKaz+W+c4DVRNg+8rAy9WW5Ne7Sj1/
 SkdR3AyYqfDIcqVpcyiVhspGb50kD7/fixDPus0rBWts40mUkoaOpDFNDG661KuT5ky0
 rW09uKdfvIellqProGlElJaM+7dQfgdQyhO1LQYPScOSZAykfQPOIeXl5A3M22Oz46o+
 YN+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyc3SYseizRfichJzehT2A7e3HKkyuVXJQjyi9RH5JvVvXDzHb0vxprABUMacDV103M8xQaJkL/WeIqtKvJwU=@lists.samba.org
X-Gm-Message-State: AOJu0YyBbj02Jy6YzLrct6NheJP2kE58/KwYLZ3KmaUbxIvk1z8H+gCw
 hmMc30o0T9A79tK7DSeaj2nbT7GDd5nf4mnT0H0+ReuXltex+mX+SwwCmn2TXcng507EQE2KM1Z
 oTLLYDSABXG0KcDw8cbM9v7rNuPyFdElT
X-Gm-Gg: ASbGncvUyyNLh71FjKb3UuCG83b4XJ0SB86IQCHR1JObemxvWDEnKJ0TIzd0580U6ik
 sql30KBcP7LJvgRMh2oOzozOIYU0Ic88=
X-Google-Smtp-Source: AGHT+IGUW+G7hnGoXwBOqwuF1T253REG35MxZxNXpROJveP2K7ATNk5piFv4XRHY7jq5kjO+K2SJZTFWRwkok9XhHYM=
X-Received: by 2002:a17:90b:2ecd:b0:2ea:8c5c:ff63 with SMTP id
 98e67ed59e1d1-2eb0e86002amr20968880a91.29.1732612366196; Tue, 26 Nov 2024
 01:12:46 -0800 (PST)
MIME-Version: 1.0
References: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
 <99f968a92a7fd8de4a93bc0ee2ed8ffcd2208b3b.camel@samba.org>
 <Z0WJWF0sWSFbAy4E@ketupa.mistotebe.net>
 <7e3dcea1759b018784ca9041c9e378ad7ca3f285.camel@samba.org>
In-Reply-To: <7e3dcea1759b018784ca9041c9e378ad7ca3f285.camel@samba.org>
Date: Tue, 26 Nov 2024 19:12:35 +1000
Message-ID: <CAN05THQs1+qMOtnOPyb3MdxszdWOfHKMREWU7t-XbyeOYuNSQw@mail.gmail.com>
Subject: Re: heimdal 7.8 crash (in OpenLDAP) with spnego/ntlm,
 is this familiar?
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: metze@samba.org, samba-technical@lists.samba.org,
 =?UTF-8?B?T25kxZllaiBLdXpuw61r?= <okuznik@symas.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Back to Heimdal.  Who maintains heimdal right now and who is
responsible to act on CVEs or other issues?
Far as I know Love went into Apple and was never heard of again.
There is someone that monitors and maintains it, right?

On Tue, 26 Nov 2024 at 19:09, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Tue, 2024-11-26 at 08:39 +0000, Ond=C5=99ej Kuzn=C3=ADk wrote:
> > On Tue, Nov 26, 2024 at 10:41:12AM +1300, Andrew Bartlett wrote:
> > > On Mon, 2024-11-25 at 16:08 +0200, Nadezhda Ivanova via samba-technic=
al
> > > wrote:
> > > > Hi team,
> > > > An OpenLDAP user encountered this issue, and since Samba also uses
> > > > Heimdal too, we were wondering if maybe it has happened in Samba as
> > > > well and was fixed? Do you think it is something that can affect
> > > > Samba? There are back traces in the issue but no steps to reproduce=
,
> > > > it seems to happen randomly in their environment, and we haven't ha=
d
> > > > any feedback from the Heimdal team yet.
> > > > I could not find a relevant issue in the Samba bugzilla or the
> > > > commits, but perhaps one of you remembers something?
> > > > https://github.com/heimdal/heimdal/issues/1189
> > >
> > > Samba strictly avoids using the Heimdal SPENGO and NTLM layers, only
> > > selecting the GSS-Krb5 mech to use our more mature internal
> > > implementation and so avoid this kind of issue
> >
> > Hi Andrew,
> > thanks for coming back to us, are you saying Samba got rid of the MEMOR=
Y
> > credential cache as well, the suspected culprit here[0]?
>
> No, just that because Samba has done NTLMSSP since almost forever, we
> always preferred our code that we closely tie to our credentials and
> authentication stack over outsourcing that to an external library.
>
> Any issues with the MEMORY credentials cache, if not just a matter of
> how it is used in NTLMSSP, could still bite us.
>
> > Also are you aware of a way to control what mechs are enabled/disabled
> > through configuration?
>
> No, we just don't call any of the mechs that can choose other mechs, we
> just call directly with the the gsskrb5 OIDs.
>
> Andrew Bartlett
> --
> Andrew Bartlett (he/him) https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba
>

