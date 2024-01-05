Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3DC825A5C
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 19:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EOuNo5QOezjdWI8kaYyfhUK8Zoaff0H0diWFnsQjqgM=; b=UHZMM7R5hLb3xjQXYKnZdFgdv1
	U0Ito+93OKAFTVrJYea3PHoZwV10YNx/t2ofD+NT2W30aa5huyWqupolr6BaZvFTtyoaGuXVk9xm9
	3GshhtVXMCI1IAL3Pf+XwhDGONkVcuQmFpOFrIiOZg8PAECby+j9d1DP9nCPN9sacAV289ZNy17jX
	j4MrsNz0NwBEAERE3rZXWtqsxx+D4SLA0Hs+sm4ZyrZaWyhSF3voEYgjgW73V5VC0RmIdBVJ7A3i8
	PaI3ltRjBc5Gp3hiemzaAt+flzP2HdJFIZGRgWSh4+Pl17g7WrerSPUAKwrqWa5Eil4nIT+dPH2S1
	fnj0W4kA==;
Received: from ip6-localhost ([::1]:18070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLp9O-002XGF-BR; Fri, 05 Jan 2024 18:42:34 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:42209) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLp9I-002XG8-Dd
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 18:42:31 +0000
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ccea11b6bbso8509141fa.0
 for <samba-technical@lists.samba.org>; Fri, 05 Jan 2024 10:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704480146; x=1705084946; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOuNo5QOezjdWI8kaYyfhUK8Zoaff0H0diWFnsQjqgM=;
 b=Isp//Ld3cV8vqoBxSOgqi+wqr56iHtF4ZAyhT7/tbi2+omwgqmYRXdcrpuhJN1o88i
 olE02ESSUALx2xK/DXTEQh8W1chUlfsjozCNgNKX/4XO7IGi5ZV29Dcm+5hWcTUJ2jFZ
 HQp7MNejS78/FS7H5qgDWgYPue8hANUY4fw3uHzzj+me4ZfGUaG9+gWL7shOnqH7zeDy
 1tdw+j+fTp7EbjxyNg8Ml8j9tAutUhlKwln+0abMsJUH1te/hkkp/xc+uVrjaTWB7ac1
 IOY9qJBZ/pwpGbv+ZklOSRprMd3CJ8/ryjGXSuz2EAFfzNVYBe25k/o4ctTTUl711Y6b
 qdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704480146; x=1705084946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOuNo5QOezjdWI8kaYyfhUK8Zoaff0H0diWFnsQjqgM=;
 b=M1o59F37RDs9Bq3gH1dJavQ0xzdj/gdRECxTMi+v3zcHnPbtPVkgNFfOiaeoRLIRiJ
 LmBqNN+uhZGUMwXuUSIc7Voaw9qj/WAWKasTR60WAipuFpFxYsgFce52dunP2eWC3RXa
 kyikBQaDARPdb+clk3YpMkHLePeHOyM5tKMwpk2L908I5dblnu+UMGiPzblGKjr1wPU5
 TTDhQl+8edNsCsgmIiEsXj7QOpCU4v994gWGM73qlUvHaAKOSRuvGHnr7iFs2qXA2sov
 y7VQ83sevgqC4tZvqfP+HALR4QFUpTk3zsX4GiaYHN3wB+qhQ1UXt0OGfW85dIS6lCLI
 XkOg==
X-Gm-Message-State: AOJu0Yzlv1C0H28NYgqfaXKugo3tKwTVVF1QML9oSN/7Qw9MY9RWyLka
 2AEGk43AsEVzlEmygp36lzggUseAZPWNgk20xkg=
X-Google-Smtp-Source: AGHT+IFqcHS2G3StS7fN9hpnVhOEwBTUbrCd9hnmzd7hjVHtULzEoXHgad2OKdhi5WpCUYFBkxmvKraUCjxTzL2RamQ=
X-Received: by 2002:a2e:b8c6:0:b0:2cb:280a:ad3c with SMTP id
 s6-20020a2eb8c6000000b002cb280aad3cmr1840835ljp.13.1704480145576; Fri, 05 Jan
 2024 10:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
 <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
 <242e196c-dc38-49d2-a213-e703c3b4e647@samba.org>
 <CANT5p=oFxQEB5G4CzVuJBkg76Fu-gqxKuFdYJ8NCnGkS-HhFJA@mail.gmail.com>
 <aee2e001-a1a6-4524-a897-de293ef1c034@samba.org>
 <CANT5p=rB4dtk7jp3cP9Wda4J2eG0HcEjGDOt9SCOpx=ho8DzRw@mail.gmail.com>
In-Reply-To: <CANT5p=rB4dtk7jp3cP9Wda4J2eG0HcEjGDOt9SCOpx=ho8DzRw@mail.gmail.com>
Date: Fri, 5 Jan 2024 12:42:14 -0600
Message-ID: <CAH2r5msx0kbajyGbkT82bvZ=cv=EkuV07xYtC-ap=juPzBc7gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
To: Shyam Prasad N <nspmangalore@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>,
 sfrench@samba.org, Paulo Alcantara <pc@manguebit.com>,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 5, 2024 at 4:58=E2=80=AFAM Shyam Prasad N <nspmangalore@gmail.c=
om> wrote:
>
> On Fri, Jan 5, 2024 at 4:08=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
> >
> > Hi Shyam,
> >
> > >> Maybe choosing und using a new leasekey would be the
> > >> way to start with and when a hardlink is detected
> > >> the open on the hardlink is closed again and retried
> > >> with the former lease key, which would also upgrade it again.
> > >
> > > That would not work today, as the former lease key would be associate=
d
> > > with the other hardlink. And would result in the server returning
> > > STATUS_INVALID_PARAMETER.
> >
> > And that's the original problem you try to solve, correct?
> Correct. I thought you were proposing this as a solution.
> >
> > Then there's nothing we can do expect for using a dentry pased
> > lease key and live with the fact that they don't allow write caching
> > anymore. The RH state should still be granted to both lease keys...
>
> Yes. It's not ideal. But I guess we need to live with it.
> Thanks for the inputs.
>
> Steve/Paulo/Tom: What do you feel about fixing this in two phases?
>
> First, take Meetakshi's earlier patch, which would fix the problem of
> unnecessary lease breaks (and possible deadlock situation with the
> server) due to unlink/rename/setfilesize for files that do not have
> multiple hard links. i
> .e. during these operations, check if link count for the file is 1.
> Only if that is the case, send the lease key for the file. This would
> mean that the problem remains for files that have multiple hard links.
> But at least the hard link xfstest would pass.

Since this approach could be a huge performance degradation for some
(albeit rare)
workloads (e.g. if hardlinks exist for files, but such files are not opened=
 by
different names at the same time), I prefer the two phase approach
that simply retries when we get invalid argument without the lease key
(which has no risk since the current code just fails, and retry will "fix" =
the
issue albeit not as good as being able to cache the second open)

> As a following patch, work on the full fix. i.e. maintain a list of
> lease keys for the file, keyed by the dentry.
> This patch would replace the cinode->lease_key with a map/list, lookup
> the correct lease from the list on usage.
> This would obviously remove the check for the link count done by the
> above patch.

I don't like the idea of hurting caching for all hardlinked files as a hack=
,
so for the longer term solution I prefer a solution that caches the
dentry pointer with the lease key, although that brings up the obvious
question of whether the dentry could be freed and reallocated
in some deferred close cases and cause the lease key to be valid
but us not to match it due to new dentry).

I lean toward something like:
1) store the dentry for the lease key, not just the lease key in the
cifs inode info (today we only store the lease key).
We could store an array of lease key/dentry pairs but I worry that
this would run the risk of use after free and/or lock contention bugs
(and additional memory usage if a malicious app tried to open all
hardlinked files)
2) if link count is greater than 1, check that the dentry matches when
deciding whether to use the lease key (presumably
we don't have to worry about it link count is 1)

--=20
Thanks,

Steve

